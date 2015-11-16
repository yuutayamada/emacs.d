;;; init_ocodo-svg-modelines.el --- init file for ocodo-svg-modelines -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'cl-lib)
(advice-add 'ocodo-mesh-aqua-buffer-name-style :override
            '(lambda (&rest args)
               (list :font-weight (if (smt/window-active-p) "bold" "normal")
                     :font-style  (when (and (file-exists-p (buffer-file-name))
                                             (not buffer-read-only))
                                    "italic")
                     :font-size "12pt" ;; Change font size to whatever you'd like.
                     :font-family "sans-serif"
                     :fill (if (smt/window-active-p)
                               (cl-case evil-state
                                 (normal  "red")
                                 (emacs   "violet")
                                 (insert  "yellow")
                                 (visual  "#1e90ff")
                                 (replace "#00ff7f")
                                 (t       "lightgreen"))
                             "green"))))

(provide 'init_ocodo-svg-modelines)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ocodo-svg-modelines.el ends here
