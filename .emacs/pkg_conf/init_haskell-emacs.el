;;; init_haskell-emacs.el ---                        -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(require 'haskell-emacs)
(setq haskell-emacs-dir "~/code/haskell/emacs/")
(haskell-emacs-init)

;; (haskell-emacs-register-module "Matrix")
;; /home/uta/code/heskell/emacs:
;; (Matrix.dyadic '(1 2 3) '(3 5))
;; (Matrix.identity 4)

(provide 'init_haskell-emacs)
;;; init_haskell-emacs.el ends here
