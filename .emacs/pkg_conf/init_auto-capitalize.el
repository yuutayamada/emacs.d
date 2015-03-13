;;; init_auto-capitalize.el --- init file for auto-capitalize.el
;;; Commentary:
;;; Code:

(require 'auto-capitalize)
(require 'capitalizer-auto-capitalize)
(require 'cl-lib)

(setq auto-capitalize-predicate
      '(lambda ()
         ;; Prevent auto-capitalize if return nil
         (and (not buffer-read-only)
              (string-match "[ ,.]" (char-to-string last-command-event))
              (cl-case major-mode
                (eshell-mode nil)
                (inferior-haskell-mode nil)
                (t t))
              (or (not (bound-and-true-p skk-mode))
                  (and (bound-and-true-p skk-mode)
                       (equal 'latin (skk-current-input-mode)))))))

(provide 'init_auto-capitalize)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_auto-capitalize.el ends here
