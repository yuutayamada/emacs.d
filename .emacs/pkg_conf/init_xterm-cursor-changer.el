;;; Commentary:
;;
;;; Code:
(require 'xterm-cursor-changer)

;; Modeline support
(el-get 'sync 'contrast-color)
(require 'contrast-color)

(advice-add 'evil-set-cursor :before
            (lambda (&rest _r)
              (setq xcc-use-blink
                    (if (eq 'emacs (bound-and-true-p evil-state)) t nil))
              (xcc-change-cursor-color-and-shape-on-evil)))

;;;###autoload
(defun xcc-update-modeline (&optional bg-color &rest _r)
  ""
  (when (and (null bg-color) (null (bound-and-true-p evil-state)))
    (setq bg-color (car (bound-and-true-p evil-emacs-state-cursor))))
  (when bg-color
    (unless (equal bg-color (face-attribute 'mode-line :background nil))
      (set-face-attribute
       'mode-line nil
       :background bg-color
       :foreground (contrast-color bg-color)))))

(add-hook 'find-file-hook 'xcc-update-modeline)
(add-hook 'xcc-before-send-hook 'xcc-update-modeline)
(add-hook 'xcc-nocalled-hook 'xcc-update-modeline)

(advice-add 'other-window-or-split :after
            (lambda (&rest _r) (xcc-update-modeline)))

(provide 'init_xterm-cursor-changer)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_xterm-cursor-changer.el ends here
