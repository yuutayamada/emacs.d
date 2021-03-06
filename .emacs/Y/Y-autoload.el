;;; Y-autoload.el --- autoload definitions -*- lexical-binding: t; -*-

;;; Commentary:

;; Load autoload files and used to be loaded from other configuration
;; files to suppress byte compile warnings.

;;; Code:

(require 'Y-paths)
(require 'Y-util)
(require 'Y-el-get)


;; FIXME: what is the proper way to use git version's org-mode?
;; Omit default org-mode from search path to use latest org-mode.
(require 'cl-lib)
(require 'find-func)
(setq load-path
      (cl-loop
       with file = (directory-file-name
                    (file-name-directory (find-library-name "org")))
       for f in load-path
       unless (equal f file)
       collect f))

(el-get 'sync 'org-mode) ; git version


;; Load Emacs’ autoload files (git.savannah.gnu.org/emacs/lisp/emacs)
(Y/message-startup-time "Emacs loaddefs")
(require 'loaddefs)


;; Prepare load-paths for this repository
(Y/message-startup-time "My loaddefs")
(let ((dev (concat elisp-dir "self/")))
  (Y/add-load-path-subdir `(,config-dir ,dev)))


;; see also `Y/make-autoload-files'
(defconst Y/autoload-files
  `(,(concat config-dir "Y/Y-loaddefs.el")
    ,(concat config-dir "pkg_conf/Y-conf-loaddefs.el")
    ,(concat elisp-dir  "self/Y-package-loaddefs.el")))

(require 'Y-loaddefs)
(require 'Y-conf-loaddefs)
(add-to-list 'load-path (concat elisp-dir "self"))
(require 'Y-package-loaddefs)


;; EL-GET autoload file
(Y/message-startup-time "el-get loaddefs")
(add-to-list 'load-path el-get-dir)
(require '.loaddefs)


;; autoload for evil
(autoload 'evil-normal-state "evil")


(Y/message-startup-time "Y-autoload done")

(provide 'Y-autoload)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-autoload.el ends here
