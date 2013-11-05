;;; init_eclim.el --- init file for eclim.el

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
(with-no-warnings (require 'eclim))
(setq eclim-eclipse-dirs `(,(getenv "ECLIPSE_HOME"))
      eclim-executable (eclim-executable-find))

(defconst eclimd-executable (format "%s/eclimd" (getenv "ECLIPSE_HOME")))
(require 'eclimd)

(defun my/boot-eclim ()
  ""
  (let* ((boot-p (zerop (shell-command "pgrep eclimd")))
         (answer (and (not boot-p) (y-or-n-p "Use eclim? "))))
    (when answer 
      (call-interactively 'start-eclimd))
    answer))

;; for completion
(require 'ac-emacs-eclim-source)
;; avoid eclim-auto-complete
(define-key eclim-mode-map (kbd "C-M-i") nil)

(defadvice eclim-problems-highlight
  (around avoid-this activate)
  (when (eq 'java-mode major-mode)
    ad-do-it))

(provide 'init_eclim)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_eclim.el ends here
