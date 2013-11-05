;;; init_prog-mode.el --- Functions related programming

;;; Commentary:

;;; Code:
(require 'cl-lib)

;; (defface my/lambda-face
;;   '((t (:foreground "#Eeee00" :font "sans-serif-3"
;;                     :bold t :italic t :box "#Eeee00" :height 0.5
;;                     :underline t
;;                     ;; :inherit font-lock-function-name-face
;;                     )))
;;   "My lambda face" :group 'font-lock)

;; (let ((lam (char-to-string (make-char 'greek-iso8859-7 107))))
;;   (put-text-property 0 1 'my/lambda-face nil lam)
;;   (setq-default prettify-symbols-alist `(("lambda" . ,lam)))
;;   (setq-default lisp--prettify-symbols-alist `(("lambda" . ,lam))))

(setq-default lisp--prettify-symbols-alist `(("lambda" . 955)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRETTIFY-SYMBOLS-MODE ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(advice-add 'prettify-symbols-mode :before
            (lambda (&rest r)
              (cl-case major-mode
                (verilog-mode
                 (push '("begin" . ?{) prettify-symbols-alist)
                 (push '("end"   . ?}) prettify-symbols-alist)))))

(provide 'init_prog-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_prog-mode.el ends here
