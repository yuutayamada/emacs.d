;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; (require 'js-console)

;; (defun js-console-execute-region (start end)
;;   "Execute region"
;;   (interactive "r")
;;   (let ((buf-name (buffer-name (current-buffer))))
;;     (copy-region-as-kill start end)
;;     (switch-to-buffer-other-window "*js*")
;;     (js-console-exec-input (car kill-ring))
;;     (switch-to-buffer-other-window buf-name)))

;; (defun run-js-console-and-split-window ()
;;   "Run js-console and split window horizontally."
;;   (interactive)
;;   (split-window-horizontally)
;;   (js-console)
;;   (other-window 1))
