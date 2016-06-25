;;; Y-elisp-mode.el --- init file for emacs-lisp mode
;;; Commentary:

;; Created this file to add elisp configuration by
;; emacs-lisp-mode-hook after my all configuration was loaded.

;;; Code:

(require 'cl-lib)

(cl-loop with elisp-mode-hooks = '(emacs-lisp-mode-hook ielm-mode-hook)
         for hook in elisp-mode-hooks
         do (add-hook hook 'eldoc-mode))

;;;###autoload
(defsubst Y-init-elisp-config ()
  "Setup my Emacs Lisp config.
This function is called from site-start.el."
  ;; (remove-hook 'emacs-lisp-mode-hook 'Y-init-elisp-config)
  (el-get 'sync '(auto-compile paredit rainbow-mode))
  (paredit-mode 1)
  (require 'auto-compile)
  (when (fboundp 'electric-indent-local-mode)
    (electric-quote-local-mode t))
  (when (and (stringp buffer-file-name)
             (string-match custom-theme-directory
                           (file-name-directory buffer-file-name)))
    (rainbow-mode t)))

(provide 'Y-elisp-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-elisp-mode.el ends here
