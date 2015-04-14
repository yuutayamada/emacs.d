;;; my_hooks.el --- my hooks configurations -*- lexical-binding: t; -*-
;;; Commentary:
;; I'm going to put general hooks to here.
;; see also : http://www.gnu.org/software/emacs/manual/html_node/elisp/Standard-Hooks.html
;;; Code:

;; For Terminal Emacs
;; This hook called each time when you boot terminal Emacs.
(add-hook 'terminal-init-xterm-hook 'turn-on-xclip)
(when (getenv "XTERM_VERSION")
  (add-hook 'terminal-init-xterm-hook 'xterm-keybinder-setup))

;; Use dark faces on Terminal Emacs (but, it doesn't change background)
;; see also : https://www.gnu.org/software/emacs/manual/html_node/elisp/Terminal-Parameters.html
(add-hook 'terminal-init-xterm-hook
          '(lambda () (set-terminal-parameter nil 'background-mode 'dark)))

;; auto capitalize
(add-hook 'first-change-hook 'auto-capitalize-mode)

;; New hook from emacs 24.4
;; *** New hooks `focus-in-hook', `focus-out-hook'.

;; Note that you CAN NOT apply `eval-after-load' to `text-mode'
;; `startup',and `files' which is original file of `find-file-hook'
;; due to the lack of `provide' function in those .el files. So you
;; should use hooks instead to do so.

;;; files(find-file):
;; git-gutter
(add-hook 'find-file-hook 'git-gutter-mode)
;; Use EVIL normal mode in actual real file.
(add-hook 'find-file-hook 'evil-normal-state)
;; auto-insert mode
;; https://www.gnu.org/software/emacs/manual/html_node/autotype/Autoinserting.html
;; check point max for lazy loading
(add-hook 'find-file-hook #'(lambda () (when (eq (point-max) 1) (auto-insert))))

;;; text-mode:
(add-hook 'text-mode-hook 'my/whitespace-mode)
(add-hook 'text-mode-hook 'pangu-spacing-mode)
(add-hook 'text-mode-hook 'auto-complete-mode)
(add-hook 'text-mode-hook #'(lambda () (run-with-idle-timer 3 nil 'flyspell-mode t)))

;; ;; shrink http link(still experimental...)
;; (add-hook 'text-mode-hook
;;           #'(lambda () (run-with-idle-timer 4 nil 'Y/ov-turn-on-http-overlay)))
;; (add-hook 'prog-mode-hook
;;           #'(lambda () (run-with-idle-timer 6 nil 'Y/ov-turn-on-http-overlay)))
;; (add-hook 'markdown-mode-hook
;;           #'(lambda () (run-with-idle-timer 3 nil 'Y/ov-turn-on-http-overlay)))

;; view-mode
(add-hook 'help-mode-hook 'view-mode)
(add-hook 'Man-mode-hook  'view-mode)

(provide 'my_hooks)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_hooks.el ends here
