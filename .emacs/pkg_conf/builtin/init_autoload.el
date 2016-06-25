;;; init_autoload.el --- init file for autoload.el   -*- lexical-binding: t; -*-

;;; Commentary:
;; My autoload support functions
;; I heavily stole from :
;; http://www.emacswiki.org/emacs/UpdateAutoloads
;; http://www.lunaryorn.com/2014/07/02/autoloads-in-emacs-lisp.html
;;; Code:

;; (require 'my_paths)
(require 'cl-lib)
(require 'autoload)

(defun Y/update-autoloads (filename)
  "Call `update-directory-autoloads'.

 The FILENAME automatically becomes ‘generated-autoload-file’."
  ;; .nosearch
  (cl-loop with update = (lambda (filename dirs)
                           (cl-letf ((generated-autoload-file filename))
                             (apply `(update-directory-autoloads ,@dirs))
                             (byte-compile-file filename)))
           with dirs = (cl-remove-if-not
                        'file-directory-p
                        (directory-files (file-name-directory filename) t))
           for dir in dirs
           for d = (concat dir "/lisp")
           if (and (file-directory-p d)
                   (not (string-match "/\\(\\.cask\\|test\\)/?$" d)))
           collect d into lisp-dir
           finally (funcall update filename (append dirs lisp-dir))))

;;;###autoload
(defun Y/make-autoload-files (&optional FILES)
  "Make autoload files from elisp directory.
FILES should put a place where is located to elisp directory."
  (interactive)
  (cl-loop with files = (or FILES (bound-and-true-p Y/autoload-files))
           for file in files do (Y/update-autoloads file)))

(provide 'init_autoload)
;;; init_autoload.el ends here
