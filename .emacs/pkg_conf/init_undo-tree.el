;;; init_undo-tree.el --- init file for undo-tree.el

;;; Commentary:

;;; Code:
(require 'undo-tree)

(require 'mykie)
;; On terminal Emacs, I can't use C-q because tmux is using the key as prefix.
(mykie:set-keys undo-tree-visualizer-mode-map
  "q"   :default undo-tree-visualizer-abort
  "C-g" :default undo-tree-visualizer-quit
  "C-j" :default undo-tree-visualizer-quit
  "RET" :default undo-tree-visualizer-quit)

(provide 'init_undo-tree)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_undo-tree.el ends here
