;;; depend_main.el --- init file for depending on Emacs version or terminal

;;; Commentary:
;;
;;; Code:

(require 'cl-lib)

;; OS
(cl-case system-type
  (gnu/linux
   ;; Sep 27, 2016: comment out. Somehow I could use mozc fcitx without this.
   ;; Do I really need this?
   ;; IME (fcitx)
   (when (and (fboundp 'fcitx-aggressive-setup) (require 'fcitx))
     (defconst fcitx-use-dbus t)
     (fcitx-aggressive-setup)))
  (cygwin
   (load "depend_windows")))

(condition-case err
    (apply `(require ,(intern (format "depend_emacs%i" emacs-major-version))))
  (error err))

(provide 'depend_main)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; depend_main.el ends here
