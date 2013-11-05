;;; init_helm-ag-r.el --- init file for helm-ag-r.el

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

(require 'helm-ag-r)

(setq
 helm-ag-r-input-idle-delay 0.5
 helm-ag-r-option-list `("-S -U --hidden" "-S -U -g")
 helm-ag-r-candidate-limit 1000
 helm-ag-r-requires-pattern 3
 helm-ag-r-use-no-highlight t
 helm-ag-r-google-contacts-lang "ja_JP.UTF-8")

;; ag options
;; --ackmate
;; -a : search all files. But doesn't include hidden files and any
;;      ignore files.
;; -A : display after char
;; -B : display before char
;; -U : ignore VCS ignore file
;; -g : file search
;; -G : only search filenames matching PATTERN
;; -C : context(-A + -B option)
;; -S : smart-case
;; -u : search all file, this option ignore .agignore, .gitignore
;; -s : case sensitive
;; -Q : do not use regexp
;; -t : all text
;; -f : follow symlink
;; -l : --files-with-matches
;; --[no]break: print a newline between in different files.(default)
;; --[no]color: print color codes
;; --column: print column number
;; --search-binary
;; --[no]heading
;; --hidden: search hidden files. This option obey ignore files.
;; --ignore PATTERN:
;;   Ignore files/directories matching this pattern.
;; --ignore-dir NAME:
;;   Alias for --ignore for compatibility with ack.
;; -i --ignore-case:
;;   Match case insensitively
;; -l --files-with-matches:
;;   Only print filenames
;; -L --files-witout-matches:
;;   Only print filenames
;; --no-numbers
;;   Don't show line numbers
;; -p --path-to-agignore STRING:
;;   Provide a path to a specific .agignore file.
;; --pager COMMAND:
;;   Use a pager such as less. Use --nopager to override. This option
;;   is also ignored if output is piped to anoter program.
;; --print-long-lines:
;; -v --invert-match
;; -w --word-regexp:
;;   Only match whole words.

(provide 'init_helm-ag-r)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_helm-ag-r.el ends here
