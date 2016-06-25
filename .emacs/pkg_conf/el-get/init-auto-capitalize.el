;;; init-auto-capitalize.el --- init file for auto-capitalize.el
;;; Commentary:
;;; Code:

(require 'my_function)
(require 'cl-lib)
(require 'auto-capitalize)

(setq auto-capitalize-words
      `("I" "English" "Japan" "ASAP" "Linux"
        "Japanese" "ASCII" "CPU" "Halloween"
        ,@(my/get-aspell-capital-words
           (format "%s/aspell/.aspell.en.pws" (getenv "XDG_CONFIG_HOME")))))

(add-hook 'after-change-major-mode-hook 'auto-capitalize-mode)

(provide 'init-auto-capitalize)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init-auto-capitalize.el ends here
