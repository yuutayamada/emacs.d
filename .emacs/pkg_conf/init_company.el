;;; init-company-mode.el --- init file for company.el
;;; Commentary:
;;; Code:

(require 'company)

(setq company-minimum-prefix-length 3)

;; trigger key
(define-key company-mode-map [remap complete-symbol] 'company-complete)

;; on tool tip
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "TAB") 'company-complete-selection)
(define-key company-active-map "\C-h" nil)

;; fuzzy match
(add-hook 'change-major-mode-after-body-hook 'Y/company-flx-setup)

(provide 'init_company)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_company.el ends here
