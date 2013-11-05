;;; init_ginger-api.el --- init file for ginger-api.el
;;; Commentary:
;;; Code:

(unless (bound-and-true-p ginger-end-point)
  (load "~/hotdog/elisp/el-get/ginger-api/ginger-api"))

(unless (fboundp 'ginger-rephrase)
  (load "~/hotdog/elisp/el-get/ginger-rephrase-api/ginger-rephrase-api"))

(defun my/ginger-region ()
  (interactive)
  (when (fboundp 'ginger-region)
    (ginger-region (region-beginning) (region-end))))

(provide 'init_ginger-api)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ginger-api.el ends here
