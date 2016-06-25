;;; init-auto-capitalize.el --- init file for auto-capitalize.el
;;; Commentary:
;;; Code:

(setq auto-capitalize-words
      `("I" "English" "Japan" "ASAP" "Linux" "Japanese" "ASCII" "CPU"
        "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday"
        "Mon" "Tue" "Wed" "Thu" "Fri" ; "Sat" "Sun"
        "January" "February" ; "March"
        "April" ; "May"
        "June" "July" "August" "September" "October" "November" "December"
        "Jan" "Feb" "Mar" "Apr" "Aug" "Sept" "Oct" "Nov" "Dec"
        "Halloween"
        "README" "Makefile" "Rakefile" "Dockerfile"))

(defconst auto-capitalize-aspell-file
  (format "%s/aspell/.aspell.en.pws" (getenv "XDG_CONFIG_HOME")))

(auto-capitalize-setup)

(provide 'init-auto-capitalize)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init-auto-capitalize.el ends here
