;;; init_grep.el --- init file for grep

;; Copyright (C) 2014 by Yuta Yamada

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

(require 'grep)
(require 'thingatpt)

;;; For ag command
(add-to-list 'grep-mode-font-lock-keywords
             '("^[~/].*\n"
               (0 compilation-info-face nil t)))
(add-to-list 'grep-mode-font-lock-keywords
             '("^\\([0-9]*\\):\\(.*\\)\n"
               (1 compilation-warning-face)))

;; Use ag if the command was exist, otherwise use grep
(defconst grep-command-before-query
  (cond
   ((zerop (shell-command "which pt"))
    "pt --nogroup --nocolor -U -S -e ")
   ((zerop (shell-command "which ag"))
    "ag --nogroup -a -S ")
   ;; Recursive grep by -r
   (t "grep -nH -r -e ")))

(defun grep-default-command ()
  (let*
      ((grep-read-from-point
        (let ((grep-command-before-target
               (concat grep-command-before-query
                       (shell-quote-argument (grep-tag-default)))))
          (cons (if buffer-file-name
                    (concat grep-command-before-target
                            " *."
                            (file-name-extension buffer-file-name))
                  (concat grep-command-before-target " ."))
                (1+ (length grep-command-before-target))))))
    grep-read-from-point))

(setq grep-command (cons (concat grep-command-before-query "\"\" .")
                         (+ (length grep-command-before-query) 2)))

(require 'init_grep-a-lot)

(let ((no-byte-compile t)) ; Ignore warnings
  (require 'init_grep-edit))

;; Use keymap of global-map to vacancy keys of grep-mode-map to edit text
(unless (eq (lookup-key grep-mode-map "a")
            (lookup-key global-map    "a"))
  (setq grep-mode-map
        (make-composed-keymap '(grep-mode-map) global-map)))

(provide 'init_grep)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_grep.el ends here
