;;; init_prog-mode.el --- Functions related programming

;;; Commentary:

;;; Code:
(require 'cl-lib)

;; LISP
(setq-default lisp--prettify-symbols-alist `(("lambda" . ?ƛ)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRETTIFY-SYMBOLS-MODE ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(advice-add 'prettify-symbols-mode :before
            (lambda (&rest r)
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
