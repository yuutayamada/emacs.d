;;; init.el --- init file for my Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;; work in progress
;;; Code:

(setq
 ;; Inhibit startup message/screen
 inhibit-startup-message t
 inhibit-startup-screen  t
 ;; Set GC limit to boot rapidly
 gc-cons-threshold (* 1024 1024 1024))

;; Name "root" as base frame name. (emacs --daemon)
(when (equal 1 (length (frame-list)))
  (set-frame-name "root"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PREREQUISITE CONFIGURATION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'site-start)  ; BUILTIN, etc.
(require 'my_paths)    ; PATH CONFIGURATION
(require 'my_util)     ; load general functions

;; Prepare load-paths
(let ((dev (concat elisp-dir "self/")))
  (Y/add-load-path-subdir
   `(,el-get-dir ,package-dir ,config-dir ,dev)))

;; Avoid default org-mode
(require 'cl-lib)
(setq load-path
      (cl-loop for path in load-path
               unless (or (string-match "^/usr/share/.+/org$" path))
               collect path))

;;;;;;;;;;;;
;; EL-GET ;;
;;;;;;;;;;;;
;; If el-get doesn't exist, then download it (with missing packages).
;; Otherwise ignore the loading.
(unless (file-exists-p (concat el-get-dir "el-get/el-get.el"))
  (require 'init_el-get)
  (Y/add-load-path-subdir `(,el-get-dir)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AUTOLOAD CONFIGURATION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Note: this file should loads after el-get configuration or it will fail.
(require 'my_autoload)

;;;;;;;;;;;;;;;;;
;; INIT SCRIPT ;;
;;;;;;;;;;;;;;;;;
(condition-case err
    ;; Load only necessary files for less loading time
    (Y/load-packages
     '(depend_main   ; this file should load than other files.
       init_recentf  ; for helm-mini
       tabbar        ; turn on tabbar
       my_automode   ; define mode ext
       my_hooks      ; define hooks
       init_windows  ; load windows.el before mykie
       init_mykie    ; define my keybinds
       ))
  (error (message (format "Init function error: %s" err))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight error(s) or warning(s) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (one-window-p)
  (view-echo-area-messages)
  (when (switch-to-buffer-other-window (get-buffer "*Messages*"))
    (highlight-phrase "error" 'error)
    (highlight-phrase "\\(.*newer than byte-compiled.*\n\\|warning\\)" 'warning)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DELAYED CONFIGURATION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load some convenient packages(like auto-complete) when user opens a file.
;; This is for less loading time as well.(and it is loaded only once)
(add-hook 'find-file-hook 'Y/after-load-function)
;; Use EVIL normal mode in actual real file.
(add-hook 'find-file-hook  'evil-normal-state)
(add-hook 'after-save-hook 'evil-normal-state)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; FRAME CONFIGURATION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;; Manipulate changing color of bg, fg, copying, pasting, or
;; etc. when Emacs creates new frame (i.e., using emacsclient, editing
;; git commit or etc.)
(add-hook 'after-make-frame-functions 'Y/frame-init-func)

;; Refresh GC threshold
(setq gc-cons-threshold (* 8 1024 1024))

;;;;;;;;;;;;;;;
;; boot time ;;
;;;;;;;;;;;;;;;
;; Show boot time at *message* buffer
;; because emacs-init-time is not precise.
(message-startup-time (current-time))

;; Memo
;; wc -l /.emacs/*.el ./.emacs/*/*.el
;; ...
;; 11182 total

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init.el ends here
