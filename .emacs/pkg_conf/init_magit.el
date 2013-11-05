;;; init_magit.el --- init file for magit.el

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
(require 'magit)
(require 'mykie)

(defconst my/magit-use-commit-mode t
  "If non-nil fix window structure of new magit.")
(defconst magit-diff-refine-hunk 'all)

(defadvice magit-status (around ad-cd-current-dir activate)
  "Do init function before/after do magit-status."
  (cd default-directory)
  ;; switch to other window by windows.el (7 = g[it])
  (win-switch-to-window 1 7)
  ad-do-it
  (delete-other-windows))

(defun my/magit-status ()
  "Do init function before magit-status."
  (interactive)
  (mykie
   :C-u     magit-status
   :default (progn (magit-status "./")
                   (magit-show-level-4-all))))

(defadvice magit-push
  (around ad-ssh-add-if-it-was-needed activate)
  "Do ssh-add if it was needed."
  (my/ssh-add)
  ad-do-it)

(if (not my/magit-use-commit-mode)
    ;; For old version's Magit
    (with-no-warnings
      (progn
        (defadvice magit-log-edit-mode
          (around ad-set-truncating-line-number activate)
          ad-do-it
          (my/set-truncate-notification-locally 72))))
  ;; For new version's Magit
  (defadvice magit-commit
    (around advice-name activate)
    (save-current-buffer
      ad-do-it))
  (require 'init_git-commit-mode))

(provide 'init_magit)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_magit.el ends here
