;;; site-start.el ---  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Order of loading files (from startup.el) ;;
;;
;;   1. site-start.el (--no-site-file to prevent)
;;   2. ~/_emacs (windows), ~/.emacs, or ~/.emacs.d/init.el
;;   3. default.el    (-q to prevent)
;;
;; Summary of startup.el:
;;
;; normal-top-level:
;;   -> command-line
;;      -> ‘before-init-hook’ (<- does anyone know how to configure this?)
;;      -> load ‘site-start’
;;      -> load _emacs, or .emacs
;;         -> if there is no .emacs then try to load ~/.emacs.d/init.el
;;      -> load ‘default’.el
;;      -> package initialize if user-init-file exists
;;      -> ‘after-init-hook’, ‘delayed-warnings-hook’
;;      -> initialize scratch buffer
;;      -> ? tty-run-terminal-initialization
;;      -> process remaining arg (command-line-1 function)
;;         -> like -e, -f, -funcall, or -eval, -execute options, or -l, -load
;;      -> (kill Emacs for -batch option)
;;      -> daemon mode -> server-start -> daemon-initialized
;;   -> ‘emacs-startup-hook’, ‘tty-setup-hook’ (term-setup-hook)
;;   -> set font
;;   -> set frame-set-background-mode
;;   -> ‘window-setup-hook’
;;
;; memo:
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Startup-Summary.html#Startup-Summary
;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Circumvent --batch option
(unless noninteractive
  ;; Expand GC limit to boot rapidly
  (let ((original-gc-cons-threshold gc-cons-threshold))
    (setq gc-cons-threshold (* 1024 1024 1024))
    (add-hook 'window-setup-hook
              `(lambda ()
                 (setq gc-cons-threshold ,original-gc-cons-threshold)
                 (Y/message-startup-time "Ready to start!" t))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Start up configuration
  (setq
   ;; Load newer file than old file(this feature is from Emacs 24.4)
   load-prefer-newer t
   ;; Inhibit startup message/screen
   inhibit-startup-message t
   inhibit-startup-screen  t
   package-enable-at-startup nil
   ;; Note that `emacs-basic-display' variable doesn't
   ;; work on Emacs Daemon, so this is better way. (I think)
   ;; memo: I changed scroll bar on Xresources
   menu-bar-mode nil
   tool-bar-mode nil
   ;; If you use ‘emacsclient’ with no target file, then it obeys any
   ;; string or function value that this variable has.
   initial-buffer-choice
   (lambda () (doctor) (erase-buffer) (get-buffer "*doctor*"))
   ;; I don’t want to load lisp configuration here
   initial-major-mode 'ignore
   )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Prepare necessary configurations before loading default.el
  (add-to-list
   'load-path (format "%sY/" (file-name-directory (locate-library "site-start"))))

  (require 'Y-hooks)
  (require 'Y-premitives)
  (require 'Y-util)
  ;; don’t load Y-paths here; recentf’s configuration is changed

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Color Theme
  ;; (M-x ‘customize-themes’ makes your theme enable safe load)
  (load custom-file t t)
  (Y/custom-theme-random-pick
   '(deeper-blue dichromacy manoj-dark misterioso tango-dark tango
     tsdh-dark wheatgrass wombat))
  (push 'YY custom-enabled-themes) ; Ensure my color theme

  ) ; then load default.el

(provide 'site-start)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; site-start.el ends here
