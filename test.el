;;; test.el --- test my Emacs configuration on Travis CI
;;; Commentary:
;;; Code:

(defconst Y/on-test t)

(setq byte-compile-error-on-warn t)

(require 'ert)
(eval-when-compile (require 'cl)) ; for assert function

;; Use this code from travis.
(assert (equal "travis" (user-login-name)))

(let ((dir (expand-file-name "~/build/yuutayamada/emacs.d/.emacs/")))
  (add-to-list 'load-path dir)
  (setenv "EMACSLOADPATH" (concat dir ":")))

(assert (equal (getenv "EMACSLOADPATH")
               "/home/travis/build/yuutayamada/emacs.d/.emacs/:"))

;; test my init file with el-get loading
(require 'init)

(provide 'test)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; no-byte-compile: t
;; End:

;;; test.el ends here
