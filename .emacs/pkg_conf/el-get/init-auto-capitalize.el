;;; init-auto-capitalize.el --- init file for auto-capitalize.el
;;; Commentary:
;;; Code:

(require 'my_function)

(require 'cl-lib)
(require 'auto-capitalize)
(require 'capitalizer-auto-capitalize)

(setq auto-capitalize-words
      `("I" "English" "Japan" "ASAP" "Linux"
        "Japanese" "ASCII" "CPU" "Halloween"
        ,@(my/get-aspell-capital-words
           (format "%s/aspell/.aspell.en.pws" (getenv "XDG_CONFIG_HOME")))))

(setq auto-capitalize-predicate
      '(lambda ()
         ;; Prevent auto-capitalize if return nil
         (and (not buffer-read-only)
              (not (equal "*scratch*" (buffer-name)))
              (string-match "[ ,.]" (char-to-string last-command-event))
              (cl-case major-mode
                (eshell-mode nil)
                (inferior-haskell-mode nil)
                (t t))
              (or (not (bound-and-true-p skk-mode))
                  (and (bound-and-true-p skk-mode)
                       (equal 'latin (skk-current-input-mode)))))))

(provide 'init-auto-capitalize)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init-auto-capitalize.el ends here
