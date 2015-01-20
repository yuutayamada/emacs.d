;;; init_multiple-cursors.el --- init file for multiple-cursors.el

;;; Commentary:

;;; Code:

(require 'my_autoload)

(add-hook 'kill-emacs-hook 'mc/save-lists)

(advice-add 'Y/multiple-cursor-keys :after
            (lambda (&rest _args)
              (Y/change-style '("#cdcd00" "black" nil))))

(provide 'init_multiple-cursors)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_multiple-cursors.el ends here
