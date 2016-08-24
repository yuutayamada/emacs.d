;;; depend_main.el --- init file for depending on Emacs version or terminal

;;; Commentary:

;;; Code:

(require 'cl-lib)
(apply `(require ,(intern (format "depend_emacs%i" emacs-major-version))))

;; OS
(cl-case system-type
  (gnu/linux
   ;; IME (fcitx)
   (when (fboundp 'fcitx-aggressive-setup)
     (require 'fcitx)
     (defconst fcitx-use-dbus t)
     (fcitx-aggressive-setup)))
  (cygwin
   (load "depend_windows")))

(provide 'depend_main)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; depend_main.el ends here
