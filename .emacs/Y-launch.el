;;; Y-launch.el --- Yuta's Emacs init file -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; PREREQUISITE CONFIGURATION ;;
(require 'my_paths)    ; PATH CONFIGURATION
(require 'my_util)     ; Load general functions

;; Prepare load-paths
(let ((dev (concat elisp-dir "self/")))
  (Y/add-load-path-subdir
   `(,package-dir ,config-dir ,dev)))

;; Custom variables ;;
(load "emacs-custom")

;; EL-GET ;;
(add-to-list 'load-path package-conf-dir)
(require 'Y-el-get)

;; AUTOLOAD CONFIGURATION ;;
;; Note: this file should loads after el-get configuration or
;; it will fail.
(require 'my_autoload)

;; Sync all packages for el-get. ‘el-get’ function registers
;; load-path, path of init-PKGNAME.el.
;; Note that sometimes el-get’s .loaddefs.el might break, so check
;; the file if you caught suspicious behavior (probably you can solve
;; by "el-get-update package")
(let ((el-get-is-lazy t) ; because my_autoload.el ‘require’ .loaddefs.el
      (done ; wait until the sync is done
       (prog1 'sync-completed
         (el-get 'sync
                 '(windows ; load windows.el before mykie
                   s f dash tabbar popwin org-mode helm
                   ;; General
                   company-mode auto-complete yasnippet)))))

  (when done
    ;; INIT SCRIPT ;;
    (condition-case err
        ;; Load only necessary files for less loading time
        (Y/load-packages
         '(depend_main   ; this file should be loaded first than other files.
           tabbar s
           my_automode   ; define mode ext
           my_hooks      ; define hooks
           init_mykie    ; define my keybinds
           ))

      (error (message (format "Init function error: %s" err))))

    ;; Load files with `with-eval-after-load' func from `package-conf-dir'.
    (message-startup-time "configuring init files")
    (Y/add-after-load-files "init_" (concat config-dir "builtin"))
    (Y/add-after-load-files "init_" package-conf-dir)

    ;; COLOR THEME
    (load-theme 'my_pkg t)

    ;; Color and Frame config ;;
    (if (not (daemonp))
        ;; Regular Emacs
        (Y/frame-init-func)
      ;; Daemon Emacs ;;
      (when (equal 1 (length (frame-list)))
        (set-frame-name "root") ; Name "root" as base frame name. (emacs --daemon)
        (add-hook 'after-make-frame-functions 'Y/frame-init-func)))

    ;; Major-modes
    (el-get 'sync '(org-mode nim-mode lua-mode web-mode))

    (run-with-idle-timer
     10.0 nil
     '(lambda ()
        (progn
          (let ((el-get-is-lazy t))
            ;; When SYNC is `nil' (the default), all installations run
            ;; concurrently, in the background.
            (el-get)

            ;; idle require (for lazy loading)
            (el-get 'sync 'idle-require)))))

    ;; PACKAGE.el ;;
    ;; ‘package--ensure-init-file’ check this ‘package-initialize’s existence in
    ;; ‘user-init-file’. If you omit this, you can not use ‘package-install’.
    (package-initialize)
    (defconst package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("ELPA"  . "https://tromey.com/elpa/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

    ;; Boot Time ;;
    ;; Show boot time at *message* buffer
    ;; because emacs-init-time is not precise.
    (message-startup-time "total time past")

    ))

(provide 'Y-launch)
;;; Y-launch.el ends here
