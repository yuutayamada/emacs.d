
;;; Commentary:
;;; Code:
(require 'cl-lib)
(require 'grep-a-lot)
(grep-a-lot-setup-keys)

(defvar my-grep-a-lot-search-word nil)

(defun my/remove-buffer-if-exist (buffer)
  (cl-loop for buf in (buffer-list)
           if (equal buf (get-buffer buffer))
           do (kill-buffer buf)))

(defun grep-a-lot-buffer-name (position)
  "Return name of grep-a-lot buffer at POSITION."
  (let ((grep-buffer (concat "*grep*<" my-grep-a-lot-search-word ">")))
    (my/remove-buffer-if-exist grep-buffer)
    grep-buffer))

(defadvice grep (before my-rgrep (regexp &optional files dir) activate)
  (setq my-grep-a-lot-search-word regexp))

(provide 'init_grep-a-lot)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_grep-a-lot.el ends here
