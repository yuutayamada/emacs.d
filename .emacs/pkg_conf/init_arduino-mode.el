;;; init_arduino-mode.el ---                         -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(add-hook 'arduino-mode-hook
          '(lambda ()
             (flycheck-mode 1)
             ;; My Arduino checker
             (flycheck-select-checker 'arduino)))

(require 'arduino-mode)

(provide 'init_arduino-mode)
;;; init_arduino-mode.el ends here
