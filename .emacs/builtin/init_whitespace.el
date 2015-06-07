;;; init_whitespace.el --- init file for whitespace.el
;;; Commentary:
;;; Code:

(require 'whitespace)

(defconst whitespace-space-regexp "\\(\u3000+\\)")
(defconst whitespace-line-column 80)

;; automatically clean up bad whitespace
(defconst whitespace-action '(auto-cleanup))
(defadvice whitespace-cleanup (around Y/prevent-cleanup activate)
  "Prevent auto-cleanup."
  (when (and
         ;; not my repository.
         (or (not (locate-dominating-file ".git" buffer-file-name))
             (string-match "/yuutayamada/" buffer-file-name))
         ;; on markdown mode(for two spaces)
         (not (eq major-mode 'markdown-mode)))
    ad-do-it))

(defconst whitespace-style
  '(face ; use face
    trailing ; show EOL's space
    ;; show if it's greater than whitespace-line-column
    lines-tail
    space-before-tab ; show space before tab
    space-after-tab  ; show space after tab
    tabs spaces tab-mark space-mark
    ;; Comment out below styles because those were too bright for me...
    ;; indentation empty
    ))

;; see whitespace.el for more details
(defconst whitespace-display-mappings
  '((space-mark ?\u3000 [?\u25a1])
    ;; WARNING: the mapping below has a problem.
    ;; When a TAB occupies exactly one column, it will display the
    ;; character ?\xBB at that column followed by a TAB which goes to
    ;; the next TAB column.
    ;; If this is a problem for you, please, comment the line below.
    (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))

(provide 'init_whitespace)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_whitespace.el ends here
