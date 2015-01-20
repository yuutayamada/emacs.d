;;; init_elisp-mode.el --- init file for emacs-lisp mode
;;; Commentary:
;;; Code:

(require 'cl-lib)

;; I don't want to load emacs-lisp mode's configuration when boot time.
(define-key lisp-interaction-mode-map (kbd "C-o") 'emacs-lisp-mode)

(cl-loop with elisp-mode-hooks = '(emacs-lisp-mode-hook ielm-mode-hook)
         for hook in elisp-mode-hooks
         do (add-hook hook 'eldoc-mode))

(provide 'init_elisp-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_elisp-mode.el ends here

