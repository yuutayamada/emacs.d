;;; default.el --- Yuta's Emacs init file -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'Y-autoload)

;; Load files with `with-eval-after-load' func from `package-conf-dir'.
(Y/message-startup-time "configuring init files")
(Y/add-after-load-files "init_" (concat package-conf-dir "builtin/"))
(Y/add-after-load-files "init_" package-conf-dir)

(Y/message-startup-time "el-get setup")

;; Sync all packages for el-get. ‘el-get’ function registers
;; load-path, path of init-PKGNAME.el.
;; Note that sometimes el-get’s .loaddefs.el might break, so check
;; the file if you caught suspicious behavior (probably you can solve
;; by "el-get-update package")

(defconst el-get-is-lazy t) ; because Y-autoload.el ‘require’ .loaddefs.el

(let ((done ; wait until the sync is done
       (prog1 'sync-completed
         (el-get
          'sync
          '(windows f dash tabbar popwin wgrep auto-capitalize
            evil seqcmd helm fcitx flycheck flycheck-tip)))))

  (when done
    (if (not (daemonp))
        ;; Regular Emacs
        (Y/frame-init-func)
      ;; Daemon Emacs ;;
      (Y/message-startup-time "frame configuration setup")
      (when (equal 1 (length (frame-list)))
        (set-frame-name "root") ; Name "root" as base frame name. (emacs --daemon)
        (add-hook 'after-make-frame-functions 'Y/frame-init-func)))

    ;; PACKAGE.el ;;
    ;; ‘package--ensure-init-file’ check this ‘package-initialize’s existence in
    ;; ‘user-init-file’. If you omit this, you can not use ‘package-install’.
    (package-initialize)))

;; Order of hooks in startup:
;;
;;   1. ‘before-init-hook’ (maybe impossible to set?)
;;   2. (loading init files):
;;      site-start.el, _emacs, .emacs, ~/.emacs.d/init.el, default.el
;;   3. ‘after-init-hook’
;;   4. ‘delayed-warnings-hook’
;;   5. ‘emacs-startup-hook’
;;   6. ‘tty-setup-hook’
;;   7. ‘window-setup-hook’

;; see also : http://www.gnu.org/software/emacs/manual/html_node/elisp/Standard-Hooks.html

(add-hook
 'after-init-hook
 '(lambda ()
    (Y/message-startup-time "after-init hook")
    (condition-case err
        ;; Load only necessary files for less loading time
        (Y/load-packages '(windows depend_main tabbar init_mykie))
      (error (message (format "Init function error: %s" err))))))

(add-hook
 'emacs-startup-hook
 '(lambda ()
    (Y/message-startup-time "startup hook")
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
    ;; files (find-file)
    ;; Use Evil's normal mode only inside actual files.
    (add-hook 'find-file-hook
              '(lambda () (unless (bound-and-true-p with-editor-mode)
                       (evil-normal-state))))
    (add-hook 'find-file-hook 'git-gutter-mode)))

(defun tty-setup-once ()
  "Setup configuration for terminal Emacs at startup."
  ;; Note that this function is defined to prevent loading multiple times.
  ;; Somehow I discovered M-x term loads ‘tty-setup-hook’ at same time.
  (Y/message-startup-time "tty-setup hook")
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
  (set-terminal-parameter nil 'background-mode 'dark)
  (remove-hook 'tty-setup-hook 'tty-setup-once))

;; This hook is activated after initialization of terminal
;; or after M-x term. (not so sure)
(add-hook 'tty-setup-hook 'tty-setup-once)

(add-hook
 'window-setup-hook
 (lambda ()
   (Y/message-startup-time "window-setup hook")
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
                                 (auto-capitalize-mode t)
                                 (flyspell-mode t))))

   ;; Major-modes
   (el-get 'sync '(org-mode nim-mode lua-mode markdown-mode))

   ;; Convenient & key binds driven
   (el-get 'sync '(magit multiple-cursors avy helm-c-yasnippet yasnippet
                   git-gutter mew twittering-mode
                   company-mode auto-complete))

   (el-get 'sync 'idle-require)
   (add-hook 'helm-after-initialize-hook 'idle-require-mode)))

(provide 'default)
;;; default.el ends here
