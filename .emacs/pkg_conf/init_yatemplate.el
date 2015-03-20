;;; init_yatemplate.el --- init file for yatemplate.el -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(defadvice yatemplate-filename-split-regex (around prevent-warning activate)
  "Prevent warning."
  (unless (equal ".dir-locals.el" (ad-get-arg 0))
    ad-do-it))

(require 'yatemplate)
(yatemplate-fill-alist)

(provide 'init_yatemplate)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_yatemplate.el ends here
