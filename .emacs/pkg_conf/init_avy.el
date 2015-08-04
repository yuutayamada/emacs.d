;;; init_avy.el --- init file for avy.el

;;; Commentary:

;;; Code:
(require 'avy)
(require 'cl-lib)

(defconst avy-keys
  (cl-loop with default = (list ?a ?s ?d ?f ?g ?h ?j ?k ?l ?\;)
           for c from ?a to ?z
           if (and (not (member c default))
                   (not (member c '(?z ?q ?p ?x ?b))))
           collect c into keys
           finally return (append default keys)))

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
