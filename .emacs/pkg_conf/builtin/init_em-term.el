
;;; Commentary:
;;; Code:

(require 'em-term)

;; em-term
(add-to-list 'eshell-visual-commands "vim")

;; Configure this to show git log correctly.
(setq eshell-visual-subcommands
      '(("git" "log" "diff" "show"))
      eshell-visual-options
      '("git" "--help"))

(provide 'init_em-term)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_em-term.el ends here
