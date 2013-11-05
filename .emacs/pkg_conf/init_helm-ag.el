;;; -*- coding: utf-8; mode: emacs-lisp; -*-
(require 'helm-ag)
(setq helm-ag-base-command "ag --nocolor --nogroup "
      helm-ag-command-option " -S -C 2 -U ")

(provide 'init_helm-ag)
