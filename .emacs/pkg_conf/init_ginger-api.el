;;; init_ginger-api.el --- init file for ginger-api.el
;;; Commentary:
;;; Code:

(require 'el-get)

(let ((el-get-is-lazy t))
  (el-get-bundle! gist:5457732:ginger-api
    :depends request)
  (el-get-bundle! gist:7349439:ginger-rephrase-api
    :depends request))

(require 'cl-lib)
(cl-loop for file in '("ginger-api/ginger-api" "ginger-rephrase-api/ginger-rephrase-api")
         if (file-exists-p (concat el-get-dir file ".el"))
         do (load (concat el-get-dir file)))

;;;###autoload
(defun Y/ginger-region ()
  "Check region by ‘ginger-region’ or ‘ginger-rephrase’."
  (interactive)
  (call-interactively
   (if (not prefix-arg) 'ginger-region 'ginger-rephrase)))

(provide 'init_ginger-api)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ginger-api.el ends here
