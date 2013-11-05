;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(setq-default mode-line-format
              '((line-number-mode "L%l/")
                (column-number-mode "C%c-")
                (:eval (if (fboundp 'gnus-mst-notify-modeline-form)
                           (gnus-mst-notify-modeline-form)))
                mode-line-buffer-identification
                display-time-string
                mode-line-mule-info
                mode-line-modified
                " %[("
                mode-name
                (which-func-mode ("" which-func-format "-"))
                mode-line-process
                minor-mode-alist
                "%n" ")%]-"
                (-3 . "%p")
                "-%-"))

(provide 'my_modeline)
