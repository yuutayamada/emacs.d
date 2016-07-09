;;; Commentary:
;;
;;; Code:
(require 'xterm-cursor-changer)

(advice-add 'evil-set-cursor :before
            (lambda (&rest _r)
              (setq xcc-use-blink
                    (if (eq 'emacs (bound-and-true-p evil-state)) t nil))
              (xcc-change-cursor-color-and-shape-on-evil)))

(add-hook 'xcc-before-send-hook 'xcc-update-modeline)
(add-hook 'xcc-nocalled-hook 'xcc-update-modeline)

(provide 'init_xterm-cursor-changer)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_xterm-cursor-changer.el ends here
