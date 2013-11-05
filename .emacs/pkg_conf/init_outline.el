;;; init_outline.el --- init file for outline.el

;; Copyright (C) 2013 by Yuta Yamada

;; Author: Yuta Yamada <cokesboy"at"gmail.com>
;; URL: https://github.com/yuutayamada/
;; Version: 0.0.1
;; Package-Requires: ((package "version-number"))
;; Keywords: keyword

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
(require 'my_autoload)
(require 'outline)
(require 'init_mykie)

(defvar-local my/hideshow-state 'show)
(defconst my/showhide-alist
  '((scala-mode . "^[ ]*?def")
    (ruby-mode  . "#[*\f]+")
    (go-mode    . "^ *?\\(func\\|type\\) ")
    (lisp-mode  . "^(")
    (perl-mode  . "#[*\f]+")))

(defun my/toggle-show-hide (&optional reg)
  "Toggle show and hide.
If you set REG as argument, then use REG as regexp of `outline-regexp'."
  (let ((toggle (lambda (&optional regexp)
                  (cond ((or mykie:prog-mode-flag regexp)
                         (if (hs-already-hidden-p)
                             (hs-show-all)
                           (hs-hide-all)))
                        (t (if (eq 'hide my/hideshow-state)
                               (show-all)
                             (hide-body)))))))
    (mykie:aif (or reg (assoc-default major-mode my/showhide-alist))
        (let ((outline-regexp it))
          (funcall toggle it))
      (funcall toggle))))

(defadvice hide-body (around set-flag activate)
  "Set 'hide flag to my/hideshow-state."
  ad-do-it
  (setq-local my/hideshow-state 'hide))

(defadvice show-all (around set-flag activate)
  "Set 'show flag to my/hideshow-state."
  ad-do-it
  (setq-local my/hideshow-state 'show))

(provide 'init_outline)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_outline.el ends here
