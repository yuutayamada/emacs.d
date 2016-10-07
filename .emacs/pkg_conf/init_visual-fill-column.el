
;;; Code:

;;;###autoload
(defun Y/visual-fill-mode (&optional arg)
  "Show filled sentences by visual line mode.
If ARG is non-nil, turn on visual mode stuff."
  (interactive)
  (let ((toggle (or arg (if visual-line-mode 0 1))))
    (visual-line-mode toggle)
    (if visual-line-mode
        (setq word-wrap nil)
      ;; "1" means truncate (don’t word wrap)
      (toggle-truncate-lines 1))
    (visual-fill-column-mode toggle)))

(provide 'init_visual-fill-column)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_visual-fill-column.el ends here
