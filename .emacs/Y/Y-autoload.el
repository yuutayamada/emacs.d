;;; Y-autoload.el --- autoload definitions
;;; Commentary:
;;; Code:

(require 'Y-paths)
(require 'Y-util)
(require 'Y-el-get)

;; Prepare load-paths
(let ((dev (concat elisp-dir "self/")))
  (Y/add-load-path-subdir
   `(,package-dir ,config-dir ,dev)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AUTOMATICALLY-GENERATED FUNCTION LOADING ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; autoload file of git.savannah.gnu.org/emacs/lisp/emacs
(Y/message-startup-time "loaddefs")
(require 'loaddefs)

;; EL-GET
(Y/message-startup-time "el-get")
(add-to-list 'load-path el-get-dir)
(require '.loaddefs)
(autoload 'el-get "el-get") ; for ‘el-get’ function

;; Lookup.el
(Y/message-startup-time "lookup-autoloads")
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

;; work around for evil
(autoload 'evil-normal-state "evil")

(provide 'Y-autoload)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-autoload.el ends here
