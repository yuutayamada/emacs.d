

(add-hook 'pdf-view-after-change-page-hook 'beginning-of-buffer)
;; (advice-add 'pdf-view-goto-page :after (lambda (&rest _r) (beginning-of-buffer)))

(defconst Y/nim-in-action-slice
  ;; x y w h
  '(0.08169934640522876 0.04924242424242425 0.8447712418300654 0.8876262626262627))

(define-key pdf-view-mode-map (kbd "C-0")
  '(lambda ()
     (interactive)
     (apply 'pdf-view-set-slice (append Y/nim-in-action-slice nil))))

;; (setq Y/nim-in-action-slice (pdf-view-current-slice nil))


