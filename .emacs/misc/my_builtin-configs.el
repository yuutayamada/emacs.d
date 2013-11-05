;;; my_builtin-configs.el --- init file for built-in function

;; Copyright (C) 2013 by Yuta Yamada

;;; Commentary:

;;; Code:

(require 'cl-lib)

;;;* Coding System
(let*
    ((set-coding-system
      (lambda (coding)
        (set-clipboard-coding-system coding)
        (prefer-coding-system coding)
        (set-file-name-coding-system coding)
        (set-keyboard-coding-system coding)
        (set-default-coding-systems coding)
        (set-terminal-coding-system coding)
        (setq file-name-coding-system coding
              buffer-file-coding-system coding
              locale-coding-system coding)
        (add-to-list 'process-coding-system-alist `("git" . ,coding))
        (add-to-list 'auto-coding-alist `("COMMIT_EDITMSG" . ,coding))
        (defconst org-export-coding-system coding)))
     (decide-coding-system
      (lambda ()
        (if (string-match "linux-gnu" system-configuration)
            'utf-8
          ;; I don't know other environment
          'utf-8))))
  (funcall set-coding-system (funcall decide-coding-system)))

;;;* Default browser
;; TODO: fix this
;; This configuration cannot use at mew.el
;; (defconst browse-url-browser-function 'my/w3m-or-mozila-browser-function)
(defconst browse-url-mozilla-program "firefox")

(defun my/turn-on-builtin-function (keys)
  ""
  (cl-loop for key in keys do
           (cl-case key
             (:which-func
              (which-function-mode 1)
              (delete (assoc 'which-func-mode mode-line-format) mode-line-format)
              (setq-default header-line-format
                            '(which-func-mode ("" which-func-format)))))))

(provide 'my_builtin-configs)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_builtin-configs.el ends here
