;;; depend_main.el --- init file for depending on Emacs version or terminal

;;; Commentary:

;;; Code:
(apply `(require ,(intern (format "depend_emacs%i" emacs-major-version))))

;; OS
(cond
 ;; for Mac
 ((string-match "apple-darwin" system-configuration)
  nil)
 ;; for Linux
 ((string-match "linux-gnu" system-configuration)
  nil)
 ;; for Windows
 ((string-match "mingw" system-configuration)
  (load "depend_windows")))

;; For booting Emacs from terminal
(when (not (display-graphic-p))
  (require 'depend_terminal-emacs))

(provide 'depend_main)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; depend_main.el ends here
