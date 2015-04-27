;;; init_undo-tree.el --- init file for undo-tree.el

;;; Commentary:

;;; Code:
(require 'undo-tree)

(require 'mykie)
;; On terminal Emacs, I can't use C-q because tmux is using the key as prefix.
(mykie:set-keys undo-tree-visualizer-mode-map
  "q"   undo-tree-visualizer-abort
  "C-g" undo-tree-visualizer-quit
  "C-j" undo-tree-visualizer-quit
  "RET" undo-tree-visualizer-quit)

(provide 'init_undo-tree)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_undo-tree.el ends here
