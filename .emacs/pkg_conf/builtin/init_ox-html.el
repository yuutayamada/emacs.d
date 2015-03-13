

;;; Commentary:
;;; Code:

;; CSS format for export html
(require 'ox-html) ; for org-html-head
(let ((style-file (file-truename "~/.org-style.css")))
  (when (file-exists-p style-file)
    (setq org-html-head
          (concat "<link rel=\"stylesheet\" href=\"" style-file "\" />"))))


(provide 'init_ox-html)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ox-html.el ends here
