;;; init-company.el --- init file for company.el
;;; Commentary:
;;; Code:
(require 'company)

;; trigger key
(define-key company-mode-map (kbd "C-M-i") 'company-complete)

;; on tool tip
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "TAB") 'company-complete-selection)
(define-key company-active-map "\C-h" nil)

(diminish 'company-mode " ⓒ")

(provide 'init-company)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init-company.el ends here
