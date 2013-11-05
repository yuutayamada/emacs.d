;;; init_masaw.el --- init file for masaw

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
(unless (require 'masaw nil t)
  (load (concat (getenv "GOPATH")
                "/src/github.com/yuutayamada/masaw/misc/emacs/masaw")))

(add-hook 'masaw-after-gofmt-before-save-hook 'masaw)

(provide 'init_masaw)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_masaw.el ends here
