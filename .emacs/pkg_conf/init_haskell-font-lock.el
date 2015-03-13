
;;; Commentary:
;;; Code:
(require 'haskell-font-lock)
(setq haskell-font-lock-symbols-alist
      (delq nil
            (cl-mapcar (lambda (rewrite)
                         (if (member (car rewrite) '("->" "<-"))
                             nil rewrite))
                       haskell-font-lock-symbols-alist)))


(provide 'init_haskell-font-lock)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_haskell-font-lock.el ends here
