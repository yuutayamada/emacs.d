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
(require '.loaddefs)
(autoload 'el-get "el-get") ; for ‘el-get’ function

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

;; work around for evil
(autoload 'evil-normal-state "evil")

(provide 'my_autoload)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_autoload.el ends here
