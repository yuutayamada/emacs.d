;;; init_twittering-mode.el --- init file for twittering-mode.el

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

(eval-when-compile (require 'cl))

(require 'twittering-mode)
(require 'my_autoload)
(defvar my/twit-users '()) ;; specify username's list without @
(defvar my/twit-password-direcotry "")
(defvar my/twittering-initial-search nil)

(defun my/twit-select-user-name ()
  "Select USER NAME and set file path that used the name to twittering-private-info-file."
  (loop for user in my/twit-users
        if (y-or-n-p (concat "Use user-name of " user "?")) do
        (setq twittering-private-info-file
              (concat my/twit-password-direcotry user ".gpg"))
        (return (minibuffer-message
                 (concat "Set twittering-private-info-file to "
                         twittering-private-info-file)))))

(defadvice twit (around Y/set-privete-file activate)
  ""
  (unless (get-buffer ":home")
    (my/twit-select-user-name))
  ad-do-it)

(setq twittering-initial-timeline-spec-string
      (append
       (list ":home"
             ":replies"
             ":favorites"
             ":retweets_of_me")
       (loop for var in my/twittering-initial-search
             collect (format ":search/%s/" var))))

(setq twittering-tinyurl-service 'bit.ly)

;;; configurations
(setq twittering-auth-method 'xauth
      twittering-allow-insecure-server-cert nil
      twittering-icon-mode nil
      ;; 起動時パスワード認証 *要 gpgコマンド
      twittering-use-master-password t
      twittering-jojo-mode t
      ;; FORMAT
      twittering-status-format
      "%i @%s  %p [%@]%r %R %f%L: \n %T \n ------------%C{%Y/%m/%d %H:%M:%S}"
      twittering-private-info-file
      (concat my/twit-password-direcotry (car my/twit-users) ".gpg")
      ;; 更新の頻度（秒）
      ;;  twittering-timer-interval 40
      ;;  ;; ツイート取得数
      ;;  twittering-number-of-tweets-on-retrieval 50
      ;; つぶやく時、ミニバッファでなく通常のバッファ
      ;;  twittering-update-status-function
      ;; アイコンサイズを変更する *48以外を希望する場合 要 imagemagickコマンド
      ;; twittering-convert-fix-size 30
      ;; twittering-allow-insecure-server-cert t
      )

(define-key twittering-mode-map (kbd "s") 'twittering-search)
(define-key twittering-mode-map (kbd "1") 'delete-other-windows)
(define-key twittering-mode-map (kbd "I")
  '(lambda ()
     (interactive)
     (delete-other-windows)
     (other-window-or-split)
     (start-irc)))

(add-hook 'twittering-mode-hook
          (lambda ()
            (setq twittering-retweet-format " RT @%s: %t")
            ;; o で次のURLをブラウザでオープン
            (local-set-key (kbd "o")
                           (lambda ()
                             (interactive)
                             (twittering-goto-next-uri)
                             (execute-kbd-macro (kbd "C-m"))))))

(provide 'init_twittering-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_twittering-mode.el ends here
