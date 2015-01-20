;;; init_filecache.el --- init file for filecache.el

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

;; TODO: fix this style
(require 'my_paths)
(defconst my/filecache-directories
  `((:recursive . (,config-dir
                   "~/share/doc/study/"
                   "~/share/doc/cheat_sheets/"
                   ,(expand-file-name (concat user-emacs-directory "../"))
                   ,package-conf-dir))
    (:normal . ("~/" ,elisp-dir))))

(require 'filecache)
(require 'cl-lib)

(setq file-cache-filter-regexps
      (append file-cache-filter-regexps
              ;; 無視したいファイルの正規表現を指定もできる
              '("^\\.#" "\\.cache$")))

(cl-loop for (s . dirs) in my/filecache-directories
         if (eq s :recursive)
         do (mapc (lambda (dir) (file-cache-add-directory-recursively dir))
                  dirs)
         if (eq s :naormal)
         do (file-cache-add-directory-list dirs))

(provide 'init_filecache)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_filecache.el ends here
