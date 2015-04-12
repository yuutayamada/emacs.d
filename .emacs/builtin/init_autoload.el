;;; init_autoload.el --- init file for autoload.el   -*- lexical-binding: t; -*-

;;; Commentary:
;; My autoload support functions
;; I heavily stole from :
;; http://www.emacswiki.org/emacs/UpdateAutoloads
;; http://www.lunaryorn.com/2014/07/02/autoloads-in-emacs-lisp.html
;;; Code:

(require 'my_paths)
(require 'cl-lib)

;;;###autoload
(defun Y/make-autoload-files (&optional FILES)
  "Make autoload files from elisp directory.
FILES should put a place where is located to elisp directory."
  (interactive)
  (cl-loop with files = (or FILES (bound-and-true-p Y/autoload-files))
           for file in files do (Y/update-autoloads file)))

(defun Y/update-autoloads (filename)
  "Call `update-directory-autoloads'."
  ;; .nosearch
  (cl-loop with dirs = (cl-remove-if-not
                        'file-directory-p
                        (directory-files (file-name-directory filename) t))
           for dir in dirs
           for d = (concat dir "/lisp")
           if (and (file-directory-p d)
                   (not (string-match "/\\(\\.cask\\|test\\)/?$" d)))
           collect d into lisp-dir
           finally (Y/update-autoload-file filename (append dirs lisp-dir))))

(defun Y/update-autoload-file (filename dirs)
  (let ((generated-autoload-file filename))
    (apply `(update-directory-autoloads ,@dirs))
    (byte-compile-file generated-autoload-file)))

(provide 'init_autoload)
;;; init_autoload.el ends here
