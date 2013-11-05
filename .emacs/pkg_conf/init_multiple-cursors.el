;;; init_multiple-cursors.el --- init file for multiple-cursors.el

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

;; Add this require to avoid warning
;; The smartrep package must load before loading powerline
(defconst mc/list-file (format "%s.mc-list-file" user-emacs-directory))
(ignore-errors (require 'multiple-cursors nil t))
(load mc/list-file)

(defun my/load-mc-init-file()
  (interactive)
  (let ((main-key "C-M-j"))
    (global-unset-key (kbd main-key))
    (smartrep-define-key
        global-map main-key
      `((,main-key . 'mc/mark-next-like-this)
        ("a"       . 'mc/mark-all-like-this)
        ("q"       . 'smartrep-quit)
        ("n"       . 'mc/skip-to-next-like-this)
        ("p"       . 'mc/skip-to-previous-like-this)
        ("j"       . 'mc/mark-next-like-this)
        ("k"       . 'mc/mark-previous-like-this)
        ("m"       . 'mc/mark-more-like-this-extended)
        ("u"       . 'mc/unmark-next-like-this)
        ("U"       . 'mc/unmark-previous-like-this)
        ("*"       . 'mc/mark-all-like-this)
        ("d"       . 'mc/mark-all-like-this-dwim)
        ("i"       . 'mc/insert-numbers)
        ("o"       . 'mc/sort-regions)
        ("O"       . 'mc/reverse-regions)))))

(add-hook 'kill-emacs-hook 'mc/save-lists)

(provide 'init_multiple-cursors)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_multiple-cursors.el ends here
