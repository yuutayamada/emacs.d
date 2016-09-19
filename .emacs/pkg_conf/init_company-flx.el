;;; init_company-flx.el ---                          -*- lexical-binding: t; -*-

;;; Commentary:

;;

;;; Code:

(require 'Y-autoload)
(el-get 'sync 'flx 'company-flx)
(require 'company-flx)

(let ((recommend-gc-threshold 20000000))
    (when (< gc-cons-threshold recommend-gc-threshold)
      (setq gc-cons-threshold recommend-gc-threshold)))

;;;###autoload
(defun Y/company-flx-setup ()
  "Set up fuzzy matching."
  (when (bound-and-true-p company-mode)
    (cl-case major-mode
      ((nim-mode nimscript-mode)
       nil)
      (t (company-flx-mode +1)))))

(provide 'init_company-flx)
;;; init_company-flx.el ends here
