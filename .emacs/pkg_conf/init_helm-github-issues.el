;;; init_helm-github-issues.el --- init file for helm-github-issues.el

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
(require 'helm-github-issues)
(require 'cl-lib)

(setq helm-github-issues-bookmarks
      (cl-loop with paths = (split-string
                             (shell-command-to-string "ghq list --full-path") "\n")
               for path in paths
               if (string-match ".*github\\.com/\\(.*\\)" path)
               collect (match-string 1 path)))

(provide 'init_helm-github-issues)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_helm-github-issues.el ends here
