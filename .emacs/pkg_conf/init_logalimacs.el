;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(require 'vars)
(require 'my_function)
(require 'init_eiji)

;; Configurations for logalimacs

(defconst loga-use-dictionary-option t)
(defconst loga-use-stemming t)
(defconst loga-use-singular-form t)
(defconst loga-use-auto-detect-language t)
(defconst loga-result-limit 3)

(defconst loga-popup-ignoring-major-mode-list
  '(org-mode twittering-mode))

;; My Favorite
(defconst loga-width-limit-source 100)
(defconst loga-fallback-function
  (lambda (search-word)
    (eiji:search search-word :popwin t)))

(require 'logalimacs)

;; Use text-translator when the translation failed
(defvar text-translator-auto-selection-func
  'text-translator-translate-by-auto-selection-enja)

(defun my/search-pronunciation ()
  (interactive)
  (let* ((search-word (loga-decide-source-word))
         (code "~/bb/code/ruby/oxford.rb ")
         (pronunciation (when (string-match "[^ ]" search-word)
                          (shell-command-to-string
                           (concat "ruby " code search-word)))))
    (setq kill-ring
          (push pronunciation kill-ring))
    (if current-prefix-arg
        (insert pronunciation)
      (popup-tip pronunciation))))

(provide 'init_logalimacs)
