;;; init_view-mode.el --- init file for view mode
;;; Commentary:
;;; Code:

(require 'view)
(require 'mykie)

(mykie:set-keys view-mode-map
  "N"   View-search-last-regexp-backward
  "?"   View-search-regexp-backward
  "h"   backward-char
  "j"   next-line
  "k"   previous-line
  "l"   forward-char
  "f"   View-scroll-page-forward
  "b"   View-scroll-page-backward
  "SPC" View-scroll-page-backward
  "q"
  :default   view-mode
  :outline-mode View-quit-all
  :Man-mode     View-quit-all
  :help-mode    View-quit-all)

(provide 'init_view)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_view.el ends here
