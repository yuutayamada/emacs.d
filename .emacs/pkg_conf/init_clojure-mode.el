;;; init_clojure-mode.el --- init file for clojure-mode.el

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

;; clojure-mode and clojure-cheet-sheet

;;; Code:
(require 'clojure-mode)
(require 'Y-autoload)

(add-hook 'clojure-mode-hook
          (lambda ()
            (cider-mode t)
            (cider-turn-on-eldoc-mode)))

(setq clojure-use-backtracking-indent nil)

(provide 'init_clojure-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_clojure-mode.el ends here
