;;; init_quickrun.el --- init file for quickrun.el

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
(require 'quickrun)

(defun my/quickrun-dwim (&optional direction)
  "Do quickrun.
You can specify 'ask and 'compile-only as symbol to DIRECTION."
  (interactive)
  (let ((cmdkey (gethash (quickrun/find-from-major-mode-alist)
                         quickrun/command-key-table))
        (adjust-key (lambda (cmdkey)
                      (cl-case (intern cmdkey)
                        (lisp "lisp/clisp")
                        (t cmdkey))))
        (q-run (lambda (cmdkey &optional direction)
                 (let ((current-prefix-arg
                        (cl-case direction
                          (ask '(4))
                          (compile-only '(16))
                          (t nil)))
                       (quickrun-option-cmdkey cmdkey))
                   (call-interactively 'quickrun)))))
    (funcall q-run (funcall adjust-key cmdkey) direction)))

;; override Java
(quickrun-add-command
 "java"
 '((:compile-only . "javac -encoding utf-8 -source 1.7 -target 1.7 -Werror %o %s")
   (:exec         . ("javac -encoding utf-8 -source 1.7 -target 1.7 %o %s" "%c %N %a")))
 :override t)

;; (quickrun-add-command
;;  "clojure"
;;  '((:command . "clojure")
;;    (:exec         . ("javac -source 1.6 -target 1.6 %o %s" "%c %N %a"))
;;    (:compile-only . "javac -source 1.6 -target 1.6 -Werror %o %s")))

(provide 'init_quickrun)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_quickrun.el ends here
