;;; Y-prog-mode.el --- config file for prog-mode.el -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'cl-lib)
(require 'Y-autoload)

(el-get 'sync '(indent-guide rainbow-delimiters rainbow-mode paredit))

(add-hook 'prog-mode-hook
          '(lambda ()
             ;; Electric-indent-mode
             ;; should turn off python or haskell?
             ;; (electric-indent-local-mode -1)
             ;; auto capitalize
             (auto-capitalize-mode)
             ;; linum relative
             ;; (linum-relative-mode t)
             ;; Auto Completion
             (company-mode t)
             ;; indentation and whitespace
             (cl-case major-mode
               ((go-mode sql-mode)
                (setq-local indent-tabs-mode t)) ; Use tab instead of space
               (t (whitespace-mode t)))
             ;; show paren
             (show-paren-mode t)
             ;; hideshow
             (hs-minor-mode t)
             ;; flycheck or other syntax check tool
             (cl-case major-mode
               ((scala-mode clojure-mode coffee-mode)
                nil)
               (t (flycheck-mode t)))
             (unless prettify-symbols-mode
               (prettify-symbols-mode t))
             (indent-guide-mode t)
             (rainbow-delimiters-mode)
             ;; flyspell-prog-mode
             (flyspell-prog-mode)))

(add-hook 'before-save-hook
          #'(lambda ()
              ;; Format source code before save.
              (let ((cmd
                     (cl-case major-mode
                       (js2-mode (when (executable-find "jsfmt") 'jsfmt))
                       (go-mode  'gofmt-before-save)
                       ((c++-mode arduino-mode) 'cpp-auto-include))))
                (when cmd (call-interactively cmd)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Lisp
(el-get 'sync 'auto-compile)
(add-hook 'emacs-lisp-mode-hook 'Y-init-elisp-config)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRETTIFY-SYMBOLS-MODE ;;

;; LISP
(setq-default lisp--prettify-symbols-alist `(("lambda" . ?ƛ)))
(advice-add 'prettify-symbols-mode :before
            #'(lambda (&rest _r)
                (cl-case major-mode
                  (haskell-mode
                   (push '("\\"       . ?ƛ) prettify-symbols-alist))
                  (js2-mode
                   (push '("function" . ?ƛ) prettify-symbols-alist))
                  (lua-mode
                   (push '("function" . ?ƛ) prettify-symbols-alist))
                  (verilog-mode
                   (push '("begin"    . ?\{) prettify-symbols-alist)
                   (push '("end"      . ?}) prettify-symbols-alist)))))

(provide 'Y-prog-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-prog-mode.el ends here
