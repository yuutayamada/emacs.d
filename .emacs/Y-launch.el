;;; Y-launch.el --- Yuta's Emacs init file -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; PREREQUISITE CONFIGURATION ;;
(require 'my_paths)    ; PATH CONFIGURATION
(require 'my_util)     ; Load general functions

(load "emacs-custom")
;; ‘package--ensure-init-file’ check this ‘package-initialize’s existence in
;; ‘user-init-file’. If you omit this, you can not use ‘package-install’.
(package-initialize)

;; Prepare load-paths
(let ((dev (concat elisp-dir "self/")))
  (Y/add-load-path-subdir
   `(,el-get-dir ,package-dir ,config-dir ,dev)))

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
     '(depend_main   ; this file should be loaded first than other files.
       tabbar        ; turn on tabbar
       my_automode   ; define mode ext
       my_hooks      ; define hooks
       init_windows  ; load windows.el before mykie
       init_mykie    ; define my keybinds
       ))
  (error (message (format "Init function error: %s" err))))

;; common color theme
(load-theme 'my_pkg t)

;; Color and Frame config ;;
(if (not (daemonp))
    ;; Regular Emacs
    (Y/frame-init-func)
  ;; Daemon Emacs ;;
  (when (equal 1 (length (frame-list)))
    (set-frame-name "root") ; Name "root" as base frame name. (emacs --daemon)
    (add-hook 'after-make-frame-functions 'Y/frame-init-func)))

;; idle require (for lazy loading)
(defconst idle-require-symbols
  ;; This list should register only kind of utility package or your heavy
  ;; rotation package.
  '(yasnippet helm ispell tramp evil eshell auto-capitalize magit
    org filecache helm-elisp flycheck el-get))
(idle-require-mode t)

;; Boot Time ;;
;; Show boot time at *message* buffer
;; because emacs-init-time is not precise.
(message-startup-time "total time past")

(provide 'Y-launch)
;;; Y-launch.el ends here
