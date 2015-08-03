;;; init_avy.el ---

;;; Commentary:

;;; Code:
(require 'avy)

;;;###autoload
(defun avy-goto-char-by-input-event ()
  "Goto char with avy and move to ‘last-input-event’s char."
  (interactive)
  (if (characterp last-input-event)
      (avy-goto-char last-input-event) ; using xterm-keybinder
    ;; For GUI Emacs
    (let ((keyseq (string-to-list (key-description (vector last-input-event)))))
      (avy-goto-char (car (last keyseq))))))

(provide 'init_avy)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_avy.el ends here
