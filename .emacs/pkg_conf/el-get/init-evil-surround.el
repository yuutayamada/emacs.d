;;; init-evil-surround.el --- init file for evil-surround.el
;;; Commentary:
;; Add surrounding
;;   You can surround in visual-state with S<textobject> or
;;   gS<textobject>. or in normal-state with ys<textobject> or yS<textobject>.
;; Change surrounding
;;   You can change a surrounding with cs<old-textobject><new-textobject>.
;; Delete surrounding
;;   You can delete a surrounding with ds<textobject>.

;; -- Evil surround (I changed the prefix to "s" key) --
;; ysiw - surround a word
;; yss  - surround a whole line
;; ds"  - delete surround "
;; cs"' - change surround " -> '
;; cs'<q> or cstq> - change surround ' -> <q>
;; ss' - surround line by '

;;; Code:
(require 'cl-lib)
(require 'evil-surround)

(evil-define-key 'normal evil-surround-mode-map "s" 'evil-surround-edit)
(evil-define-key 'normal evil-surround-mode-map "S" 'evil-Surround-edit)
(evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
(evil-define-key 'visual evil-surround-mode-map "S" 'evil-Surround-region)

(provide 'init-evil-surround)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init-evil-surround.el ends here
