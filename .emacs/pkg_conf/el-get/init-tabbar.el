;;; init-tabbar.el --- init file for tabbar.el

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

;;;* tabbar
(require 'tabbar)
(tabbar-mode t)

(setq tabbar-separator-value nil)
(setq tabbar-separator (list 1)) ; this doesn't allow float number in nox

(provide 'init-tabbar)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init-tabbar.el ends here
