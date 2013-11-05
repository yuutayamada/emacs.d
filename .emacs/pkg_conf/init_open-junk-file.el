;;; -*- coding: utf-8; mode: emacs-lisp; -*-
(require 'open-junk-file)

(setq open-junk-file-format
      ;; %Y-%m-%d-%H%M%S -> %Y-%m-%d
      (concat (getenv "XDG_CACHE_HOME")
              "/open-junk/%Y-%m-%d-%H%M%S."))

(defun my/open-junk-today ()
  (interactive)
  "Open junk file and use fixed format version."
  (require 'init_open-junk-file)
  (let ((open-junk-file-format
         (concat (getenv "XDG_CACHE_HOME")
                 "/open-junk/%Y-%m-%d.org")))
    (open-junk-file)))

(provide 'init_open-junk-file)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_open-junk-file.el ends here
