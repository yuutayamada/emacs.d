;;; init_magit.el --- init file for magit.el
;;; Commentary:
;;; Code:
(require 'magit)
(require 'mykie)

(defadvice magit-push (around ad-ssh-add-if-it-was-needed activate)
  "Do ssh-add if it is needed."
  (my/ssh-add)
  ad-do-it)

(defadvice magit-commit (around advice-name activate)
  "Save current buffer."
  (save-current-buffer ad-do-it))

(provide 'init_magit)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_magit.el ends here
