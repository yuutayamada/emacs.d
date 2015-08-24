;;; init_ispell.el --- init file for ispell -*- lexical-binding: t; -*-

;;; Commentary:
;; You can set ASPELL_CONF environment variable like this:
;; export ASPELL_CONF="lang en_US; home-dir ${XDG_CONFIG_HOME}/aspell; sug-mode ultra;"
;;; Code:

(require 'ispell)

(setq ispell-program-name "aspell"
      ;; Use ispell even on camelcase!?
      ;; http://blog.binchen.org/posts/effective-spell-check-in-emacs.html#sec-2
      ispell-extra-args
      '("--sug-mode=ultra" "--lang=en_US" "--run-together" "--run-together-limit=5" "--run-together-min=2"))

;; work around ispell's highlighting of Japanese characters
(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+"))

(provide 'init_ispell)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ispell.el ends here
