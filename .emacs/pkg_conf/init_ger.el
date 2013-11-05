;;; -*- coding: utf-8 -*-
;;;* configuration for ger

;; (require 'ger nil 'noerror)
;; (eval-when-compile (require 'cl))

;; (condition-case error
;;     (let* ((ger-directory "~/bb/work/ger/"))
;;       (defconst ger-ruby-exe-path (concat ger-directory "bin/ger"))
;;       (defconst ger-registering-dir "~/bb/")
;;       (global-set-key (kbd "C-S-i") 'ger)
;;       (define-key ger-minor-mode-map (kbd "C-:") 'loga-lookup-in-buffer)
;;       (define-key ger-minor-mode-map ":" 'loga-fallback)
;;       (define-key ger-minor-mode-map "r" 'loga-lookup-in-buffer-light)
;;       (define-key ger-minor-mode-map "J" 'loga-previous-scroll-line)
;;       (define-key ger-minor-mode-map "a" 'loga-previous-scroll-line)
;;       (define-key ger-minor-mode-map "K" 'loga-next-scroll-line)
;;       (define-key ger-minor-mode-map "s" 'loga-next-scroll-line)
;;       (define-key ger-minor-mode-map "m" 'loga-lookup-in-buffer))
;;   (error error))
