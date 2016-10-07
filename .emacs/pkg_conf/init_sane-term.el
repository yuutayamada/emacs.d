;;; init_sane-term.el --- sane-term configuration -*- lexical-binding: t; -*-

;;; Commentary:

;;

;;; Code:

;; Use fish shell as default shell
(defconst sane-term-shell-command
  (or (executable-find "fish") sane-term-shell-command))

(provide 'init_sane-term)
;;; init_sane-term.el ends here
