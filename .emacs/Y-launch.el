;;; Y-launch.el --- Yuta's Emacs init file           -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Yuta Yamada

;; Author: Yuta Yamada <sleepboy.zzz@gmail.com>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;;; Code:

;; ‘package--ensure-init-file’ check this ‘package-initialize’s existence in
;; ‘user-init-file’. If you omit this, you can not use ‘package-install’.
;; (package-initialize)

;; PREREQUISITE CONFIGURATION ;;
(require 'my_paths)    ; PATH CONFIGURATION
(require 'my_util)     ; Load general functions

;; Prepare load-paths
(let ((dev (concat elisp-dir "self/")))
  (Y/add-load-path-subdir
   `(,el-get-dir ,package-dir ,config-dir ,dev)))

;; Avoid default org-mode
(require 'cl-lib)
(setq load-path
      (cl-loop for path in load-path
               unless (string-match "/git.savannah.gnu.org/emacs/lisp/org$" path)
               collect path))

;; EL-GET ;;
;; If el-get doesn't exist, then download it (with missing packages).
;; Otherwise ignore the loading.
(unless (file-exists-p (concat el-get-dir "el-get/el-get.el"))
  (require 'init_el-get)
  (Y/add-load-path-subdir `(,el-get-dir)))

;; AUTOLOAD CONFIGURATION ;;
;; Note: this file should loads after el-get configuration or
;; it will fail.
(require 'my_autoload)

;; INIT SCRIPT ;;
(condition-case err
    ;; Load only necessary files for less loading time
    (Y/load-packages
     '(depend_main   ; this file should load than other files.
       tabbar        ; turn on tabbar
       my_automode   ; define mode ext
       my_hooks      ; define hooks
       init_windows  ; load windows.el before mykie
       init_mykie    ; define my keybinds
       ))
  (error (message (format "Init function error: %s" err))))

;; Color and Frame config ;;
(if (not (daemonp))
    ;; Regular Emacs
    (Y/apply-color-theme (if (display-graphic-p) 'unspecified 'fabulous) 0)
  ;; Daemon Emacs ;;
  (when (equal 1 (length (frame-list)))
    (set-frame-name "root") ; Name "root" as base frame name. (emacs --daemon)
    (require 'my_daemon)))

;; idle require (for lazy loading)
(defconst idle-require-symbols
  ;; This list should register only kind of utility package or your heavy
  ;; rotation package.
  '(yasnippet helm auto-complete ispell tramp evil eshell auto-capitalize magit
    org filecache helm-elisp flycheck el-get))
(idle-require-mode t)

;; Boot Time ;;
;; Show boot time at *message* buffer
;; because emacs-init-time is not precise.
(message-startup-time "total time past")

(provide 'Y-launch)
;;; Y-launch.el ends here
