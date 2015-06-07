;;; init_auto-complete-c-headers.el ---              -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(require 'auto-complete)
(require 'auto-complete-c-headers)

;;;###autoload
(defun Y/ac-c-headers-init ()
  "Add ac-c-headers source to auto-complete source."
  (add-to-list 'ac-sources 'ac-source-c-headers))

;;;###autoload
(add-hook 'c++-mode-hook 'Y/ac-c-headers-init)
;;;###autoload
(add-hook 'c-mode-hook   'Y/ac-c-headers-init)

(provide 'init_auto-complete-c-headers)
;;; init_auto-complete-c-headers.el ends here
