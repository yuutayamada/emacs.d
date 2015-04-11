;;; init_prog-mode.el --- Functions related programming

;;; Commentary:

;;; Code:
(require 'cl-lib)
(require 'my_autoload)

(add-hook 'prog-mode-hook
          #'(lambda ()
              ;; indentation and whitespace
              (cl-case major-mode
                ((go-mode sql-mode)
                 (setq-local indent-tabs-mode t)) ; Use tab instead of space
                (t (my/whitespace-mode)))
              ;; show paren
              (show-paren-mode t)
              ;; flycheck or other syntax check tool
              (cl-case major-mode
                ((scala-mode clojure-mode coffee-mode)
                 nil)
                (t (run-with-idle-timer 3 nil 'flycheck-mode)))
              ;; flyspell-prog-mode
              (run-with-idle-timer 5 nil 'flyspell-prog-mode)
              (unless prettify-symbols-mode
                (prettify-symbols-mode t))
              (highlight-indentation-current-column-mode)
              (rainbow-delimiters-mode)))

(add-hook 'before-save-hook
          #'(lambda ()
              ;; Format source code before save.
              (let ((cmd
                     (cl-case major-mode
                       (js2-mode (when (executable-find "jsfmt") 'jsfmt))
                       (go-mode  'gofmt-before-save))))
                (when cmd (call-interactively cmd)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRETTIFY-SYMBOLS-MODE ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LISP
(setq-default lisp--prettify-symbols-alist `(("lambda" . ?ƛ)))
(advice-add 'prettify-symbols-mode :before
            #'(lambda (&rest r)
                (cl-case major-mode
                  (haskell-mode
                   (push '("\\" . ?ƛ) prettify-symbols-alist))
                  (js2-mode
                   (push '("function" . ?ƛ) prettify-symbols-alist))
                  (lua-mode
                   (push '("function" . ?ƛ) prettify-symbols-alist))
                  (verilog-mode
                   (push '("begin" . ?{) prettify-symbols-alist)
                   (push '("end"   . ?}) prettify-symbols-alist)))))

(provide 'init_prog-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_prog-mode.el ends here
