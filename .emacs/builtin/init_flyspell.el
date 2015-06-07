;;; init_flyspell.el --- init file for flyspell
;;; Commentary:
;;; Code:

;;;###autoload
(defconst flyspell-mode-map '()) ; Avoid flyspell keybinds

(require 'flyspell)

(setq flyspell-use-meta-tab nil
      flyspell-auto-correct-previous-pos t)

(provide 'init_flyspell)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_flyspell.el ends here
