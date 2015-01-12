;;; init_cc-mode.el --- init file for c-mode

;;; Commentary:
;; You can change current buffer's style by C-c C-o key.
;; See `c-style-alist' to get style information.
;;; Code:

(require 'my_autoload)
(require 'cc-vars)

;; cc-mode includes several major-mode like c-mode, c++-mode or java-mode.
(add-hook 'c-mode-hook   'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'java-mode-hook (lambda () (require 'init_java)))

;;; cc-mode links
;; cc-mode manual       : http://www.delorie.com/gnu/docs/emacs/cc-mode_32.html
;; indentation functions: http://www.delorie.com/gnu/docs/emacs/cc-mode_33.html
;; http://yohshiy.blog.fc2.com/blog-entry-264.html

(c-add-style "my-c-style"
             '("gnu"
               (c-offsets-alist
                (arglist-intro      . ++)
                (cpp-define-intro   . 0) ; ?
                (innamespace        . -)
                (inline-open        . 0)
                (inher-cont         . c-lineup-multi-inher)
                (member-init-cont   . c-lineup-multi-inher)
                (template-args-cont . +)
                ;;(inher-intro . 2)
                ;;(member-init-intro . 2)
                )))

;; Java indenting information: http://www.emacswiki.org/emacs/IndentingC
(c-add-style "my-java"
             `("java"
               (c-basic-offset . ,tab-width)
               (c-offsets-alist
                ;; The below inexpr-class fix below code's indentation.
                ;; foo = new Class.Something() {}
                (inexpr-class . 0)
                ;; Indent of method's argument
                ;; public void longMethodName(v indent starts here
                ;;                            |
                (arglist-intro . +) ; ++ -> +
                ;; switch, case indent
                (case-label . 2))))

;; Define style
(setq c-default-style
      '((java-mode . "my-java")
        (awk-mode  . "awk")
        (other     . "gnu")))

(provide 'init_cc-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_cc-mode.el ends here
