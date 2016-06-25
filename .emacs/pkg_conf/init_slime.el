;;; -*- coding: utf-8; mode: emacs-lisp; -*-
;; IDE for common lisp development environment

(defconst inferior-lisp-program "clisp -I")
(defconst slime-net-coding-system 'utf-8-unix)

(require 'Y-autoload)
(require 'slime)
(require 'slime-autoloads)
(require 'slime-repl)
(require 'mykie)

(mykie:set-keys slime-mode-map "C-c C-c" nil)

(slime-setup '(slime-asdf
               slime-autodoc
               slime-editing-commands
               slime-fancy
               slime-banner
               slime-fontifying-fu
               slime-fuzzy
               slime-indentation
               slime-mdot-fu
               slime-package-fu
               slime-references
               slime-repl
               slime-sbcl-exts
               slime-scratch
               slime-xref-browser
               slime-repl))

;;*slime
(require 'init_popwin)

;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)

(defadvice slime-compile-defun
  (around ad-lisp-mode-do-slime activate)
  (unless (slime-connected-p)
    (slime))
  ad-do-it)

(defadvice slime-interactive-eval
  (around advice-name activate)
  (unless (slime-connected-p)
    (slime))
  ad-do-it)

(provide 'init_slime)
