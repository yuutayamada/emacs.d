;;; Y-premitives.el --- -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; truncate line
(setq-default truncate-lines t)

;; show column number as well
(setq column-number-mode t)
;; remember-notes:
;; use org-mode
(defconst remember-notes-initial-major-mode 'org-mode)

;;* Coding system
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8) ; for eshell

;; TITLE ;;
(setq frame-title-format
      '((:eval (if (not (display-graphic-p))
                   (send-string-to-terminal (format "\e]0;%s\007" (buffer-name)))
                 (buffer-name)))))
;; LIMIT ;;
(defconst recentf-max-menu-items  100)
(defconst recentf-max-saved-items 10000)
(setq max-lisp-eval-depth         100000
      history-length              10000
      max-specpdl-size            1000000
      ;; minibuffer’s height
      max-mini-window-height      0.5)

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
                     (lambda () (shell-command-to-string "sh -c 'xsel -b -o'"))))))

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

;; COMMENT
(setq comment-style 'extra-line)
(advice-add 'comment-indent :around
            '(lambda (orig &rest r)
               (let ((ppss (syntax-ppss)))
                 (cond
                  ((and (not (use-region-p))
                        comment-use-syntax
                        (nth 4 ppss))
                   (if (eq t (nth 4 ppss))
                       (comment-line 1)
                     (save-excursion
                       (goto-char (nth 8 ppss))
                       (comment-line 1))))
                  (t (apply orig r))))))

;; KEY BINDS ;;

;; find function
;; C-x F -> find function
;; C-x K -> find key definition
;; C-x V -> find variable definition
(find-function-setup-keys)

;; Bind C-h as backspace key:
(require 'term/bobcat) ; may don’t need this if you use xterm-keybinder
(global-set-key (kbd "C-h")   'delete-backward-char)
(global-set-key (kbd "M-;")   'comment-dwim)
(global-set-key (kbd "C-x b") 'ido-switch-buffer)
(define-key lisp-interaction-mode-map (kbd "C-j") nil)

(provide 'Y-premitives)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-premitives.el ends here
