;;; init_multiple-cursors.el --- init file for multiple-cursors.el

;;; Commentary:

;;; Code:

(require 'Y-autoload)

(add-hook 'kill-emacs-hook 'mc/save-lists)

(provide 'init_multiple-cursors)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_multiple-cursors.el ends here
