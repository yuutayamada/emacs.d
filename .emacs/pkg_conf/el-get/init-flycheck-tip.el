;;; init-flycheck-tip.el ---                         -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Yuta Yamada

;; Author: Yuta Yamada <sleepboy.zzz@gmail.com>

;; Flycheck-tip
(require 'flycheck-tip)
(defconst error-tip-timer-delay 0.3)
(setq error-tip-notify-keep-messages t)
;; You can specify 'normal, 'verbose or nil
(flycheck-tip-use-timer 'normal)
;; add icon
(let ((pic "~/media/pictures/Clippy2.jpg"))
  (when (file-exists-p pic)
    (setq error-tip-notify-parametors
          `(:title "It looks like you want to know current error(s):"
                   :category "im.error"
                   :app-icon ,pic))))
