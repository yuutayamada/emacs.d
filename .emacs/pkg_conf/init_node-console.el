;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(require 'init_popwin)
(require 'init_helm)
(require 'node-console)

(eval-after-load "js2-mode"
  '(progn
     (define-key js2-mode-map (kbd "C-c C-c") 'node-console)
     (define-key js2-mode-map (kbd "C-c C-k") 'node-console-kill-process)))

(provide 'init_node-console)
