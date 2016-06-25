;;; site-start.el ---  -*- lexical-binding: t; -*-

;;; Commentary:
;; This file will be loaded at first.
;; I'm using this file to set `initial-major-mode'.

;; Loading order (of startup.el) ;;
;; files:
;;   1. site-start.el (--no-site-file to prevent)
;;   2. ~/.emacs, ~/.emacs.d/init.el
;;   3. default.el    (-q to prevent)
;;
;; normal-top-level:
;;   -> command-line
;;      -> ‘before-init-hook’ (1066)
;;      -> load ‘site-start’ (1127)
;;      -> load _emacs, or .emacs
;;         -> if no .emacs then try to load ~/.emacs.d/init.el
;;      -> load ‘default’.el
;;      -> package initialize if user-init-file exists
;;      -> ‘after-init-hook’
;;      -> initialize scratch buffer
;;      -> ? tty-run-terminal-initialization
;;      -> process remaining arg (command-line-1 function)
;;         -> like -e, -f, -funcall, or -eval, -execute options
;;      -> (kill emacs for -batch option)
;;      -> daemon mode -> server-start -> daemon-initialized
;;   -> ‘emacs-startup-hook’, ‘tty-setup-hook’ (term-setup-hook)
;;   -> set font
;;   -> frame-set-background-mode
;;   -> ‘window-setup-hook’
;;
;; memo:
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Startup-Summary.html#Startup-Summary
;;; Code:

;; Do not configure when --batch option is specified
(unless noninteractive
  ;; Set GC limit to boot rapidly
  (let ((original-gc-cons-threshold gc-cons-threshold))
    (setq gc-cons-threshold (* 1024 1024 1024))
    (add-hook 'window-setup-hook
              `(lambda ()
                 (setq gc-cons-threshold ,original-gc-cons-threshold)
                 (when (version< "24.0.0" emacs-version)
                   (require 'notifications) ; this needs Dbus
                   (notifications-notify :title "Emacs Daemon"
                                         :body  "Ready to start!!!"
                                         :timeout 5000)))))

  ;; My core configuration files
  (setq
   ;; Load newer file than old file(this feature is from Emacs 24.4)
   load-prefer-newer t
   ;; Inhibit startup message/screen
   inhibit-startup-message t
   inhibit-startup-screen  t
   package-enable-at-startup nil
   ;; Basic display. Note that `emacs-basic-display' variable doesn't
   ;; work on Emacs Daemon, so this is better way. (I think)
   ;; memo: I changed scroll bar on Xresources
   menu-bar-mode nil
   tool-bar-mode nil)

  (add-to-list
   'load-path (format "%sY/" (file-name-directory (locate-library "site-start"))))

  (require 'Y-hooks)
  (require 'Y-premitives)
  (require 'Y-paths)
  (require 'Y-util)
  (require 'Y-el-get)

  ) ; end of unless

(provide 'site-start)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; site-start.el ends here
