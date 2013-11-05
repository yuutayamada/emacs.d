;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(require 'actionscript-mode)

;;;* actionscript mode
(add-hook 'actionscript-mode-hook
          '(lambda ()
             (c-set-offset 'statement-cont 0)
             (c-set-offset 'substatement-open 0)
             (c-set-offset 'block-open 0)
             (c-set-offset 'case-label '+)
             (c-set-offset 'statement-case-open 0)
             (setq tab-width 2)
             (setq c-basic-offset tab-width)
             (setq indent-tabs-mode nil)))

(provide 'init_actionscript-mode)
