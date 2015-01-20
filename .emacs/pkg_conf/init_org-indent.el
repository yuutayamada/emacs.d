;;; init_org-indent.el --- init file for org-indent

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

(require 'org-indent)
(unless (display-graphic-p)
  ;; if current Emacs is in Terminal.
  ;; then use "|" to end of indent.(124) ;1474
  ;; 32 is just space
  (setq org-indent-boundary-char 32) ; 1474
  )

;; org-indent-mode-turns-off-org-adapt-indentation nil
(setq org-startup-indented t)

;; (org-indent-initialize)

(provide 'init_org-indent)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_org-indent.el ends here
