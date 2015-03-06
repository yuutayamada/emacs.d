;;; my_hooks.el --- my hooks configurations -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; Load my programming configuration
(add-hook 'prog-mode-hook 'Y-init-prog-style)

;; Byte compile emacs lisp files automatically
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(add-hook 'before-save-hook
          (lambda ()
            ;; Format source code before save.
            (let ((cmd
                   (cl-case major-mode
                     (js2-mode (when (executable-find "jsfmt") 'jsfmt))
                     (go-mode  'gofmt-before-save))))
              (when cmd (call-interactively cmd)))))

;; flycheck without prog-mode
(add-hook 'nxml-mode-hook 'flycheck-mode)

;; Capitalize configuration
(add-hook 'after-change-major-mode-hook
          '(lambda ()
             (unless (eq major-mode 'gold-mode)
               (capitalizer-mode))))

(add-hook 'gold-mode-hook 'highlight-indentation-current-column-mode)

;;;* CSS
(add-hook 'css-mode-hook 'turn-on-css-eldoc)

;;;* TEXT-MODE
(add-hook 'text-mode-hook
          '(lambda ()
             (my/whitespace-mode)
             (outline-minor-mode t)
             (pangu-spacing-mode t)
             (unless (bound-and-true-p mykie:prog-mode-flag)
               (flyspell-mode t))))

;;;* org-trello
(add-hook 'org-mode-hook
          '(lambda ()
             (when (and buffer-file-name
                        (string-match
                         (expand-file-name "~/trello/") buffer-file-name))
               (org-trello-mode))))

;; Java
(add-hook 'java-mode-hook '(lambda () (require 'init_java)))

;; http link overlay without org-mode
(add-hook 'text-mode-hook     'Y/ov-turn-on-http-overlay)
(add-hook 'markdown-mode-hook 'Y/ov-turn-on-http-overlay)
(add-hook 'prog-mode-hook     'Y/ov-turn-on-http-overlay)

(provide 'my_hooks)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_hooks.el ends here
