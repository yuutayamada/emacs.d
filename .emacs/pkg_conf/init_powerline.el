;;; init_powerline.el --- init file for powerline.el

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

(require 'cl-lib)
(require 'powerline)

(with-no-warnings
  (setq powerline-arrow-shape 'allow14)) ; You can set arrow curve arrow14

(cl-defun my/change-powerline-color (&key left-bg middle-bg right-bg box
                                          left-fg middle-fg right-fg)
  (let* ((default '("#0b5fb5" "#1a1eb2" "#000080"))
         (l-bg     (or left-bg  (nth 0 default)))
         (l-fg     (or left-fg  "white"))
         (m-bg     (or middle-bg (nth 1 default)))
         (m-fg     (or middle-fg "white"))
         (r-bg     (or right-bg (nth 2 default)))
         (r-fg     (or right-fg "white"))
         (inactive-fg "white")
         (inactive-bg "grey20"))
    (custom-set-faces
     `(mode-line
       ((nil (:foreground ,l-fg :background ,l-bg :box ,box))))
     `(powerline-active1
       ((t   (:foreground ,m-fg :background ,m-bg :box ,box))))
     `(powerline-active2
       ((t   (:foreground ,r-fg :background ,r-bg :box ,box))))
     `(mode-line-inactive
       ((t   (:foreground ,inactive-fg :background ,inactive-bg :box nil))))
     `(powerline-inactive1
       ((t   (:foreground ,inactive-fg :background ,inactive-bg :box nil))))
     `(powerline-inactive2
       ((t   (:foreground ,inactive-fg :background ,inactive-bg :box nil)))))))

;; Todo: improve box's color
;; (my/change-powerline-color
;;  :left-bg "#ff0d00" :middle-bg "#009999" :right-bg "#92ec00")

(provide 'init_powerline)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_powerline.el ends here
