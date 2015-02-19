;;; init_wgrep.el --- init file for wgrep.el
;;; Commentary:
;; ↓ copied from README of wgrep.el
;; Usage:
;; You can edit the text in the grep buffer after typing C-c C-p. After that the changed text is highlighted. The following keybindings are defined:
;;     C-c C-e: Apply the changes to file buffers.
;;     C-c C-u: All changes are unmarked and ignored.
;;     C-c C-d: Mark as delete to current line (including newline).
;;     C-c C-r: Remove the changes in the region (these changes are not applied to the files. Of course, the remaining changes can still be applied to the files.)
;;     C-c C-p: Toggle read-only area.
;;     C-c C-k: Discard all changes and exit.
;;     C-x C-q: Exit wgrep mode.
;; To save all buffers that wgrep has changed, run
;; M-x wgrep-save-all-buffers
;;; Code:

(require 'wgrep)
;; To save buffer automatically when `wgrep-finish-edit'.
(setq wgrep-auto-save-buffer t)
;; You can change the default key binding to switch to wgrep.
(setq wgrep-enable-key "r")
;; To apply all changes whether or not buffer is read-only.
(setq wgrep-change-readonly-file t)

(provide 'init_wgrep)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_wgrep.el ends here
