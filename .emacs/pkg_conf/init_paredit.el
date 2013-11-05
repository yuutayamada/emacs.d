;;; init_paredit.el --- init file for paredit.el

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
(require 'paredit)

;; Delete duplicated keybinds form paredit-map
(cl-loop with binds = '("C-j" "C-d" "M-s" "M-;" "C-M-n" "C-M-p" "M-r" "C-k" ";"
                        "M-q")
         for keybind in binds
         do (define-key paredit-mode-map (kbd keybind) nil))

(provide 'init_paredit)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_paredit.el ends here
