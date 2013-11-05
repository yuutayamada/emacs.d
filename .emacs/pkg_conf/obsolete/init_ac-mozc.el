;;; init_ac-mozc.el --- init file for ac-mozc

;;; Commentary:

;;; Code:
;; (require 'mozc)
(require 'ac-mozc)
(define-key ac-mode-map (kbd "C-c C-SPC") 'ac-complete-mozc)

(defun my/ac-mozc-setup ()
  "Setup ac-mozc."
  (interactive)
  (unless (member 'ac-source-mozc ac-sources)
    (add-to-list 'ac-sources 'ac-source-mozc)
    (set (make-local-variable 'ac-auto-show-menu) 0.2)))

(provide 'init_ac-mozc)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ac-mozc.el ends here
