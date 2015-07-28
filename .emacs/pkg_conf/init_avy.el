;;; init_avy.el ---

;;; Commentary:

;;; Code:
(require 'avy)

;;;###autoload
(defun avy-goto-char-by-input-event ()
  (interactive)
  (avy-goto-char last-input-event))

(provide 'init_avy)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_avy.el ends here
