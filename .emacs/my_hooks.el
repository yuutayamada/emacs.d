;;; my_hooks.el --- my hooks configurations -*- lexical-binding: t; -*-
;;; Commentary:
;; I'm going to put general hooks to here.
;; see also : http://www.gnu.org/software/emacs/manual/html_node/elisp/Standard-Hooks.html
;;; Code:

(require 'cl-lib)

;;;;;;;;;;;;;;;;;;;;;;;;
;; For Terminal Emacs ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; This hook is activated after initialization of terminal
(add-hook 'tty-setup-hook
          '(lambda ()
             (when (getenv "XTERM_VERSION" (selected-frame))
               (xterm-keybinder-setup))
             (when (getenv "COLORTERM" (selected-frame))
               (urxvt-keybinder-setup "xft:DejaVu Sans Mono" 12))
             (xterm-mouse-mode t)
             ;; Set background-mode as dark always
             ;; This configuration affects inside terminal Emacs under the xterm or urxvt.
             ;; see also : https://www.gnu.org/software/emacs/manual/html_node/elisp/Terminal-Parameters.html
             (set-terminal-parameter nil 'background-mode 'dark)))

;;;;;;;;;;;;;;;;;;;;;
;; auto capitalize ;;
;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-change-major-mode-hook 'auto-capitalize-mode)

;;;;;;;;;;;;;;;;;;;;;
;; clean mode line ;;
;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-change-major-mode-hook 'Y/clean-mode-line)
(add-hook 'find-file-hook 'Y/clean-mode-line)

;;;;;;;;;;;;;;;;;;;;;;;;
;; visual-fill-column ;;
;;;;;;;;;;;;;;;;;;;;;;;;
;; What a great package...
(add-hook 'visual-line-mode-hook 'visual-fill-column-mode)
(defadvice visual-fill-column-mode (around Y/stop-visual-fill-column-mode activate)
  "Stop ‘visual-fill-column-mode in magit."
  (unless (eq major-mode 'magit-status-mode)
    ad-do-it))

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

;; Use Evil's normal mode in actual files.
(add-hook 'find-file-hook
          '(lambda () ; don't activete normal state at magit's git commit buffer
             (unless (bound-and-true-p with-editor-mode)
               (require 'evil)
               (evil-emacs-state))))

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
