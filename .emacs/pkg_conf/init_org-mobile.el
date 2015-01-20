;;; init_org-mobile.el --- init file for org-mobile.el

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
;; org-directory

(defconst org-mobile-directory "~/Dropbox/MobileOrg")
(defconst org-mobile-index-file "index.org")
(defconst org-mobile-capture-file "mobileorg.org")
(defconst org-mobile-inbox-for-pull
  (format "%s/from-mobile.org" org-mobile-directory))
(defconst org-mobile-files '("~/mobileOrg/"))

(require 'org-mobile)

(defun org-mobile-dir-p ()
  "Return non-nil if `default-directory' is related org-mobile directory."
  (string-match
   (format "^%s" (expand-file-name org-mobile-directory))
   (expand-file-name default-directory)))

(provide 'init_org-mobile)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_org-mobile.el ends here
