;;; init_flycheck.el --- init file for flycheck.el

;;; Commentary:

;;; Code:

(require 'my_autoload)

;; prevents "package XXX is not installable"
(package-initialize)

(require 'flycheck)

;; Flycheck-tip
(require 'flycheck-tip)
(defconst error-tip-timer-delay 0.3)
(setq error-tip-notify-keep-messages t)
;; You can specify 'normal, 'verbose or nil
(flycheck-tip-use-timer 'verbose)

;; Flycheck-package ;;
(setq-default flycheck-emacs-lisp-load-path load-path)
(flycheck-package-setup) ; Add flycheck-package to the flycheck-checker

;; Prevent flycheck-mode on some context ;;
(defadvice flycheck-mode (around Y/avoid-flycheck-if-needed activate)
  "Turn off flycheck in specific buffer."
  (unless (or (org-in-src-block-p)
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

(provide 'init_flycheck)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_flycheck.el ends here
