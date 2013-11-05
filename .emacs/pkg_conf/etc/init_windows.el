;;; init_windows.el --- init file for windows.el

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

;;;* windows.el configuration
(defconst win:switch-prefix (kbd "C-z"))
(defconst win:use-frame     nil)
(defconst win:base-key      (1- (string-to-char "a")))
(defconst win:max-configs   27)
(defconst win:quick-selection nil)
(defconst revive:ignore-buffer-pattern "^ \\*")
(require 'vars)
(defconst win:configuration-file (format "%s%s" config-dir "var/.windows"))

(require 'windows)
(require 'revive)
(require 'mykie)

(defadvice win-switch-to-window (around reset-bg-color activate)
  ad-do-it
  (my/reset-bg-color))

(win:startup-with-window)

(mykie:set-keys win:switch-menu-map
  "e"  t win-switch-menu-select-directly
  ";"  t win-switch-menu)

(global-unset-key win:switch-prefix)
(global-set-key (kbd win:switch-prefix) win:switch-map)
(mykie:global-set-key (concat win:switch-prefix " " win:switch-prefix)
  t win-toggle-window)

(require 'server)
(unless (server-running-p)
  (define-key ctl-x-map "\C-c" 'see-you-again))

(provide 'init_windows)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_windows.el ends here
