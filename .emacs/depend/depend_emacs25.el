;;; depend_emacs25.el --- init file for Emacs 25
;;; Commentary:
;; ** A new text property `inhibit-read-only' can be used in read-only
;; ** A new function `file-tree-walk' allows to apply a certain action
;; ** A new function `directory-files-recursively' returns all matching
;; ** If `quick-calc' is called with a prefix argument, insert the
;;    result of the calculation into the current buffer.

;; ** pcase
;; *** New UPatterns `quote' and `app'.
;; *** New UPatterns can be defined with `pcase-defmacro'.
;; *** New vector QPattern.

;; ** Rectangle editing
;; *** Rectangle Mark mode can have corners past EOL or in the middle of a TAB.
;; *** C-x C-x in rectangle-mark-mode now cycles through the four corners.
;; *** `string-rectangle' provides on-the-fly preview of the result.

;; ** Lisp mode
;; *** Strings after `:documentation' are highlighted as docstrings.
;; ** cl-lib
;; *** New functions cl-fresh-line, cl-digit-char-p and cl-parse-integer.

;; ** Emacs can now draw horizontal scroll bars on some platforms that
;; provide toolkit scroll bars, namely Gtk+, Lucid, Motif and Windows.
;; Horizontal scroll bars are turned off by default.
;; *** New function `horizontal-scroll-bars-available-p' telling whether
;;     horizontal scroll bars are available on the underlying system.
;; *** New mode `horizontal-scroll-bar-mode' to toggle horizontal scroll
;;     bars on all existing and future frames.
;; *** New function `toggle-horizontal-scroll-bar' to toggle horizontal
;;     scroll bars on the selected frame.
;; *** New frame parameters `horizontal-scroll-bars' and
;;     `scroll-bar-height' to set horizontal scroll bars and their height
;;     for individual frames and in `default-frame-alist'.
;; *** New functions `frame-scroll-bar-height' and
;;     `window-scroll-bar-height' return the height of horizontal scroll
;;     bars on a specific frame or window.
;; *** `set-window-scroll-bars' now accepts five parameters where the last
;;     two specify height and type of the window's horizontal scroll bar.
;; *** `window-scroll-bars' now returns type and sizes of horizontal scroll
;;     bars too.
;; *** New buffer-local variables `horizontal-scroll-bar' and
;;     `scroll-bar-height'.
;; ** The new functions `string-collate-lessp' and `string-collate-equalp'
;; preserve the collation order as defined by the system's locale(1)
;; environment.  For the time being this is implemented for modern POSIX
;; systems and for MS-Windows, for other systems they fall back to their
;; counterparts `string-lessp' and `string-equal'.
;; ** New variable `system-configuration-features', listing some of the
;; main features that Emacs was compiled with.  This is mainly intended
;; for use in Emacs bug reports.

;;; Code:
;; ** New var `truncate-string-ellipsis' to choose how to indicate truncation.
(with-no-warnings
  (setq truncate-string-ellipsis (propertize "⁇" 'face 'font-lock-warning-face)))

(require 'depend_emacs24)

(provide 'depend_emacs25)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; depend_emacs25.el ends here
