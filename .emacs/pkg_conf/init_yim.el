;;; init_yim.el --- init file for yim.el

;;; Commentary:

;;; Code:
(require 'Y-autoload)
(require 'yim)
;; (defadvice skk-latin-mode-on (around ad-trash-un-kakutei-string activate)
;;   ad-do-it
;;   (my/trash-un-kakutei-string))

(advice-add 'skk-latin-mode-on :after (lambda () (skk-erase-prefix 'clean)))
(advice-add 'yim-convert :after (lambda () (skk-j-mode-on)))

(provide 'init_yim)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_yim.el ends here
