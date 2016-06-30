;;; init_yasnippet.el --- init file for yasnippet.el

;;; Commentary:

;;; Code:

(defconst yas-snippet-dirs `(,(concat user-emacs-directory "snippets")
                             ,(concat el-get-dir "yasnippet/yasmate/snippets")
                             ,(concat el-get-dir "yasnippet/snippets")))

(setq yas-prompt-functions
      '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))


;; memo:
;;   ‘yas--keybinding-beyond-yasnippet’ is fallback function

;; (mykie:set-keys yas-minor-mode-map "TAB" yas-expand)

;; turn on yas global mode
(run-with-idle-timer 2.0 nil 'yas-global-mode)

(provide 'init_yasnippet)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_yasnippet.el ends here
