;;; init_helm-gtags.el --- init file for helm-gtags

;;; Commentary:

;;; Code:
(require 'cl-lib)
(require 'helm-gtags)

(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

(defvar my/helm-gtags-command "global --result=grep ")
(defvar my/helm-gtags-options "-g")
(defvar my/helm-gtags-libpath-alist
  '((rust-mode . "~/.ghq/github.com/rust-lang/rust/src")
    (go-mode   . "~/code/go/golang/src")))

(defun my/helm-gtags-set-GTAGSLIBPATH ()
  "Reset GTAGSLIBPATH before use it."
  (let ((gtagslibpath
         (helm-aif (assoc-default major-mode my/helm-gtags-libpath-alist)
             (file-truename it))))
    (setenv "GTAGSLIBPATH" gtagslibpath)
    gtagslibpath))

(advice-add 'helm-gtags-dwim :before 'my/helm-gtags-set-GTAGSLIBPATH)

(defun my/helm-gtags--pattern-init (&optional input)
  ""
  (when (string< "" (or input helm-pattern))
    (split-string
     (shell-command-to-string
      (format "global --result=grep %s \"%s\""
              my/helm-gtags-options helm-pattern)) "\n")))

(defconst my/helm-gtags-source
  `((name . "my helm gtags")
    (header-name . (lambda (name)
                     (format "%s %s (%s)" name
                             (pcase my/helm-gtags-options
                               (`""     "")
                               (`"-g"   "PATTERN")
                               (`"-r"   "RTAG")
                               (`"-s"   "SYMBOL")
                               (`"-Poa" "FILE"))
                             (concat my/helm-gtags-command
                                     my/helm-gtags-options))))
    (candidates . my/helm-gtags--pattern-init)
    (multiline) ; https://github.com/emacs-helm/helm/issues/529
    (real-to-display . my/helm-gtags-candidate-transformer)
    (nohighlight)
    (candidates-in-buffer)
    (candidate-number-limit . ,helm-gtags-maximum-candidates)
    (persistent-action . helm-gtags--persistent-action)
    (action . helm-gtags--action-openfile)))

(defconst my/helm-gtags-map
  (let* ((map (make-sparse-keymap)))
    (set-keymap-parent map helm-map)
    (define-key map (kbd "C-o") 'my/helm-gtags-change-option)
    map))

(defun my/helm-gtags-change-option ()
  ""
  (interactive)
  (setq my/helm-gtags-options
        (pcase my/helm-gtags-options
          (`"-g"   "-r")   ; pattern
          (`"-r"   "-s")   ; rtag
          (`"-s"   "-Poa") ; symbol
          (`"-Poa" "")     ; file
          (my/helm-gtags-options "-g")))
  (helm-update))

;; borrowed from helm-gtags.el
(defun my/helm-gtags-format (candidate)
  ""
  (if (string-match "\\`\\([^:]+\\):\\([^:]+\\):\\(.*\\)" candidate)
      (format "%s:%s:\n  %s"
              (propertize (match-string 1 candidate) 'face 'helm-gtags-file)
              (propertize (match-string 2 candidate) 'face 'helm-gtags-lineno)
              (helm-gtags--highlight-candidate (match-string 3 candidate)))
    candidate))

(defun my/helm-gtags-candidate-transformer (candidate)
  ""
  (my/helm-gtags-format
   (if (string-match ".*\\(/src/.*\\)" candidate)
       (format "..%s" (match-string 1 candidate))
     candidate)))

(defun my/helm-gtags ()
  ""
  (interactive)
  (if (equal (my/helm-gtags-set-GTAGSLIBPATH)
             (getenv "GTAGSLIBPATH")) ; ensure modification of the env
      (helm :sources `(,my/helm-gtags-source)
            :keymap my/helm-gtags-map)
    (error "GTAGSLIBPATH didn't match.")))

(provide 'init_helm-gtags)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_helm-gtags.el ends here
