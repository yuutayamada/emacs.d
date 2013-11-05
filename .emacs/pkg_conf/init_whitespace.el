;;; init_whitespace.el --- init file for whitespace.el

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

(require 'whitespace)

(defun my/whitespace-mode ()
  "Avoid `whitespace-mode' if `truncate-lines' was nil."
  ;; automatically clean up bad whitespace
  (setq-local whitespace-action '(auto-cleanup))
  ;; only show bad whitespace
  (setq-local whitespace-style
              '(face ; use face
                trailing ; show EOL's space
                ;; show if it's greater than whitespace-line-column
                lines-tail
                space-before-tab ; show space before tab
                space-after-tab  ; show space after tab
                tabs spaces tab-mark space-mark
                ;; indentation empty
                ))
  (if truncate-lines
      (whitespace-mode t)
    (whitespace-mode 0)))

(defun my/set-truncate-notification-locally (num)
  (setq-local fill-column num)
  (setq-local whitespace-line-column num)
  (my/whitespace-mode))

(defadvice toggle-truncate-lines
  (around avoid-whitespace-mode activate)
  "Turn off `whitespace-mode' if `truncate-lines' is nil."
  ad-do-it
  (my/whitespace-mode))

;; see whitespace.el for more details
(defconst whitespace-display-mappings
  '((space-mark ?\u3000 [?\u25a1])
    ;; WARNING: the mapping below has a problem.
    ;; When a TAB occupies exactly one column, it will display the
    ;; character ?\xBB at that column followed by a TAB which goes to
    ;; the next TAB column.
    ;; If this is a problem for you, please, comment the line below.
    (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))

(set-face-bold-p 'whitespace-space t)

(defconst whitespace-space-regexp "\\(\u3000+\\)")
(defconst whitespace-line-column 80)

(provide 'init_whitespace)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_whitespace.el ends here
