;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(require 'moz)
(moz-minor-mode 1)

(require 'init_js2-mode)
(define-key js2-mode-map (kbd "C-c C-j")
  'run-js-console-and-split-window)
(define-key js2-mode-map (kbd "C-c r") 'js-console-execute-region)

(provide 'init_moz)
