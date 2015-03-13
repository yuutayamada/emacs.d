;;; my_autoload.el --- autoload definitions
;;; Commentary:
;;; Code:
(require 'my_paths)
(require 'my_util)

;; Load files with `with-eval-after-load' func from `package-conf-dir'.
(Y/add-after-load-files "init_" package-conf-dir)
(Y/add-after-load-files "init_" (concat package-conf-dir "builtin"))

;; Load my autoload configurations
(apply `((lambda () (autoloader-autoloads ,@(Y/get-autoloads)))))

;; AUTOMATICALLY-GENERATED FUNCTION LOADING ;;
;; autoload file of git.savannah.gnu.org/emacs/lisp/emacs
(require 'loaddefs)

;; EL-GET
(add-to-list 'load-path el-get-dir)
(require '.loaddefs)

;; Helm
(require 'helm-config)

;; Lookup.el
(require 'lookup-autoloads nil t) ; work around test

(provide 'my_autoload)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_autoload.el ends here
