;;; init_ispell.el --- init file for ispell -*- lexical-binding: t; -*-

;;; Commentary:
;; You can set ASPELL_CONF environment variable like this:
;; export ASPELL_CONF="lang en_US; home-dir ${XDG_CONFIG_HOME}/aspell; sug-mode ultra;"
;;; Code:

(require 'ispell)

(setq ispell-program-name "aspell")

;; work around ispell's highlighting of Japanese characters
(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+"))

(provide 'init_ispell)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ispell.el ends here
