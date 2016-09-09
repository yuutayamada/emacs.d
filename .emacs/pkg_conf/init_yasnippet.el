;;; init_yasnippet.el --- init file for yasnippet.el

;;; Commentary:

;;; Code:

(require 'yasnippet)

(setq yas-prompt-functions
      '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))

;; memo:
;;   ‘yas--keybinding-beyond-yasnippet’ is fallback function

;; (mykie:set-keys yas-minor-mode-map "TAB" yas-expand)
;; (define-key yas-minor-mode-map (kbd "C-S-TAB") 'yas-expand)
(yas-global-mode)

;;;###autoload
(defun Y/generic-yas (func)
  "Call FUNC.
Reduce loading time using autoload cookie."
  (interactive)
  (call-interactively func))

(provide 'init_yasnippet)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_yasnippet.el ends here
