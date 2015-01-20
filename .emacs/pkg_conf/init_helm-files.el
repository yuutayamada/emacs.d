;;; init_helm-files.el --- init file for helm-files.el

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

(require 'helm-files)

(defadvice helm-for-files (around helm-for-files-no-highlight activate)
  "No highlight when using helm-for-files."
  (let ((helm-mp-highlight-delay nil))
    ad-do-it))

;; (require 'init_filecache)
;; (require 'helm-ghq)
(setq helm-for-files-preferred-list
      '(helm-source-file-cache
        ;; helm-source-ghq
        ;; helm-source-recentf
        ;; helm-source-buffers-list
        ;; helm-source-files-in-current-dir
        ;; comment out this is too heavy for me.
        ;; helm-source-bookmarks
        ;; helm-source-locate
        ))

(provide 'init_helm-files)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_helm-files.el ends here
