;;; init_arduino-mode.el ---                         -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(add-hook 'arduino-mode-hook
          '(lambda ()
             (irony-mode t) ;  activate company-arduino
             (run-hooks 'prog-mode-hook) ; to activate flycheck and company-mode
             ;; My Arduino checker
             (flycheck-arduino-setup)))

(provide 'init_arduino-mode)
;;; init_arduino-mode.el ends here
