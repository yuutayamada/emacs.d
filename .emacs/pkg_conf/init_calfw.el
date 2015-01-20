;;; init_calfw.el --- init file for calfw.el

;; Copyright (C) 2013 by Yuta Yamada

;; Author: Yuta Yamada <cokesboy"at"gmail.com>

;;; License:
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;; Commentary:

;;; Code:
(require 'init_howm)

(require 'calfw)
(add-hook 'calendar-load-hook
          (lambda ()
            (require 'japanese-holidays)
            (setq calendar-holidays
                  (append
                   ;; you need japanese-holidays.el
                   ;; japanese-holidays
                   holiday-local-holidays holiday-other-holidays))))

(require 'calfw-howm)
(cfw:install-howm-schedules)

(require 'calfw-org)
(require 'calfw-ical)
(defvar my/gcalender-authfile-host-name "gcalender")
(defvar my/calendar-sources
  (list
   ;; (cfw:org-create-source "Seagreen4")
   (with-no-warnings
     (cfw:ical-create-source
      "google"
      (nth 3 (car (auth-source-search :host my/gcalender-authfile-host-name :type 'netrc)))
      "Pink"))
   (cfw:howm-create-source "medium sea green")
   ;; You can add another one
   ;; (cfw:ical-create-source "another schedule"
   ;; "https://www.google.com/calendar/ical/../basic.ics" "#2952a3")
   ))

;; see howm-menu-allow
(defun cfw:howm-schedule-inline (&optional width height view)
  "Inline function for the howm menu. See the comment text on the top of this file for the usage."
  (let ((custom-map (copy-keymap cfw:howm-schedule-inline-keymap)) cp)
    (set-keymap-parent custom-map cfw:calendar-mode-map)
    (setq cp (cfw:create-calendar-component-region
              :width width :height (or height 10)
              :keymap custom-map
              :contents-sources
              (append my/calendar-sources
                        cfw:howm-schedule-contents)
              :annotation-sources cfw:howm-annotation-contents
              :view (or view 'month))))
  "")

(defun my/open-calendar ()
  "Open calendar with clafw."
  (interactive)
  (cfw:open-calendar-buffer
   :view 'month
   :contents-sources my/calendar-sources))

(set-face-attribute 'cfw:face-toolbar-button-on nil
                    :background "black"
                    :foreground "white")
(set-face-attribute 'cfw:face-toolbar-button-off nil
                    :background "black"
                    :foreground "grey70")
(set-face-attribute 'cfw:face-toolbar nil
                    :background "black")

(require 'init_calfw-gcal)

(define-key cfw:calendar-mode-map (kbd "a") 'cfw:gcal-main)
(with-no-warnings
  (defun cfw:gcal-delete ()
    (interactive)
    (let ((date (concat cfw:gcal-year "-" cfw:gcal-month "-" cfw:gcal-day))
          (status (cfw:gcal-edit-extract-status)))
      (start-process "cfw:gcal-send" nil "google" "calendar" "delete" status "--date" date "--yes")
      (cfw:gcal-quit))))

(provide 'init_calfw)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_calfw.el ends here
