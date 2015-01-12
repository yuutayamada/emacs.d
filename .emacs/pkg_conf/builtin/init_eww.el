;;; init_eww.el --- init file for eww.el

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
(when (fboundp 'eww)
  (defadvice eww (around eww-move-to-other-window activate)
    "Move to other window before booting eww."
    (win-switch-to-window 1 5) ; 5 means e of eww
    (delete-other-windows)
    ad-do-it))

(require 'my_autoload)
(require 'cl-lib)
(require 'init_mykie)

(require 'eww)
(require 'shr)
(require 'shr-color)

(setq
 ;; Disable needless luminance
 shr-color-visible-luminance-min 100
 ;; Disable images
 shr-inhibit-images t
 ;; Disable using background color of web site
 shr-inhibit-decoration t)

(defconst eww-search-prefix
  (assoc-default
   :google
   '((:duckduckgo . "https://duckduckgo.com/?q=")
     (:google     . "https://www.google.com/search?q="))))

(mykie:set-keys eww-mode-map
  "n" :default shr-next-link
  "." :default eww-next-url
  "," :default eww-back-url
  "p" :default shr-previous-link
  "e" :default eww
  "s" :default eww
  ;; eww-lnum.el
  "o"
  :default eww-lnum-follow
  :C-u     eww-lnum-universal)

(provide 'init_eww)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_eww.el ends here
