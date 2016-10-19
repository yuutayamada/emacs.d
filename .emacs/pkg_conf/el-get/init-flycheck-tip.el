;;; init-flycheck-tip.el ---                         -*- lexical-binding: t; -*-

;; Flycheck-tip

(require 'flycheck-tip)
(setq flycheck-display-errors-function 'ignore)
(defconst error-tip-timer-delay 0.3)
(setq error-tip-notify-keep-messages t)

;; add icon
(let ((pic "~/media/pictures/Clippy2.jpg"))
  (when (file-exists-p pic)
    (setq error-tip-notify-parametors
          `(:title "It looks like you want to know current error(s):"
                   :category "im.error"
                   :app-icon ,pic))))
