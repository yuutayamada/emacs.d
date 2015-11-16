;;; init_lisp-mode.el --- init file for common lisp mode -*- lexical-binding: t; -*-
;;; Commentary:
;; This will be loaded when emacs activates lisp-interaction-mode,
;; so putting heavy logic isn't good idea.
;;; Code:

(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'lisp-interaction-mode-hook
          '(lambda ()
             (define-key lisp-interaction-mode-map (kbd "A-ESC") 'evil-force-normal-state)))
;; work in progress
;; (add-hook 'lisp-mode-hook
;;           '(lambda ()
;;              (require 'init_slime)
;;              (require 'init_ac_slime)
;;              (slime-mode t)))

(provide 'init_lisp-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_lisp-mode.el ends here
