;;; Y-hooks.el --- my hooks configurations -*- lexical-binding: t; -*-

;;; Commentary:

;; Most configurations are place in /pkg_conf/ directory, but for some
;; packages, they need to use hooks to make lazy loading.
;; (maybe I can use el-get-source variable to do that, but I don’t
;; want to put too many configurations there)

;;; Code:

(require 'cl-lib)
(require 'Y-autoload)

;; helm
(add-hook 'helm-before-initialize-hook
          '(lambda ()
             ;; available option: 'same, 'other,'right, 'left, 'below, 'above
             (defconst helm-split-window-default-side 'other)
             ;; Common configuration
             (setq helm-candidate-number-limit 1000
                   helm-maybe-use-default-as-input t)
             ;; Override helm-map to use functions of DDSKK
             (mykie:attach-mykie-func-to 'helm)
             ;; Unset key C-h to use normal C-h
             (define-key helm-map (kbd "C-h") nil)))

;; org-mode
(add-hook 'org-load-hook
          '(lambda () (load (concat package-conf-dir "rcfiles/Y-orgrc") t)))


;; Update modeline and cursor colors
(add-hook 'find-file-hook 'Y-update-modeline)
(advice-add 'other-window-or-split :after 'Y-update-cursor-&-modeline)
(add-hook 'xcc-before-send-hook 'Y-update-modeline)
(add-hook 'xcc-nocalled-hook 'Y-update-modeline)

;; Memo
;; use those hooks later: `focus-in-hook', `focus-out-hook'.

(provide 'Y-hooks)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-hooks.el ends here
