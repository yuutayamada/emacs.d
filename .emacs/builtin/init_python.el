;;; init_python.el --- init file for python.el
;;; Commentary:
;; install flake8: sudo pip3 install flake8
;;; Code:
(defconst python-indent 4) ; to avoid warning of flake8
(add-hook 'python-mode-hook 'jedi:setup)

(provide 'init_python)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_python.el ends here
