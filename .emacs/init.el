;;; init.el --- init file for my Emacs
;;; Commentary:
;; work in progress
;;; Code:

(setq
 ;; Inhibit startup message/screen
 inhibit-startup-message t
 inhibit-startup-screen  t
 ;; Set GC limit to boot rapidly
 gc-cons-threshold (* 1024 1024 1024))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PREREQUISITE CONFIGURATION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'site-start)  ; BUILTIN, etc.
(require 'my_paths)    ; PATH CONFIGURATION
(require 'vars)        ; ENVIRONMENT VARIABLES
(require 'my_autoload) ; AUTOLOAD CONFIGURATION

;;; EL-GET
;; If el-get doesn't exist, then download it (with missing packages).
;; Otherwise ignore the loading.
(unless (file-exists-p
         (concat (bound-and-true-p el-get-dir) "el-get/el-get.el"))
  (require 'init_el-get))

;;; INIT SCRIPT
(condition-case err
    (progn
      ;; Load only necessary files for less loading time
      (my/load-packages my/default-load-files)
      ;; Apply my color theme for some packages
      (load-theme 'my_pkg_colors t)
      ;; Ensure applying color theme from booting emacsclient directly.
      (my/apply-color-theme))
  (error (message (format "Init function error: %s" err))
         (when (eq 'help-for-help (lookup-key global-map (kbd "C-h")))
           (my/set-basic-keys))))

(when (one-window-p)
  (view-echo-area-messages)
  (when (switch-to-buffer-other-window (get-buffer "*Messages*"))
    (highlight-phrase "error" 'error)
    (highlight-phrase "\\(.*newer than byte-compiled.*\n\\|warning\\)" 'warning)))

;;; DELAYED CONFIGURATION
;; Load some convenient packages(like auto-complete) when user opens a file.
;; This is for less loading time as well.(and it is loaded only once)
(add-hook 'find-file-hook 'my/after-load-function)

;; redefine GC threshold
(setq gc-cons-threshold (* 8 1024 1024))

;; Show boot time at *message* buffer
;; because emacs-init-time is not precise.
(message-startup-time (current-time))

;; Memo
;; wc -l /.emacs/*.el ./.emacs/*/*.el
;; ...
;; 11182 total
;; =====Emacs loaded in 536ms =======
;; =====Emacs-version: 25.0.50.1=====

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init.el ends here
