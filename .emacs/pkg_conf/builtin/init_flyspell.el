;;; init_flyspell.el --- init file for flyspell
;;; Commentary:

;; just I hate flyspell’s default keybinds.

;;; Code:

(add-hook 'flyspell-mode-hook
          '(lambda ()
             (setq flyspell-use-meta-tab nil)
             (setq flyspell-auto-correct-previous-pos t)
             (define-key flyspell-mode-map (kbd "C-;") nil)
             (define-key flyspell-mode-map (kbd "C-,") nil)
             (define-key flyspell-mode-map (kbd "C-.") nil)
             (define-key flyspell-mode-map (kbd "C-c $") nil)
             (define-key flyspell-mode-map (kbd "C-M-i") nil)))

(provide 'init_flyspell)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_flyspell.el ends here
