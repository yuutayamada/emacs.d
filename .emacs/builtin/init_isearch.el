;;; init_isearch.el --- init file for isearch

;;; Commentary:

;;; Code:

(require 'init_migemo)

(add-hook 'isearch-mode-hook 'global-ace-isearch-mode)

(require 'mykie)
(mykie:set-keys isearch-mode-map
  "C-i" my/isearch-exit
  "C-j" isearch-exit
  "C-o" isearch-query-replace-regexp
  "C-h" isearch-delete-char
  "C-e" migemo-isearch-toggle-migemo)

(provide 'init_isearch)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_isearch.el ends here
