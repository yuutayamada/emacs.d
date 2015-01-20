;;; site-start.el --- WIP

;;; Commentary:
;; Emacs will load this file first than other init files.

;;; Code:

(setq
 ;; Load newer file than old file(this feature is from Emacs 24.4)
 load-prefer-newer t)

;;;* Time
(setenv "LC_CTIME" "C")

;;;* LANG
;; see also: http://d.hatena.ne.jp/khiker/20110327/emacs_cjkamb
(setenv "LANG" "C") ; You can set "ja_JP.UTF-8" too instead of the C
;; There is a problem if you set "Japanese" to this configuration;
;; The "Japanese" configuration changes `cjk-char-width-table-list'
;; and that changes specific characters' `char-width'.(like § or λ)
;; It might occur that actual width and char-width are different and
;; it can not be calculate length of string from other extension packages.
(set-language-environment "English")
;; TODO: should I use `set-locale-environment' instead?

;; Use XDG_CONFIG_HOME as personal configuration file
(let* ((emacs-conf-dir (format "%s/emacs/" (getenv "XDG_CONFIG_HOME")))
       (emacsrc (format "%semacsrc" emacs-conf-dir)))
  (when (file-exists-p emacsrc)
    (setq user-emacs-directory emacs-conf-dir
          user-init-file emacsrc)
    (load emacsrc)))

;; See (info "(elisp)Library Search") <- evaluate this
;; emacs.sh defines the EMACSLOADPATH from repository path.
(let ((origin default-directory))
  (with-temp-buffer
    ;; Specify this lisp directory as EMACSLOADPATH
    (cd (car (split-string (getenv "EMACSLOADPATH") ":")))
    (normal-top-level-add-subdirs-to-load-path))
  (cd origin))

;;;* Coding system
(let*
    ((set-coding-system
      (lambda (coding)
        (set-clipboard-coding-system coding)
        (prefer-coding-system coding)
        (set-file-name-coding-system coding)
        (set-keyboard-coding-system coding)
        (set-default-coding-systems coding)
        (set-terminal-coding-system coding)
        (setq file-name-coding-system coding
              buffer-file-coding-system coding
              locale-coding-system coding)
        (add-to-list 'process-coding-system-alist `("git" . ,coding))
        (add-to-list 'auto-coding-alist `("COMMIT_EDITMSG" . ,coding))
        (defconst org-export-coding-system coding)))
     (decide-coding-system
      (lambda ()
        (if (string-match "linux-gnu" system-configuration)
            'utf-8
          ;; I don't know other environment
          'utf-8))))
  (funcall set-coding-system (funcall decide-coding-system)))

;;;;;;;;;;;
;; TITLE ;;
;;;;;;;;;;;
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;;;;;;;;;;;
;; LIMIT ;;
;;;;;;;;;;;
(defconst recentf-max-menu-items  100)
(defconst recentf-max-saved-items 10000)
(setq max-lisp-eval-depth         100000
      history-length              10000
      max-specpdl-size            1000000)

;;;* yes or no -> y or n
(fset 'yes-or-no-p 'y-or-n-p)

;;;* COMPLETION
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t)

;;;* Avoid needless bar
(menu-bar-mode 0)

;;;* AUTO SAVE
;; you can turn off auto saving by setting nil to `auto-save-default'
(setq auto-save-default t
      auto-save-timeout 30   ; Number of seconds
      auto-save-interval 300 ; Number of input events
      ;; 自動保存ファイル（#ファイル名#）の設定
      ;; 参考: http://openlab.dino.co.jp/2009/02/25/185332417.html#more-417
      auto-save-file-name-transforms `((".*/.*" ,temporary-file-directory t))
      delete-auto-save-files t)

;;;* BACKUP(files.el)
(setq make-backup-files t
      backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/var/backups/emacs"))
            backup-directory-alist)
      version-control t
      kept-new-versions 5
      kept-old-versions 5
      delete-old-versions t
      vc-make-backup-files t)

;;;* save place of cursor
(toggle-save-place-globally)

;;;* keybind notify
(setq suggest-key-bindings t)

(setq
 ;; kill line and new line when execute kill command at bol if it set t
 kill-whole-line t
 require-final-newline t
 next-line-add-newlines nil)

;;; etc.
;; do not abbreviate among on displaying Emacs lisp
(setq eval-expression-print-level  nil
      eval-expression-print-length nil)

;; Show image file in a buffer
(auto-image-file-mode t)
;; available to edit .gz file
(auto-compression-mode t)
;; global-revert-mode
(global-auto-revert-mode t)

;;; Copy and Past
;; http://emacswiki.org/emacs/CopyAndPaste
;; http://stackoverflow.com/questions/5288213/how-can-i-paste-the-selected-region-outside-of-emacs/14659015#14659015
(setq select-enable-clipboard t)

;;;* newline configurations
(setq eol-mnemonic-dos       "[CRLF]"
      eol-mnemonic-unix      "[LF]"
      eol-mnemonic-mac       "[CR]"
      eol-mnemonic-undecided "[?]")

;;;* find function
;; C-x F -> find function
;; C-x K -> find key definition
;; C-x V -> find variable definition
(find-function-setup-keys)

;;;* uniqify
;; attach directory name if file name is duplicated
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; hooks
;; Do not display ^M
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m)
;; Use org-table in mail-mode
(add-hook 'mail-mode-hook 'turn-on-orgtbl)
;; Attach executable attribute when saving a file with #!
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; flyspell
;; avoid (crazy) keybinds
(defconst flyspell-mode-map '())

;; Generic-mode(http://www.emacswiki.org/emacs/GenericMode)
(require 'generic-x)

;; Get rid of default org-mode path to avoid conflict between default
;; and org-mode of el-get.
(require 'cl-lib)
(setq load-path
      (cl-loop for path in load-path
               unless (string-match "/git.savannah.gnu.org/emacs/lisp/org$" path)
               collect path))

(provide 'site-start)

;; Local Variables:
;; no-byte-compile: t
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; site-start.el ends here
