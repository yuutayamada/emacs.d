;;; init_iso-transl.el --- init file for iso-transl.el

;;; Commentary:

;;; Code:
(require 'iso-transl)
;; unbind A-m key because I'm using this key at global map.
;; (and there are four keybinds of µ)
(define-key key-translation-map (kbd "A-m") nil)

(easy-mmode-define-minor-mode
 Y/iso-transl-minor-mode "Yuta's transl minor-mode"
 :init-value nil :lighter nil :keymap iso-transl-ctl-x-8-map)

(defun Y/iso-transl-toggle-minor-mode ()
  "Toggle `iso-transl-ctl-x-8-map' keybinds."
  (interactive)
  (if Y/iso-transl-minor-mode
      (Y/iso-transl-minor-mode 0)
    (Y/iso-transl-minor-mode t)))

(provide 'init_iso-transl)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_iso-transl.el ends here
