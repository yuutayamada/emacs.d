;;; init_smart-tabs-mode.el --- init file for smart-tabs-mode.el

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

(require 'my_autoload)
(eval-after-load "smart-tabs-mode"
  '(progn
     ;; Load all the following in one pass
     (smart-tabs-insinuate 'c 'javascript 'cperl 'python 'ruby)))

(defun my/set-tab-width-locally (&optional width)
  (interactive)
  (setq-local tab-width
              (string-to-number
               (or width
                   (read-from-minibuffer "How long do you want tab-width: "
                                         (number-to-string standard-indent))))))

(provide 'init_smart-tabs-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_smart-tabs-mode.el ends here
