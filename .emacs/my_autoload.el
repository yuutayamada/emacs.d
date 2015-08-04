;;; my_autoload.el --- autoload definitions
;;; Commentary:
;;; Code:
(require 'my_paths)
(require 'my_util)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AUTOMATICALLY-GENERATED FUNCTION LOADING ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; autoload file of git.savannah.gnu.org/emacs/lisp/emacs
(message-startup-time "loaddefs")
(require 'loaddefs)

;; EL-GET
(message-startup-time "el-get")
(add-to-list 'load-path el-get-dir)
;; Note that the .loaddefs is including skk-setup.el loading.
(require '.loaddefs)

;; Helm
(message-startup-time "helm-config")
(require 'helm-config)

;; Lookup.el
(message-startup-time "lookup-autoloads")
(run-with-idle-timer 3 nil (lambda () (require 'lookup-autoloads nil t))) ; work around test

;;;;;;;;;;;;;;;;;;;;;;;
;; My autoload files ;;
;;;;;;;;;;;;;;;;;;;;;;;
(defconst Y/autoload-files `(,(concat elisp-dir  "self/Y-loaddefs.el")
                             ,(concat config-dir "yy-loaddefs.el")))

(condition-case err
    (progn (require 'yy-loaddefs)
           (add-to-list 'load-path (concat elisp-dir "self"))
           (require 'Y-loaddefs))
  (error (with-no-warnings
           (Y/make-autoload-files Y/autoload-files)
           (require 'yy-loaddefs)
           (require 'Y-loaddefs))))

;; Load my autoload configurations
(message-startup-time "autoload...")
(apply `((lambda () (autoloader-autoloads ,@(Y/get-autoloads)))))

;; Load files with `with-eval-after-load' func from `package-conf-dir'.
(message-startup-time "configuring init files")
(Y/add-after-load-files "init_" (concat config-dir "builtin"))
(Y/add-after-load-files "init_" package-conf-dir)

(provide 'my_autoload)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_autoload.el ends here
