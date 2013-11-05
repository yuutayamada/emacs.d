;;; -*- coding: utf-8; mode: emacs-lisp; -*-
;; url http://sheephead.homelinux.org/2011/01/18/6559/
(require 'calfw-gcal)

(defun cfw:gcal-format-status (status)
  (let ((desc  ( nth 0 (split-string status " :")))
        (start ( nth 1 (split-string status " :s ")))
        (end   ( nth 2 (split-string status " :e "))))
    (cond
     (end   (concat desc " " cfw:gcal-month "/" cfw:gcal-day " " start "-" end " JST"))
     (start (concat desc " " cfw:gcal-month "/" cfw:gcal-day " " start " JST"))
     (t     (concat desc " " cfw:gcal-month "/" cfw:gcal-day)))))

(provide 'init_calfw-gcal)
