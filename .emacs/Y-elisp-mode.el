;;; Y-elisp-mode.el --- init file for emacs-lisp mode
;;; Commentary:

;; Created this file to add elisp configuration by
;; emacs-lisp-mode-hook after my all configuration was loaded.

;;; Code:

(require 'cl-lib)

;;;###autoload
(defsubst Y-init-elisp-config ()
  "Setup my Emacs Lisp config."
  (remove-hook 'emacs-lisp-mode-hook 'Y-init-elisp-config)
  (cl-loop with elisp-mode-hooks = '(emacs-lisp-mode-hook ielm-mode-hook)
           for hook in elisp-mode-hooks
           do (add-hook hook 'eldoc-mode))

  (add-hook 'emacs-lisp-mode-hook
            '(lambda ()
               (require 'auto-compile)
               (when (fboundp 'electric-indent-local-mode)
                 (electric-quote-local-mode t))
               (when (and (stringp buffer-file-name)
                          (string-match custom-theme-directory
                                        (file-name-directory buffer-file-name)))
                 (rainbow-mode t)))))

(provide 'Y-elisp-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-elisp-mode.el ends here
