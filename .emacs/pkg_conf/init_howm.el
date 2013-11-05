;;; init_howm.el --- init file for howm.el

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

;; To add cfw:calender past below function at edit buffer
;; %here%(cfw:howm-schedule-inline)

(require 'howm)
(require 'init_org)
(require 'my_autoload)

(add-hook 'howm-create-file-hook
          '(lambda ()
             (save-excursion
               (goto-char (point-min))
               (insert "# -*- coding: utf-8; mode: org; -*-")
               (unless (equal 'org-mode major-mode)
                 (org-mode)))))

(defun my/restriction ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (when (looking-at ".+ -\\*- coding: utf-8; mode: org; -\\*-")
      (line-move 1)
      (narrow-to-region (point-at-bol) (point-max)))))

(defun my/init-howm ()
  (win-switch-to-window 1 8)
  (delete-other-windows))

(defadvice howm-menu
  (around ad-switch-to-h-window activate)
  (my/init-howm)
  ad-do-it)

(add-hook 'howm-view-open-hook
          '(lambda ()
             (my/restriction)
             (org-mode)
             (howm-mode)))

(provide 'init_howm)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_howm.el ends here
