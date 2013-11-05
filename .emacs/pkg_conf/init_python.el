;;; init_python-mode.el --- init file for python mode

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

(require 'python)
(setq python-indent-offset 2)

(defadvice python-shell-send-buffer
  (around ad-python-popwin activate)
  (popwin:popup-buffer
   (get-buffer-create "*Python*")
   :stick t :width (/ (frame-width) 2) :position :right)
  ad-do-it)

(provide 'init_python)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_python.el ends here
