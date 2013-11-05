;;; init_flymake-for-c.el --- init file for C language and flymake

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
(require 'init_flymake)

(flymake-reformat-err-line-patterns-from-compile-el
 (add-to-list
  'flymake-err-line-patterns
  '("^\\(.+\\):\\([0-9]+\\):\\([0-9]+\\):\\(.+:.+$\\)" ;; Regexp
    1                                                  ;; File-Idx
    2                                                  ;; Line-Idx
    nil                                                ;; Col-Idx
    4                                                  ;; Err-Text-Idx
    )))

(defvar my/flymake-c-flags
  '("-O2" "-Wall" "-Wextra" "-Wformat"
    "-Werror=format-security" "-fsyntax-only"))

;; C
(defun flymake-c-init ()
  (flymake-simple-make-or-generic-init "gcc" my/flymake-c-flags))

;; C++
(defun flymake-cc-init ()
  (flymake-simple-make-or-generic-init "g++" my/flymake-c-flags))

;; syntax checkが異常終了しても無視する
(defadvice flymake-post-syntax-check
  (before flymake-force-check-was-interrupted activate)
  (setq flymake-check-was-interrupted t))

(push '("\\.[cCh]\\'"                                   flymake-c-init)
      flymake-allowed-file-name-masks)
(push '("\\.\\(?:cc\\|cpp\\|CC\\|CPP\\|.h\\|.hpp\\)\\'" flymake-cc-init)
      flymake-allowed-file-name-masks)

(add-hook 'c-mode-common-hook
          '(lambda ()
             (flymake-mode t)))

(provide 'init_flymake-for-c)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_flymake-for-c.el ends here
