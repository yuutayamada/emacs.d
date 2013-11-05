;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;;; Commentary:
;;; Code:

(require 'auto-complete)
(require 'slime)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(provide 'init_ac_slime)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ac_slime.el ends here
