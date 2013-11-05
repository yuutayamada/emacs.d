;;; -*- coding: utf-8; mode: emacs-lisp; -*-
(require 'init_flymake)

(defun flymake-jade-init ()
  (interactive)
  (let* ((temp-file
          (flymake-init-create-temp-buffer-copy
           'flymake-create-temp-with-folder-structure))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name)))
         (arglist (list (file-truename local-file))))
    (list "jade" arglist)))

(setq flymake-err-line-patterns
       (cons '("\\(.*\\): \\(.+\\):\\([[:digit:]]+\\)$"
              2 3 nil 1)
            flymake-err-line-patterns))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.jade\\'" flymake-jade-init))

(provide 'init_flymake-for-jade)
