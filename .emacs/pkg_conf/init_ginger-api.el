;;; init_ginger-api.el --- init file for ginger-api.el
;;; Commentary:
;;; Code:

(require 'my_paths)
(unless (bound-and-true-p ginger-end-point)
  (load (concat el-get-dir "ginger-api/ginger-api")))

(unless (fboundp 'ginger-rephrase)
  (load (concat el-get-dir "ginger-rephrase-api/ginger-rephrase-api")))

;;;###autoload
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
