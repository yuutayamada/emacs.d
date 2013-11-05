;;; init_java.el --- init file for java-mode

;; Copyright (C) 2014 by Yuta Yamada

;; Author: Yuta Yamada <cokesboy"at"gmail.com>
;; URL: https://github.com/yuutayamada/

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
(require 'init_android-mode)

(defun my/java-init ()
  "Init function for `java-mode'."
  (require 'init_cc-mode)
  (c-set-style "my-java")
  (require 'init_flymake-java)
  (require 'init_javadoc-lookup)
  (flymake-mode t)
  ;; To use auto-java-complete, you need to prepare ~/.java_base.tag file
  ;; See Install file in auto-java-complete.
  (require 'init_auto-java-complete))

(add-hook 'java-mode-hook 'my/java-init)

(defun my/java-boot-eclim ()
  "Boot eclim."
  (when (and (not (string-match "^\\*Org Src .*\\*" (buffer-name)))
             (string-match "/src/.*\\.java$" buffer-file-truename)
             (my/boot-eclim)
             (eclim--project-name))
    (eclim-mode)
    (ac-emacs-eclim-config)))

(provide 'init_java)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_java.el ends here
