;;; init_nim-mode.el ---
;;; Commentary:
;;; Code:

(require 'nim-mode)

(defun nim-empty-line-p ()
  (interactive)
  (save-excursion
    (line-move -1)
    (looking-at "^$")))

(defadvice nim-indent-calculate-levels (around Y/modify-indent-level activate)
  "Set indent-level to 0 if previous line is empty line."
  (if (nim-empty-line-p)
      (setq
       ;; nim-indent-levels
       nim-indent-current-level 0)
    ad-do-it))

;; auto-indent-mode
;; (add-to-list 'auto-indent-multiple-indent-modes 'nim-mode)

(provide 'init_nim-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_nim-mode.el ends here
