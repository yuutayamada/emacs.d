;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;;; Commentary:
;;; Code:
(require 'my_autoload)
(require 'sgml-mode)

(define-key html-mode-map (kbd "<f6>") 
  (lambda ()
    (interactive)
    (web-mode)
    (flymake-mode 0)))

(define-key html-mode-map (kbd "C-c C-c") 'browse-url-of-file)

(provide 'init_sgml-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_sgml-mode.el ends here
