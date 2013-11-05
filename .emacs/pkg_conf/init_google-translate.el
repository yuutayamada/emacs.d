;;; init_google-translate.el --- init file for google-translate.el

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
(require 'google-translate)
(require 'thingatpt)

(defun my/google-translate (text)
  ""
  (let* ((pair '("en" "ja"))
         (ja-or-en
          (lambda (txt)
            (if (string-match "[a-zA-Z]" txt)
                (nth 0 pair)
              (nth 1 pair))))
         (source (funcall ja-or-en text))
         (target (if (equal source (nth 0 pair))
                     (nth 1 pair)
                   (nth 0 pair))))
    (google-translate-translate source target text)))

(provide 'init_google-translate)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_google-translate.el ends here
