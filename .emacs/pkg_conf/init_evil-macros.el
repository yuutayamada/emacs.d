
;;; Commentary:
;; see also http://stackoverflow.com/questions/18102004/emacs-evil-mode-how-to-create-a-new-text-object-to-select-words-with-any-non-sp
;;; Code:

(require 'evil)
(require 'evil-macros)
(require 'cl-lib)

(defmacro Y/evil-make-text-object (inout func-name start end)
  `((lambda ()
      (evil-define-text-object ,func-name (count &optional beg end type)
        ""
        :extend-selection nil
        (evil-regexp-range count beg end type ,start ,end ,inout)))))

(defun Y/add-text-obj (sym key start end)
  (let ((inner (intern (format "evil-inner-%s" sym)))
        (outer (intern (format "evil-a-%s"     sym))))
    (apply `((lambda () (Y/evil-make-text-object t   ,inner ,start ,end))))
    (apply `((lambda () (Y/evil-make-text-object nil ,outer ,start ,end))))
    (when key
      (define-key evil-inner-text-objects-map (kbd key) inner)
      (define-key evil-outer-text-objects-map (kbd key) outer))))

(Y/add-text-obj 'haskell-$   "$" "\\\$" "$")
(Y/add-text-obj 'haskell-dot "." "\\\." "$")

(provide 'init_evil-macros)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_evil-macros.el ends here
