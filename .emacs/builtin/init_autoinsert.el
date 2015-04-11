;;; init_autoinsert.el --- init file for auto insert mode  -*- lexical-binding: t; -*-
;;; Commentary:
;; You should set `user-full-name' and `user-email-addres' to use this program.
;;; Code:

;; work in progress
;; Should I use after-change-major-mode-hook?

(when (bound-and-true-p yatemplate-dir)
  (setq auto-mode-alist (cons `(,yatemplate-dir . snippet-mode) auto-mode-alist))
  (defconst auto-insert-directory yatemplate-dir))

(provide 'init_autoinsert)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_autoinsert.el ends here
