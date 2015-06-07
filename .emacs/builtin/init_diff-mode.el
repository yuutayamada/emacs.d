;;; init_diff-mode.el --- init file for diff-mode.el

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
(require 'diff-mode)
(require 'init_ediff)
(require 'cl-lib)

;; diff options
(setq diff-switches '("-u" "-p" "-N")
      diff-use-changed-face t)

;; (defun my/mew-add-font-lock-for-diff (mode)
;;   (interactive)
;;   (let* ((diff-keywords-without-context
;;           (cl-loop for keyword in diff-font-lock-keywords
;;                    unless (and (ignore-errors (cl-cadadr keyword))
;;                                (equal 'diff-context-face (cl-cadadr keyword)))
;;                    collect keyword))
;;          (keywords (append nil)))
;;     (font-lock-add-keywords mode keywords)))

(provide 'init_diff-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_diff-mode.el ends here
