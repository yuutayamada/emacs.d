;;; init_nxml-mode.el --- init file for nxml-mode.el

;;; Commentary:
;;; Code:

(require 'flycheck-java)
(require 'my_autoload)

(add-hook 'nxml-mode-hook
          (lambda ()
            (when (flycheck-java-android-project-p)
              (android-mode t)
              (require 'flycheck-android-lint)
              (flycheck-select-checker 'xml-android-lint))))

(provide 'init_nxml-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_nxml-mode.el ends here
