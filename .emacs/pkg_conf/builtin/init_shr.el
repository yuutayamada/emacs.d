;;; init_shr.el --- init file for shr.el

;;; Commentary:

;;; Code:
(require 'shr)
(require 'shr-color)

(setq
 ;; Disable needless luminance
 shr-color-visible-luminance-min 100
 ;; Disable images
 shr-inhibit-images t
 ;; Disable using background color of web site except `shr-colorize-region'
 shr-inhibit-decoration t)

(apply `((lambda ()
           (defadvice shr-colorize-region (around use-fixed-color activate)
             "Force dark background & light foreground color."
             (ad-set-arg 2 ,(frame-parameter nil 'foreground-color))
             (ad-set-arg 3 ,(frame-parameter nil 'background-color))
             ad-do-it))))

(provide 'init_shr)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_shr.el ends here
