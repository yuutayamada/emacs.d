;;; Y-hooks.el --- my Y-hooks configurations -*- lexical-binding: t; -*-
;;; Commentary:
;; I'm going to put general hooks to here.
;; see also : http://www.gnu.org/software/emacs/manual/html_node/elisp/Standard-Hooks.html
;;; Commentary:
;;
;; Order of hooks in startup:
;; 1. ‘before-init-hook’ (maybe impossible to set?)
;; 2. (loading init files): site-start.el, _emacs, .emacs,
;;    ~/.emacs.d/init.el, default.el
;; 3. ‘after-init-hook’
;; 4. ‘emacs-startup-hook’
;; 5. ‘tty-setup-hook’
;; 6. ‘window-setup-hook’
;;
;;; Code:

(require 'cl-lib)

(add-hook
 'emacs-startup-hook
 '(lambda ()
    (condition-case err
        ;; Load only necessary files for less loading time
        (Y/load-packages
         '(depend_main   ; this file should be loaded first than other files.
           tabbar s
           init_mykie))

      (error (message (format "Init function error: %s" err))))))

;; This hook is activated after initialization of terminal
(add-hook
 'tty-setup-hook
 '(lambda ()
    (cl-case (assoc-default 'terminal-initted (terminal-parameters))
      (terminal-init-xterm
       (xterm-keybinder-setup))
      (terminal-init-rxvt
       (when (getenv "COLORTERM" (selected-frame))
         (urxvt-keybinder-setup "xft:DejaVu Sans Mono" 12))))
    (xterm-mouse-mode t)
    ;; Set background-mode as dark always
    ;; This configuration affects inside terminal Emacs under the xterm or urxvt.
    ;; see also : https://www.gnu.org/software/emacs/manual/html_node/elisp/Terminal-Parameters.html
    (set-terminal-parameter nil 'background-mode 'dark)))

(add-hook
 'window-setup-hook
 (lambda ()
   ;; COLOR THEME
   (load-theme 'my_pkg t)

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Mode Line
   (add-hook 'after-change-major-mode-hook 'Y/clean-mode-line)
   (add-hook 'find-file-hook 'Y/clean-mode-line)

   ;; Use Evil's normal mode only inside actual files.
   (add-hook 'find-file-hook
             '(lambda () (unless (bound-and-true-p with-editor-mode)
                      (evil-normal-state))))

   ;;;;;;;;;;;;;;;;;;;;;
   ;; prog-mode
   (require 'Y-prog-mode)

   ;;;;;;;;;;;;;;;;;;;;;;
   ;; files(find-file) ;;
   ;;;;;;;;;;;;;;;;;;;;;;
   ;; git-gutter
   (add-hook 'find-file-hook 'git-gutter-mode)
   (add-hook 'git-gutter-mode-on-hook
             '(lambda ()
                (setq git-gutter:modified-sign "±")
                ;; (git-gutter:linum-setup) ; for linum
                ))

   ;;; Document based mode hooks
   (cl-loop with hooks = '(markdown-mode-hook org-mode-hook erc-mode-hook)
            for hook in hooks
            do (add-hook hook '(lambda ()
                                 (unless (eq 'org-mode major-mode)
                                   (whitespace-mode t))
                                 (pangu-spacing-mode t)
                                 (flyspell-mode t))))

   ;; auto-insert mode
   ;; https://www.gnu.org/software/emacs/manual/html_node/autotype/Autoinserting.html
   ;; check point max for lazy loading
   (add-hook 'find-file-hook #'(lambda () (when (eq (point-max) 1) (auto-insert))))

   ;;;;;;;;;;;;;;;
   ;; view-mode ;;
   ;;;;;;;;;;;;;;;
   (add-hook 'help-mode-hook 'view-mode)
   (add-hook 'Man-mode-hook  'view-mode)

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Emacs Lisp
   (add-hook 'emacs-lisp-mode-hook 'Y-init-elisp-config)

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; workaround of <return> and RET keys ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Copy function of RET key because <return> key of global-map takes
   ;; over minibuffer's RET.
   (add-hook 'minibuffer-setup-hook
             #'(lambda ()
                 (define-key minibuffer-local-map (kbd "<return>")
                   (lookup-key minibuffer-local-map (kbd "RET")))))

   ;; likewise by major-mode
   (add-hook 'after-change-major-mode-hook
             #'(lambda ()
                 (let ((map-name (intern (format "%s-map" major-mode))))
                   (condition-case err
                       (let ((map (symbol-value map-name)))
                         (when (keymapp map)
                           (define-key map (kbd "<return>")
                             (lookup-key map (kbd "RET")))))
                     (error err)))))

   ;; Load files with `with-eval-after-load' func from `package-conf-dir'.
   (message-startup-time "configuring init files")
   (Y/add-after-load-files "init_" (concat package-conf-dir "builtin/"))
   (Y/add-after-load-files "init_" package-conf-dir)

   ;; Major-modes
   (el-get 'sync '(org-mode nim-mode lua-mode web-mode))
   (el-get 'sync 'idle-require)
   (add-hook 'helm-after-initialize-hook 'idle-require-mode)

   (run-with-idle-timer
    1.0 nil
    (lambda () (add-to-list 'mode-line-format '(:eval (Y/update-mode-line-bg)))))
   ;; (require 'yasnippet) (el-get 'sync 'yasnippet)
   ;; Boot Time ;;
   ;; Show boot time at *message* buffer
   ;; because emacs-init-time is not precise.
   (message-startup-time "total time past")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; New hook from emacs 24.4 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; *** New hooks `focus-in-hook', `focus-out-hook'.

;; Note that you CAN NOT apply `eval-after-load' to `text-mode'
;; `startup',and `files' which is original file of `find-file-hook'
;; due to the lack of `provide' function in those .el files. So you
;; should use hooks instead to do so.


(provide 'Y-hooks)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-hooks.el ends here
