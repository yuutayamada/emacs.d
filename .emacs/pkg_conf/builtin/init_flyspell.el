;;; init_flyspell.el --- init file for flyspell
;;; Commentary:
;;; Code:

(add-hook 'flyspell-mode-hook
          '(lambda ()
             (setq flyspell-use-meta-tab nil)
             (setq flyspell-auto-correct-previous-pos t)
             (define-key flyspell-mode-map (kbd "C-;") nil)))

(provide 'init_flyspell)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_flyspell.el ends here
