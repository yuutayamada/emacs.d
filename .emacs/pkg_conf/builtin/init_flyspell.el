;;; init_flyspell.el --- init file for flyspell

;;; Commentary:

;;; Code:

(require 'flyspell-lazy)
(require 'flyspell)

(setq flyspell-use-meta-tab nil
      flyspell-auto-correct-previous-pos t)

(defun my/toggle-flyspell ()
  (interactive)
  (if flyspell-mode
      (flyspell-mode-off)
    (turn-on-flyspell)))

(provide 'init_flyspell)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_flyspell.el ends here
