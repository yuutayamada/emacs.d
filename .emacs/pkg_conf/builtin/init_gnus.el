;;; init_gnus.el --- init file for Gnus

;; Copyright (C) 2013 by Yuta Yamada

;; Author: Yuta Yamada <cokesboy"at"gmail.com>

;;; License:
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;; Commentary:

;;; Code:

(require 'my_autoload)
(require 'cl-lib)

(defadvice gnus
  (around ad-move-to-other-window activate)
  "Move to windows.el's n window before boot gnus."
  ;; 12 = n -> news
  (win-switch-to-window 1 12)
  ad-do-it)

;; Set this value like '("foo@gmail.com" "bar@gmail.com)
(defvar my/gnus-multi-address '())
(defvar nntp-authinfo-file "~/.authinfo.gpg")

(let ((dir (expand-file-name "~/gnus/")))
  (defconst gnus-directory                 dir)
  (defconst gnus-article-save-directory    dir)
  (defconst gnus-kill-files-directory      dir)
  (defconst gnus-cache-directory   (concat dir "cache/"))
  (defconst gnus-dribble-directory (concat dir "dribble/")))

(require 'gnus)

(if (version< emacs-version "24.4")
    (require 'gnus-setup))

(require 'gnus-agent)
(require 'smtpmail-multi)

(my/set-keybinds :map gnus-summary-mode-map
                 "C-o" nil)

;; Use gnu-topic-mode by default
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
;; Save group and topic structure before quit Gnus
(add-hook 'kill-emacs-hook 'gnus-group-exit)
;; Apply diff face
(add-hook 'gnus-article-prepare-hook 'my/apply-diff-face)

(let ((coding 'utf-8))
  (setq gnus-article-save-coding-system   coding
        gnus-agent-file-coding-system     coding
        gnus-ding-file-coding-system      coding
        gnus-cache-coding-system          coding
        gnus-cache-overview-coding-system coding))

(setq mm-text-html-renderer 'w3m
      gnus-select-method '(nntp "news.gmane.org")
      gnus-newsgroup-limits 100
      gnus-newsgroup-limit  100
      message-send-mail-function 'smtpmail-multi-send-it
      send-mail-function         'smtpmail-multi-send-it
      ;; Cc: and Bcc: to header of message-mode.
      message-default-mail-headers "Cc: \nBcc: \n"
      gnus-use-cache t
      password-cache-expiry 20 ; seconds
      ;; gnus-use-mailcrypt nil ; comment out from emacs 24.4
      gnus-cache-enter-articles '(ticked dormant read unread)
      gnus-cache-remove-articles nil
      gnus-cacheable-groups "^nntp" ;"^nnimap"
      ;; gnus-uncacheable-groups
      gnus-check-new-newsgroups nil
      gnus-posting-styles `((".*" (name ,user-full-name)))
      ;; treats wide character
      gnus-use-correct-string-widths t
      ;; Do not ask online or not.
      gnus-agent-go-online t
      ;; do not goto cursor to unread group.
      gnus-group-goto-unread nil
      ;; show also user-agent.
      gnus-visible-headers (concat gnus-visible-headers "\\|^User-Agent")
      ;; extra headers to parse.
      gnus-extra-headers '(To Newsgroups X-Newsreader
                              Content-Type CC User-Agent Gnus-Warning)
      nnmail-extra-headers gnus-extra-headers
      ;; If member of thread that includes new article has old
      ;; article, grab old articles to display thread.
      gnus-fetch-old-headers t
      gnus-parameters
      '(("INBOX"
         (gnus-use-adaptive-scoring nil)
         (gnus-use-scoring nil)
         (visible . t)
         (display . all)
         (modeline-notify . t))))

(defun my/gnus-init (address-list)
  "Set variables for Gnus and smtpmail-multi.el from ADDRESS-LIST.
You can set address's list to ADDRESS-LIST like:
'(\"foo@gmail.com\" \"bar@gmail.com\")"
  (cl-loop with address = address-list
           with port = 587
           with authfile = nntp-authinfo-file
           with accounts and credentials and associations
           with imap = (lambda (host-and-user-name)
                         `(nnimap ,host-and-user-name
                                  (nnimap-user ,host-and-user-name)
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-authinfo-file ,nntp-authinfo-file)))
           for addr in address
           for host = (car (split-string addr "@"))
           for name = (intern host)
           for template = `(,host "smtp.gmail.com" ,port nil nil nil nil nil)
           do (add-to-list 'gnus-secondary-select-methods (funcall imap host))
           collect `(,name . ,template) into accounts
           collect `(,host ,port ,user-full-name authfile) into credentials
           collect `(,addr ,name) into associations
           finally (with-no-warnings
                     (setq smtpmail-multi-accounts     accounts
                           smtpmail-auth-credentials   credentials
                           smtpmail-multi-associations associations))))

(my/gnus-init (bound-and-true-p my/gnus-multi-address))

(provide 'init_gnus)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_gnus.el ends here
