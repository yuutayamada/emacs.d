;;;*bm カーソル位置に目に見える印をつける
(require 'bm)

(setq-default bm-buffer-persistence t);; ue?
(setq bm-restore-repository-on-load t);; ..
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)

(provide 'init_bm)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_bm.el ends here
