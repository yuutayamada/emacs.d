

;;; Code:
(require 'calendar)

;;;###autoload
(defun Y/insert-day ()
  ""
  (interactive)
  (let ((day nil)
        (calendar-date-display-form
         '("[" year "-" (format "%02d" (string-to-int month))
           "-" (format "%02d" (string-to-int day)) "]")))
    (setq day (calendar-date-string
               (calendar-cursor-to-date t)))
    (calendar-exit)
    (insert day)))

(provide 'init_calendar)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_calendar.el ends here
