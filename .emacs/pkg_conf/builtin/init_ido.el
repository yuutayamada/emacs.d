;;; init_ido.el --- init file for ido.el

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
;; This is most useful article I've ever seen : http://www.masteringemacs.org/article/introduction-to-ido-mode
;; http://wikemacs.org/wiki/Ido
;; Usage Memo
;; C-s next candidate
;; C-r previous candidate
;; TAB | show possible candidates
;; C-j | create as new file
;; C-a | show hidden buffer like .xxx or
;; C-t | toggle enabling regexp

;;; Code:
;; source code: http://www.cua.dk/ido.el
(require 'ido)
(ido-mode t)

(setq ido-file-extensions-order
      '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".conf" ".html"))

(setq
 ;; enable fuzzy matching
 ido-enable-flex-matching t
 ;; Show recentf buffers
 ido-use-virtual-buffers t
 ;; you can toggle by C-t
 ido-enable-regexp t
 ;; ido-max-work-directory-list 300
 ;; do not hide dot files
 ido-enable-dot-prefix nil
 ido-enable-prefix nil)

(ido-everywhere t)

(when (executable-find "ghq")
  (defvar Y/ghq-dirs
    (cl-loop for dir in (split-string (shell-command-to-string "ghq list -p") "\n")
             collect dir)))

(require 'cl-lib)
;; Toggle feature ;;
(defun Y/ido-toggle ()
  "Toggle ido file and buffer."
  (interactive)
  (cl-case (bound-and-true-p ido-cur-item)
    (file
     (call-interactively 'ido-enter-switch-buffer))
    (buffer
     (call-interactively 'ido-enter-find-file))))

(provide 'init_ido)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ido.el ends here
