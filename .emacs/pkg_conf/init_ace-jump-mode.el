;;; init_ace-jump-mode.el --- init file for ace-jump-mode

;;; Commentary:

;;; Code:

(defconst ace-jump-word-mode-use-query-char nil)
(require 'ace-jump-mode)
(setq ace-jump-mode-move-keys
      (append "asdfghjkl;qrtuieyopzxcvbnm,." nil))

(provide 'init_ace-jump-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ace-jump-mode.el ends here
