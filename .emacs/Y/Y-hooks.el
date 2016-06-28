;;; Y-hooks.el --- my Y-hooks configurations -*- lexical-binding: t; -*-
;;; Commentary:
;; I'm going to put general hooks to here.
;; see also : http://www.gnu.org/software/emacs/manual/html_node/elisp/Standard-Hooks.html
;;; Commentary:
;;
;; Order of hooks in startup:
;; 1. ‘before-init-hook’ (maybe impossible to set?)
;; 2. (loading init files):
;;    site-start.el, _emacs, .emacs, ~/.emacs.d/init.el, default.el
;; 3. ‘after-init-hook’
;; 4. ‘delayed-warnings-hook’
;; 5. ‘emacs-startup-hook’
;; 6. ‘tty-setup-hook’
;; 7. ‘window-setup-hook’
;;
;;; Code:

(require 'cl-lib)
(require 'Y-autoload)

(add-hook
 'after-init-hook
 '(lambda ()
    (condition-case err
        ;; Load only necessary files for less loading time
        (Y/load-packages '(depend_main tabbar s init_mykie))
      (error (message (format "Init function error: %s" err))))
    ;; Load files with `with-eval-after-load' func from `package-conf-dir'.
    (Y/message-startup-time "configuring init files")
    (Y/add-after-load-files "init_" (concat package-conf-dir "builtin/"))
    (Y/add-after-load-files "init_" package-conf-dir)))

(add-hook
 'emacs-startup-hook
 '(lambda ()
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; prog-mode configuration
    (require 'Y-prog-mode)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Mode Line
    (add-hook 'after-change-major-mode-hook 'Y/clean-mode-line)
    (add-hook 'find-file-hook 'Y/clean-mode-line)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; View-mode
    (add-hook 'help-mode-hook 'view-mode)
    (add-hook 'Man-mode-hook  'view-mode)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Emacs Lisp
    (add-hook 'emacs-lisp-mode-hook 'Y-init-elisp-config)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; files (find-file)
    ;; Use Evil's normal mode only inside actual files.
    (add-hook 'find-file-hook
              '(lambda () (unless (bound-and-true-p with-editor-mode)
                        (evil-normal-state))))
    (add-hook 'find-file-hook 'git-gutter-mode)))

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
   ;; auto-insert mode
   ;; https://www.gnu.org/software/emacs/manual/html_node/autotype/Autoinserting.html
   ;; check point max for lazy loading
   (add-hook 'find-file-hook #'(lambda () (when (eq (point-max) 1) (auto-insert))))

   ;;; Document based mode hooks
   (cl-loop with hooks = '(markdown-mode-hook org-mode-hook erc-mode-hook)
            for hook in hooks
            do (add-hook hook '(lambda ()
                                 (unless (eq 'org-mode major-mode)
                                   (whitespace-mode t))
                                 (pangu-spacing-mode t)
                                 (flyspell-mode t))))

   ;; Major-modes
   (el-get 'sync '(org-mode nim-mode lua-mode web-mode))
   (el-get 'sync 'idle-require)
   (add-hook 'helm-after-initialize-hook 'idle-require-mode)

   (run-with-idle-timer
    1.0 nil
    (lambda () (add-to-list 'mode-line-format '(:eval (Y/update-mode-line-bg)))))))

;; Memo
;; use those hooks later: `focus-in-hook', `focus-out-hook'.

(provide 'Y-hooks)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-hooks.el ends here
