
;;; Community:
;;; Code:
(require 'dired-x)
(require 'rx)
(setq-default dired-omit-files-p t) ; Buffer-local variable
(setq dired-omit-files
      (apply
       `((lambda ()
           (rx (or (and line-start
                        (or (and (0+ ".") "#")
                            (and "." (0+ ".") line-end)))
                   (and (or ,@completion-ignored-extensions) line-end)))))))

(provide 'init_dired-x)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_dired-x.el ends here
