
;;; Commentary:
;;
;;; Code:
(require 'xterm-cursor-changer)
(require 'Y-autoload)

(advice-add 'evil-set-cursor :before
            (lambda (&rest _r)
              (setq xcc-use-blink
                    (if (eq 'emacs (bound-and-true-p evil-state)) t nil))
              (xcc-change-cursor-color-and-shape-on-evil)))

;;;###autoload
(defun Y-update-modeline (&optional bg-color &rest _r)
  "Update modeline color with BG-COLOR."
  (when (and (null bg-color) (null (bound-and-true-p evil-state)))
    (setq bg-color (car (bound-and-true-p evil-emacs-state-cursor))))
  (when bg-color
    (unless (equal bg-color (face-attribute 'mode-line :background nil))
      (set-face-attribute
       'mode-line nil
       :background bg-color
       :foreground (contrast-color bg-color)))))

;;;###autoload
(defun Y-update-cursor-&-modeline (&rest _r)
  "Update modeline and cursor colors."
  (if (and (bound-and-true-p evil-state)
           (fboundp 'evil-refresh-cursor))
      (evil-refresh-cursor (current-buffer))
    ;; when not evil related buffer
    (xcc-change-cursor-color-and-shape
     (face-attribute 'cursor :background nil) 'box)
    (Y-update-modeline)))

(provide 'init_xterm-cursor-changer)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_xterm-cursor-changer.el ends here
