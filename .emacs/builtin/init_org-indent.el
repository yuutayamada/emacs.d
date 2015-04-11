;;; init_org-indent.el --- init file for org-indent
;;; Commentary:
;;; Code:

(require 'org-indent)
(unless (display-graphic-p)
  ;; if current Emacs is in Terminal.
  ;; then use "|" to end of indent.(124) ;1474
  ;; 32 is just space
  (setq org-indent-boundary-char 32) ; 1474
  )

;; org-indent-mode-turns-off-org-adapt-indentation nil
(setq org-startup-indented t)

;; (org-indent-initialize)

(provide 'init_org-indent)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_org-indent.el ends here
