;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(require 'yaml-mode)
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(provide 'init_yaml-mode)
