;;; init-mew.el --- init file for mew.el

;;; Commentary:

;; Make sure "~/.gnupg/gpg-agent.conf"
;; and Add mew-pinentry to pinentry-program
;; For example
;; pinentry-program /home/you/.emacs.d/el-get/mew/bin/mew-pinentry

;; If first time what use the mew,
;; perhaps you should update state that type by C-u Z
;; ~/Mail/.mew-passwd.gpg format, it's sample
;; (("mailaddress@smtp.gmail.com:smtp" "password" 0)
;;  ("mailaddress@imap.gmail.com:imap" "password" 0))
;; To use this setting,
;; you should set your Email address to `my/mew-gmail-prefixes'.

;; About gmail:
;; I needed to check "allow less secure app" here: https://myaccount.google.com/u/1/security

;;; Code:

(require 'Y-autoload)
(el-get 'sync 'mew)

(require 'cl-lib)

;; Set jvgrep as search program to find Japanese words
(when (executable-find "jvgrep")
  (advice-add 'mew-cs-encode-arg :override (lambda (arg) arg))
  (defconst mew-prog-grep "jvgrep")
  (defconst mew-prog-grep-opts
    '("-l" "-r" "--enc" "\"iso-2022-jp,utf-8,ascii,euc-jp,sjis\"" "-G")))

(require 'mew)
(require 'notifications nil t)
(require 'auth-source)
;; (require 'mew-w3m)

;;;###autoload
(defun Y/mew ()
  "Switch m window."
  (interactive)
  (Y/win-switch-window ?m)
  (call-interactively 'mew))

(define-key mew-draft-header-map (kbd "C-c C-i") 'helm-ag-r-google-contacts-list)
(define-key mew-draft-body-map   (kbd "C-c C-k") 'mew-draft-kill)

(defvar my/mew-gmail-prefixes '()
  "Specify list as title and address without @gmail.com.
Note: the default title can't changed
For example
'((\"default\" \"foo\") ; if your mail address is 'foo@gmail.com'
  (\"sub\"     \"bar\")
  (\"temp\"    \"baz\"))")

(add-hook 'mew-draft-mode-hook
          '(lambda ()
             (grammar-mode)
             (turn-on-auto-fill)))

(defun my/biff-function (n)
  (when (< 0 n)
    (if (version< "24.0.0" emacs-version)
        (notifications-notify :title "Emacs/Mew"
                              :body  (format "You got mail(s): %i" n)
                              :timeout 5000)
      (mew-biff-bark n))))

(defun my/generate-mew/gmail-alist-from (mail-prefix)
  ""
  (let ((inbox-name (concat "+inbox-" mail-prefix))
        (address (concat mail-prefix "@gmail.com")))
    (cl-loop for property in '("user" "imap-user" "smtp-user")
             for alist = `(,(cons "inbox-folder" inbox-name)) then alist
             collect (cons property mail-prefix) into alist
             finally return alist)))

(setq mew-draft-keep-text-charset t
      ;; mew-use-w3m-minor-mode t
      mew-mailbox-type 'imap
      mew-ssl-verify-level 0
      ;; Leave mail of pop server after get mail
      mew-pop-delete nil
      ;; Add extension ".mew"
      mew-use-suffix t
      ;; Manage unread topic
      mew-use-unread-mark t

      ;; Register password briefly
      ;; mew-use-cached-passwd t
      ;; if you use master password, you should use mew-pinentry
      mew-use-master-passwd t
      ;; Do not automatically received
      mew-auto-get nil
      ;; For Biff
      mew-use-biff t
      mew-use-biff-bell t  ; use alarm
      mew-biff-interval 10 ; minute
      mew-biff-function 'my/biff-function
      ;; alias
      mew-use-full-alias nil
      ;; display by HTML when "Content-Type: multipart/alternative;"
      mew-mime-multipart-alternative-list
      '("Text/Html" "Text/Plain" ".*")
      ;; display as html for html
      mew-use-text/html t
      ;; display as xml for xml
      mew-use-text/xml t)

;; Spam
(defun mew-spam-assassin-or-bsfilter (val)
  (let ((case-fold-search t))
    (if (string-match "yes" val) ?D)))

(setq mew-spam: "X-Spam-Flag:"
      mew-inbox-action-alist
      '(("X-Spam-Flag:" mew-spam-assassin-or-bsfilter)))

;; -- CHARSET --
(setq
 ;;; charset for sending, use iso-2022-jp-2 instead UTF-8 if you want.
 ;; mew-charset-m17n "iso-2022-jp-2"
 ;;; ask you when charset is preferred without below list
 mew-ask-charset '("utf-8" "us-ascii" "iso-2022-jp")
 ;; if you want to use UTF-8 against other than US-ASCII,
 ;; you can set below setting
 ;; mew-cs-database-for-encoding
 ;; `(((ascii) nil "7bit" "7bit")
 ;;   (nil utf-8 "base64" "B"))
 )
;; -- CHARSET END --

(defvar mew/gmail-default-alist
  `(("proto"             . "%")
    ("name"              . ,(user-full-name))
    ("mail-domain"       . "gmail.com")
    ("imap-trash-folder" . "%Trash")
    ("imap-spam-folder"  . "%SPAM")
    ("fcc"               . "%Sent")
    ("imap-server"       . "imap.gmail.com")
    ("imap-auth"         . t)
    ("imap-ssl"          . t)
    ("imap-ssl-port"     . "993")
    ("smtp-auth"         . t)
    ("smtp-ssl"          . t)
    ("smtp-ssl-port"     . "465")
    ("smtp-server"       . "smtp.gmail.com")
    ("use-smtp-auth"     . t)))

(defun my/mew-create-alist (list)
  "Produce alist for my setting from LIST."
  (cl-loop with alist = '()
           for (title account) in list
           collect `(,title
                     ,@mew/gmail-default-alist
                     ,@(my/generate-mew/gmail-alist-from account))))

;; Switch to account by types "C" and renew summary by types "i"
(setq mew-config-alist (my/mew-create-alist my/mew-gmail-prefixes))

;; Draft
(defadvice mew-draft-send-message (around ad-save-braft-buffer activate)
  "Save draft message before sending mail."
  (mew-draft-save-buffer)
  ad-do-it)

(require 'diff-mode)
(add-hook 'mew-message-hook
          '(lambda ()
             (let*
                 ((diff-hunk-header "^@@ -[0-9,]+ \\+[0-9,]+ @@[\n ]")
                  (x-mew
                   "^X-Mew: Text/Html in Multipart/Alternative as a singlepart")
                  (x-mew-p (lambda ()
                             (goto-char (point-min))
                             (if (re-search-forward x-mew nil t)
                                 t
                               nil))))
               (unless (funcall x-mew-p)
                 (goto-char (point-min))
                 (while (re-search-forward diff-hunk-header nil t)
                   (diff-refine-hunk))))))

(add-hook 'mew-message-mode-hook
          (lambda ()
            ;; (w3m-minor-mode)
            (local-set-key (kbd "O") 'mew-browse-url-at-point)
            (local-set-key (kbd "C-x m") 'mew-browse-url-at-point)))

;; Comment out due to an error, which makes "Making
;; after-change-functions buffer-local while locally let-bound!"
(when (and (fboundp 'shr-render-region)
           ;; \\[shr-render-region] requires Emacs to be compiled with libxml2.
           (fboundp 'libxml-parse-html-region))
  (defconst mew-prog-text/html 'shr-render-region))

(provide 'init-mew)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init-mew.el ends here
