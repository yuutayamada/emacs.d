;;; init-flycheck.el --- init file for flycheck.el -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'my_autoload)
(require 'el-get)
(require 'flycheck)

;; Emacs Lisp integration
(defconst flycheck-emacs-lisp-load-path 'inherit)
(defconst flycheck-emacs-lisp-package-user-dir config-dir)

(let ((emacs (file-name-directory (executable-find "emacs"))))
  (setq flycheck-gcc-include-path (list emacs)
        flycheck-clang-include-path flycheck-gcc-include-path)
  ;; for nim
  (defvar flycheck-nim-args (list (format "--passC:-I%s" emacs))))

;; Flycheck-tip
(require 'flycheck-tip)
(defconst error-tip-timer-delay 0.3)
(setq error-tip-notify-keep-messages t)
;; You can specify 'normal, 'verbose or nil
(flycheck-tip-use-timer 'normal)
;; add icon
(let ((pic "~/media/pictures/Clippy2.jpg"))
  (when (file-exists-p pic)
    (setq error-tip-notify-parametors
          `(:title "It looks like you want to know current error(s):"
                   :category "im.error"
                   :app-icon ,pic))))

;; Prevent flycheck-mode on some context ;;
(defadvice flycheck-mode (around Y/avoid-flycheck-if-needed activate)
  "Turn off flycheck in specific buffer."
  (unless (or (org-in-src-block-p)
              (and buffer-file-name
                   (equal
                    (file-name-directory buffer-file-name)
                    el-get-user-package-directory))
              (member (buffer-name) '(".emacs" "*scratch*"))
              (string-match "^\\*Org Src .*\\*" (buffer-name)))
    ad-do-it))

(defadvice flycheck-finish-syntax-check (around Y/avoid-flycheck activate)
  "Avoid flycheck on org src buffer."
  (when (not (org-src-edit-buffer-p))
    ad-do-it))

;; verilog
(flycheck-define-checker verilog-verilator
  "A Verilog syntax checker using the Verilator Verilog HDL simulator.

See URL `http://www.veripool.org/wiki/verilator'."
  :command ("verilator" "--lint-only" "-Wall" "--bbox-sys"
            ;; "--bbox-unsup"
            source)
  :error-patterns
  ((warning line-start "%Warning-" (zero-or-more not-newline) ": "
            (file-name) ":" line ": " (message) line-end)
   (error line-start "%Error: " (file-name) ":"
          line ": " (message) line-end))
  :modes verilog-mode)

(provide 'init-flycheck)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init-flycheck.el ends here
