
(require 'skype)

;;skype
(defun skype ()
  "my skype run command"
  (interactive)
  (skype--init)
  (skype--open-all-users-buffer-command))

(provide 'init_skype)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_skype.el ends here
