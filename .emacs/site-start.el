;;; site-start.el ---  -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Yuta Yamada

;; Author: Yuta Yamada <sleepboy.zzz@gmail.com>
;; Keywords: internal

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; This file will be loaded at first.
;; see also: https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html
;; I'm using this file to set `initial-major-mode'.

;; Loading order (of startup.el) ;;
;; 1. before-init-hook   : how to set this???
;; 2. site-start         : this file
;; 3. user-init-file     : .emacs or default.el
;; 4. after-init-hook
;; 5. emacs-startup-hook : after `command-line' function
;;    term-setup-hook    : same timing as emacs-statup-hook
;;                         but, no recommended officially
;; 6. window-setup-hook  : after frame parameters have been set up

;; memo: https://www.gnu.org/software/emacs/manual/html_node/elisp/Startup-Summary.html#Startup-Summary
;;; Code:

;; Do not configure when --batch option
(unless noninteractive
  ;; Set GC limit to boot rapidly
  (setq gc-cons-threshold (* 1024 1024 1024))
  (add-hook 'emacs-startup-hook
            '(lambda ()
               ;; Refresh GC threshold
               (setq gc-cons-threshold (* 8 1024 1024))
               (message (format "Welcome to Emacs(%s)" emacs-version))))

  ;; My core configuration files
  (setq
   ;; Load newer file than old file(this feature is from Emacs 24.4)
   load-prefer-newer t
   ;; Inhibit startup message/screen
   inhibit-startup-message t
   inhibit-startup-screen  t
   package-enable-at-startup nil
   ;; Basic display. Note that `emacs-basic-display' variable doesn't
   ;; work on Emacs Daemon, so this is better way. (I think)
   ;; memo: I changed scroll bar on Xresouces
   menu-bar-mode nil
   tool-bar-mode nil
   )

  (add-hook 'after-init-hook
            '(lambda ()
               (require 'Y-launch)
               (when (version< "24.0.0" emacs-version)
                 (require 'notifications) ; this needs Dbus
                 (notifications-notify :title "Emacs Daemon"
                                       :body  "Ready to start!!!"
                                       :timeout 5000))))

  ;; truncate line
  (setq-default truncate-lines t)

  ;; show column number as well
  (setq column-number-mode t)

  ;; initial scratch buffer
  ;; initial major-mode of *scratch* buffer
  ;; (setq initial-major-mode 'emacs-lisp-mode)
  (add-hook 'prog-mode-hook
            #'(lambda () (when (and (eq major-mode initial-major-mode)
                               (equal "*scratch*" (buffer-name)))
                      (let ((comment (if (member comment-start '(";"))
                                         (concat comment-start comment-start)
                                       comment-start)))
                        (setq initial-scratch-message
                              (concat comment " This is scratch buffer.\n")))
                      (run-with-idle-timer 5 nil 'eldoc-mode t))))

  ;; Dame???
  ;; ;; Decide start up buffer
  ;; (setq initial-buffer-choice
  ;;       #'(lambda ()
  ;;           (when (and (one-window-p)
  ;;                      (switch-to-buffer (get-buffer "*Messages*")))
  ;;             (highlight-phrase "error" 'error)
  ;;             (highlight-phrase "\\(.*newer than byte-compiled.*\n\\|warning\\)"
  ;;                               'warning))))

  ;; Use XDG_CONFIG_HOME as personal configuration file
  (let* ((emacs-conf-dir (format "%s/emacs/" (getenv "XDG_CONFIG_HOME")))
         (emacsrc (format "%semacsrc" emacs-conf-dir)))
    (when (file-exists-p emacsrc)
      (setq user-emacs-directory emacs-conf-dir)
      (load emacsrc)))

  ;;* Coding system
  (prefer-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8) ; for eshell

  ;; TITLE ;;
  (setq frame-title-format (format "emacs@%s : %%f" (system-name)))

  ;; LIMIT ;;
  (defconst recentf-max-menu-items  100)
  (defconst recentf-max-saved-items 10000)
  (setq max-lisp-eval-depth         100000
        history-length              10000
        max-specpdl-size            1000000)

  ;;* yes or no -> y or n
  (fset 'yes-or-no-p 'y-or-n-p)

  ;;* COMPLETION
  (setq completion-ignore-case t
        read-file-name-completion-ignore-case t)

  ;;* AUTO SAVE
  ;; you can turn off auto saving by setting nil to `auto-save-default'
  (setq auto-save-default t
        auto-save-timeout 30   ; Number of seconds
        auto-save-interval 300 ; Number of input events
        ;; 自動保存ファイル（#ファイル名#）の設定
        ;; 参考: http://openlab.dino.co.jp/2009/02/25/185332417.html#more-417
        auto-save-file-name-transforms `((".*/.*" ,temporary-file-directory t))
        delete-auto-save-files t)

  ;;* BACKUP(files.el)
  (setq make-backup-files t
        backup-directory-alist
        (cons (cons "\\.*$" (expand-file-name "~/var/backups/emacs"))
              backup-directory-alist)
        version-control t
        kept-new-versions 5
        kept-old-versions 5
        delete-old-versions t
        vc-make-backup-files t)

  ;; backup
  ;; https://www.gnu.org/software/coreutils/manual/html_node/Backup-options.html
  ;; VERSION_CONTROL env

  ;;* save place of cursor
  (toggle-save-place-globally)

  (setq kill-whole-line t ; kill line and new line at bol when non-nil
        require-final-newline t
        next-line-add-newlines nil)

  ;; etc.
  ;; do not abbreviate among on displaying Emacs lisp
  (setq eval-expression-print-level  nil
        eval-expression-print-length nil)

  ;; Show image file in a buffer
  (auto-image-file-mode t)
  ;; available to edit .gz file
  (auto-compression-mode t)
  ;; global-revert-mode
  (global-auto-revert-mode t)

  ;; Copy and Past
  ;; Note that the names of original values are different on
  ;; Emacs version. (x-select-... gui-select-...)
  (defconst Y/original-cut-and-paste
    `(,interprogram-cut-function . ,interprogram-paste-function))

  (when (executable-find "xsel")
    (setq interprogram-paste-function
          (lambda ()
            (funcall (if (display-graphic-p)
                         (cdr Y/original-cut-and-paste)
                       (lambda ()
                         ;; After I changed xmodmap, I got strange error:
                         ;; "xmodmap: please release the following keys within 2 seconds:..."
                         ;; I'm not sure about the true reason, but the
                         ;; ‘eshell-command-result’ was the work around.
                         (eshell-command-result "xsel -b -o"))))))

    (setq interprogram-cut-function
          (lambda (text &optional _rest)
            (funcall (if (display-graphic-p)
                         (car Y/original-cut-and-paste)
                       (lambda (text &optional _rest)
                         (let* ((process-connection-type nil)
                                (proc (start-process "xsel" "*Messages*" "xsel" "-b" "-i")))
                           (process-send-string proc text)
                           (process-send-eof proc))))
                     text))))


  ;;* newline configurations
  (setq eol-mnemonic-dos       "[CRLF]" ; DOS
        eol-mnemonic-unix      "[LF]"   ; Unix
        eol-mnemonic-mac       "[CR]"   ; Mac
        eol-mnemonic-undecided "[?]")

  ;; BUILT IN PACKAGE CONFIGURATION ;;
  ;; ido
  (defconst ido-use-virtual-buffers t) ; Show recentf buffers
  (defconst ido-mode 'both)

  ;; uniqify
  ;; attach directory name if file name is duplicated
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)


  ;; HOOKS (only from built in package)
  ;; eldoc on eval minibuffer
  (add-hook 'eval-expression-minibuffer-setup-hook 'eldoc-mode)
  ;; Do not display ^M
  (add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m)
  ;; Use org-table in mail-mode
  (add-hook 'mail-mode-hook 'turn-on-orgtbl)
  ;; Attach executable attribute when saving a file with #!
  (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

  ;; subword & superword
  ;; http://ergoemacs.org/emacs/emacs_subword-mode_superword-mode.html
  (global-subword-mode   1)
  (global-superword-mode 1)

  ;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; General mode config ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;
  (add-to-list 'auto-mode-alist (cons "\\.co?nf\\'" 'conf-mode))
  (add-to-list 'auto-mode-alist (cons "\\..*ignore\\'" 'default-generic-mode))
  ;; X default files
  (add-to-list 'auto-mode-alist (cons (getenv "XAPPLRESDIR") 'conf-xdefaults-mode))

  ;; KEY BINDS ;;

  ;; find function
  ;; C-x F -> find function
  ;; C-x K -> find key definition
  ;; C-x V -> find variable definition
  (find-function-setup-keys)

  (global-set-key (kbd "C-h")   'delete-backward-char)
  (global-set-key (kbd "M-;")   'comment-dwim)
  (global-set-key (kbd "C-x b") 'ido-switch-buffer)
  (define-key lisp-interaction-mode-map (kbd "C-j") nil)

  ) ; end of unless

(provide 'site-start)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; site-start.el ends here
