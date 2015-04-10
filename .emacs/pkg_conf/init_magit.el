;;; init_magit.el --- init file for magit.el
;;; Commentary:
;;; Code:
(require 'magit)

(defadvice magit-push (around ad-ssh-add-if-it-was-needed activate)
  "Do ssh-add if it is needed."
  (my/ssh-add)
  ad-do-it)

(add-hook 'git-commit-mode-hook
          '(lambda ()
             (define-key git-commit-mode-map (kbd "C-c C-c") 'git-commit-commit)))

(provide 'init_magit)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_magit.el ends here
