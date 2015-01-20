;;; init_helm-config.el --- init file for helm-config.el

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'helm-config)

(add-hook 'helm-before-initialize-hook
          '(lambda ()
             ;; Common configuration
             (setq helm-candidate-number-limit 9999
                   helm-maybe-use-default-as-input t)
             ;; Unset key C-h to use normal C-h
             (define-key helm-map (kbd "C-h") nil)
             (require 'init_helm-migemo)))

;; In the terminal Emacs, helm-colors function doesn't show candidates
;; correctly. To work around this problem, set t to the `helm-always-two-windows'.
;; (helm candidates result crashes when showing the result in left side)
(defconst helm-always-two-windows t)
(defconst helm-split-window-preferred-function 'split-window-sensibly)

(provide 'init_helm-config)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_helm-config.el ends here
