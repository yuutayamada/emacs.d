;;; init_elisp-mode.el --- init file for emacs-lisp mode
;;; Commentary:
;;; Code:

(require 'cl-lib)
(require 'my_autoload)

;; elisp-mode
(defvar my-lisp-mode-hooks '(emacs-lisp-mode-hook
                             lisp-interaction-mode-hook
                             ielm-mode-hook
                             lisp-mode-hook))

;; I don't want to load emacs-lisp mode's configuration when boot time.
(define-key lisp-interaction-mode-map (kbd "C-o") 'emacs-lisp-mode)

(defun my/setup-lisp-mode ()
  ""
  (eldoc-mode)
  (defadvice indent-for-tab-command (around yas-load-ad activate)
    (progn
      (require 'init_yasnippet)
      ad-do-it)))

(cl-loop for hook in my-lisp-mode-hooks do
         (add-hook hook 'my/setup-lisp-mode))

(provide 'init_elisp-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_elisp-mode.el ends here

