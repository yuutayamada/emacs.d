;;; my_autoload.el --- autoload definitions
;;; Commentary:
;;; Code:
(require 'my_paths)
(require 'my_util)

;; http://www.emacswiki.org/emacs/UpdateAutoloads
;; http://www.lunaryorn.com/2014/07/02/autoloads-in-emacs-lisp.html
(defun Y/update-autoloads (filename)
  "Call `update-directory-autoloads'."
  ;; .nosearch
  (cl-loop with dirs = (cl-remove-if-not 'file-directory-p (directory-files (file-name-directory filename) t))
           for dir in dirs
           for d = (concat dir "/lisp")
           if (file-directory-p d)
           collect d into lisp-dir
           finally (Y/update-autoload-file filename (append dirs lisp-dir))))

(defun Y/update-autoload-file (filename dirs)
  (let ((generated-autoload-file filename))
    (apply `(update-directory-autoloads ,@dirs))
    (byte-compile-file generated-autoload-file)))

(defun Y/update-autoload-self-directory ()
  ""
  (interactive)
  (Y/update-autoloads (concat elisp-dir  "self/Y-loaddefs.el"))
  (Y/update-autoloads (concat config-dir "yy-loaddefs.el")))

(if (not (require 'yy-loaddefs nil t))
    (Y/update-autoloads (concat config-dir "yy-loaddefs.el"))
  (require 'yy-loaddefs))

;; Load my autoload configurations
(message-startup-time "autoload...")
(apply `((lambda () (autoloader-autoloads ,@(Y/get-autoloads)))))

;; Load files with `with-eval-after-load' func from `package-conf-dir'.
(message-startup-time "configuring init files")
(Y/add-after-load-files "init_" (concat config-dir "builtin"))
(Y/add-after-load-files "init_" package-conf-dir)

;; My libraries
(add-to-list 'load-path (concat elisp-dir "self"))
(if (not (require 'Y-loaddefs nil t))
    (Y/update-autoloads (concat elisp-dir "self/Y-loaddefs.el"))
  (require 'Y-loaddefs))

;; AUTOMATICALLY-GENERATED FUNCTION LOADING ;;
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

(provide 'my_autoload)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_autoload.el ends here
