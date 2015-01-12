;;; init_git-commit-mode.el --- init file for git-commit-mode.el

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

(require 'my_function)
(require 'git-commit-mode)

(defvar my/magit-status-buffer nil "Current magit status buffer.")
(defvar my/magit-status-buffer-local nil "Current magit status buffer.")

(defadvice git-commit-mode
  (around ad-set-buffer activate)
  "Set buffer."
  ad-do-it
  (setq-local my/magit-status-buffer-local my/magit-status-buffer))

;; React against problem that crash window structure relating magit
(defadvice git-commit-commit
  (around ad-treat-window activate)
  "Treat window."
  (let ((buffer my/magit-status-buffer-local))
    (when (one-window-p) (split-window-horizontally))
    ad-do-it
    (unless (equal buffer (current-buffer))
      (switch-to-buffer-other-window buffer))))

(define-key git-commit-mode-map (kbd "C-c C-c") 'git-commit-commit)

(add-hook 'magit-mode-hook
          '(lambda ()
             (setq my/magit-status-buffer (current-buffer))))

(provide 'init_git-commit-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_git-commit-mode.el ends here
