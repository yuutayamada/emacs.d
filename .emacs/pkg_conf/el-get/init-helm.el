;; Helm
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
             ;; (el-get-bundle helm-migemo)
             ;; (require 'init_helm-migemo)
             ))

;; available option: 'same, 'other,'right, 'left, 'below, 'above
(defconst helm-split-window-default-side 'other)

;; other configurations
;; (defconst helm-always-two-windows t)
;; (defconst helm-split-window-preferred-function 'split-window-sensibly)


(provide 'init-helm)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init-helm.el ends here
