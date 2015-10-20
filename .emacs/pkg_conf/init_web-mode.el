;;; init_web-mode.el --- init file for web-mode.el -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'web-mode)
(require 'rx)

;;;###autoload
(add-to-list 'auto-mode-alist
             (cons (rx "." (or "html" "phtml" "tpl.php" "erb" "mustache" "djhtml"
                               (and (or "a" "g" "j") "sp")
                               (and "as" (or "c" "p") "x"))
                       line-end)
                   'web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (define-key web-mode-map (kbd "<f6>") 'html-mode)
            (define-key web-mode-map (kbd "C-c C-c") 'browse-url-of-file)))

(provide 'init_web-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_web-mode.el ends here
