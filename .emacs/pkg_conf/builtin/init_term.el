;;; init_term.el ---                                 -*- lexical-binding: t; -*-


;;; Commentary:

;;

;;; Code:

(require 'term)

(defconst Y-term-mode-line-colors (cons "#899ba6" "#83afe5"))

;; Y-update-modeline
(advice-add 'term-char-mode :after
            (lambda (&rest _r)
              (Y-update-modeline (car Y-term-mode-line-colors))))

(advice-add 'term-line-mode :after
            (lambda (&rest _r)
              (Y-update-modeline (cdr Y-term-mode-line-colors))))

;; This is actually  C-c C-y key
(define-key term-raw-escape-map (kbd "C-y") 'term-paste)

(provide 'init_term)
;;; init_term.el ends here
