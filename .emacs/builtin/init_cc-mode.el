;;; init_cc-mode.el --- init file for c-mode

;;; Commentary:
;; You can change current buffer's style by C-c C-o key.
;; See `c-style-alist' to get style information.

;;; cc-mode links
;; cc-mode manual       : http://www.delorie.com/gnu/docs/emacs/cc-mode_32.html
;; indentation functions: http://www.delorie.com/gnu/docs/emacs/cc-mode_33.html
;; http://yohshiy.blog.fc2.com/blog-entry-264.html
;;; Code:

(require 'cc-vars)
(require 'cl-lib)

;; Define style
(setq c-default-style
      '((other     . "Google") ; from google-c-style guide
        (java-mode . "my-java")
        (awk-mode  . "awk")))

(add-hook 'c-mode-common-hook
          '(lambda ()
             ;; convenience functions related C
             (cl-case major-mode
               ((c-mode c++-mode java-mode arduino-mode)
                (unless (eq major-mode 'java-mode)
                  (add-to-list 'company-backends 'company-c-headers))
                ;; insert newline after insert automatically
                (c-toggle-auto-newline t)
                ;; delete needless space?
                (c-toggle-hungry-state t)))))

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

(provide 'init_cc-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_cc-mode.el ends here
