;;; init_package.el --- init file for package.el

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

(require 'vars)
(require 'cl-lib)
(require 'package)

(cl-loop with repositoryies = '(("melpa" . "http://melpa.org/packages/")
                                ;; ("marmalade" .
                                ;;  "http://marmalade-repo.org/packages/")
                                )
         for repository in repositoryies do
         (add-to-list 'package-archives repository))

;; load installed package that is pass to the load-path
(package-initialize)

(provide 'init_package)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_package.el ends here
