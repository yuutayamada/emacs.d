;;; init_skk-b.el --- init file for skk-b.el

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
(require 'skk-b)

(defadvice skk-b-change-candidate-next
  (around ad-turn-on-laten-mode activate)
  (when ad-do-it
    (unless skk-latin-mode
      (skk-latin-mode-on))))

(defadvice skk-b-change-candidate-previous
  (around ad-turn-on-laten-mode activate)
  (when ad-do-it
    (unless skk-latin-mode
      (skk-latin-mode-on))))

(provide 'init_skk-b)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_skk-b.el ends here
