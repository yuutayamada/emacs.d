;;; init_elisp-mode.el --- init file for emacs-lisp mode
;;; Commentary:
;;; Code:

(require 'cl-lib)

(cl-loop with elisp-mode-hooks = '(emacs-lisp-mode-hook ielm-mode-hook)
         for hook in elisp-mode-hooks
         do (add-hook hook 'eldoc-mode))

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (when (fboundp 'electric-indent-local-mode)
               (electric-quote-local-mode t))
             (when (and (stringp buffer-file-name)
                        (string-match custom-theme-directory
                                      (file-name-directory buffer-file-name)))
               (rainbow-mode t))))

(provide 'init_elisp-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_elisp-mode.el ends here

