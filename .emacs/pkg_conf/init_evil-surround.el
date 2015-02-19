;;; init_evil-surround.el --- init file for evil-surround.el
;;; Commentary:
;; Add surrounding
;;   You can surround in visual-state with S<textobject> or
;;   gS<textobject>. or in normal-state with ys<textobject> or yS<textobject>.
;; Change surrounding
;;   You can change a surrounding with cs<old-textobject><new-textobject>.
;; Delete surrounding
;;   You can delete a surrounding with ds<textobject>.
;;; Code:
(require 'cl-lib)
(require 'evil-surround)

;; (defun Y/get-comment-string ()
;;   (cl-case major-mode
;;     ;; ysi{;
;;     (emacs-lisp-mode (cons ";; " ""))
;;     (go-mode (cons "/* " " */"))))

;; (add-hook 'prog-mode-hook
;;           '(lambda ()
;;              (add-to-list 'evil-surround-pairs-alist
;;                           (cons (string-to-char ";") 'Y/get-comment-string))))

(provide 'init_evil-surround)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_evil-surround.el ends here
