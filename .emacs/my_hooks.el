;;; my_hooks.el --- my hooks configurations -*- lexical-binding: t; -*-
;;; Commentary:
;; I'm going to put general hooks to here.
;; see also : http://www.gnu.org/software/emacs/manual/html_node/elisp/Standard-Hooks.html
;;; Code:

(require 'cl-lib)

;;;;;;;;;;;;;;;;;;;;;;;;
;; For Terminal Emacs ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(when (getenv "XTERM_VERSION")
  (add-hook 'terminal-init-xterm-hook 'xterm-mouse-mode)
  (add-hook 'terminal-init-xterm-hook 'xterm-keybinder-setup))

;; Use dark faces on Terminal Emacs (but, it doesn't change background)
;; see also : https://www.gnu.org/software/emacs/manual/html_node/elisp/Terminal-Parameters.html
(add-hook 'terminal-init-xterm-hook
          '(lambda () (set-terminal-parameter nil 'background-mode 'dark)))

;;;;;;;;;;;;;;;;;;;;;
;; auto capitalize ;;
;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-change-major-mode-hook 'auto-capitalize-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; New hook from emacs 24.4 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; *** New hooks `focus-in-hook', `focus-out-hook'.

;; Note that you CAN NOT apply `eval-after-load' to `text-mode'
;; `startup',and `files' which is original file of `find-file-hook'
;; due to the lack of `provide' function in those .el files. So you
;; should use hooks instead to do so.

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

;; Use Evil's normal mode in actual file.
(add-hook 'find-file-hook
          '(lambda () ; don't activete normal state at magit's git commit buffer
             (unless (bound-and-true-p with-editor-mode) (evil-normal-state))))

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
                              (auto-complete-mode t)
                              (flyspell-mode t))))

;;;;;;;;;;;;;;;
;; view-mode ;;
;;;;;;;;;;;;;;;
(add-hook 'help-mode-hook 'view-mode)
(add-hook 'Man-mode-hook  'view-mode)

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

(provide 'my_hooks)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_hooks.el ends here
