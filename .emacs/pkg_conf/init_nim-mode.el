;;; init_nim-mode.el ---
;;; Commentary:
;;; Code:

(require 'nim-mode)

(defun nim-empty-line-p ()
  (interactive)
  (save-excursion
    (line-move -1)
    (if (looking-at "^$")
        t
      nil)))

;; (defadvice nim-indent-calculate-indentation (around check-whether-empty-line activate)
;;   ""
;;   ad-do-it
;;   ;; (if (nim-empty-line-p)
;;   ;;     0
;;   ;;   ad-do-it)
;;   )

;; auto-indent-mode
;; (add-to-list 'auto-indent-multiple-indent-modes 'nim-mode)

(provide 'init_nim-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_nim-mode.el ends here
