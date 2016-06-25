;;; init_festival.el --- init file for festival.el

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

(require 'cl-lib)
(require 'Y-autoload)
(require 'festival)
(require 'mykie)

(defvar my/festival-ignore-list
  '(("[^0-9a-zA-Z\.#\+'=\-]" . " ")
    ("###"                   . " ")
    ("\+\+\+"                . " ")
    ("==="                   . " ")))

(defun my/festival-trim (text)
  ""
  (cl-loop with result = text
           with replace = (lambda (from to str)
                            (replace-regexp-in-string from to str))
           for (from . to) in my/festival-ignore-list
           do (setq result (funcall replace from to result))
           finally return result))

(defun my/festival (&optional txt)
  "Read by festival from TXT or user input.
If user was selected region then path region's words to festival."
  (interactive)
  (if (festivalp)
      (mykie
       :default (festival-say
                 (my/festival-trim
                  (or txt (read-string "say: " (word-at-point)))))
       :region (festival-say (my/festival-trim mykie:region-str)))
    (festival-start)))

(defun my/festival-read-buffer ()
  "Read from buffer's strings by using festival."
  (interactive)
  (mykie
   :default (my/festival (buffer-string))
   :C-u     (progn ; reset
              (festival-stop)
              (sleep-for 3)
              (my/go-festival (my/festival-trim (buffer-string))))))

(defun my/festival-sh ()
  "Read from sh's result."
  (interactive)
  (my/festival (shell-command-to-string (read-string "festival-sh: "))))

(provide 'init_festival)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_festival.el ends here
