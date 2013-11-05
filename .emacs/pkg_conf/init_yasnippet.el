;;; init_yasnippet.el --- init file for yasnippet.el

;;; Commentary:

;;; Code:
(require 'auto-complete)
(require 'yasnippet)

(when (bound-and-true-p my/yasnippet-dir)
  (defconst yas-snippet-dirs `(,my/yasnippet-dir)))

(yas-global-mode 1)

;; from http://www.emacswiki.org/emacs/Yasnippet
(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t)))

(setq yas-prompt-functions
      '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))

(provide 'init_yasnippet)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_yasnippet.el ends here
