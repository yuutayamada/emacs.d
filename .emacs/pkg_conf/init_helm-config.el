;;; init_helm-config.el --- init file for helm-config.el

;;; Commentary:
;; The helm-config file is a group of autoload functions for helm, so
;; you don't need worry about loading time.
;; http://www.reddit.com/r/emacs/comments/2z7nbv/lean_helm_window/
;;; Code:

(require 'cl-lib)
(require 'helm-config)

(add-hook 'helm-before-initialize-hook
          '(lambda ()
             ;; Common configuration
             (setq helm-candidate-number-limit 1000
                   helm-maybe-use-default-as-input t)
             ;; Override helm-map to use functions of DDSKK
             (mykie:attach-mykie-func-to 'helm)
             ;; Unset key C-h to use normal C-h
             (define-key helm-map (kbd "C-h") nil)
             (require 'init_helm-migemo)))

;; available option: 'same, 'other,'right, 'left, 'below, 'above
(defconst helm-split-window-default-side 'other)

;; other configurations
;; (defconst helm-always-two-windows t)
;; (defconst helm-split-window-preferred-function 'split-window-sensibly)

(provide 'init_helm-config)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_helm-config.el ends here
