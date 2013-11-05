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

;;;* yes or no -> y or n
(fset 'yes-or-no-p 'y-or-n-p)

;;;* COMPLETION
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t)

;;;* Avoid needless bars
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

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

;; Configuration for copy and past
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

;; Generic-mode(http://www.emacswiki.org/emacs/GenericMode)
(require 'generic-x)

(provide 'site-start)

;; Local Variables:
;; no-byte-compile: t
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; site-start.el ends here
