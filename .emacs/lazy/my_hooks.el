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
            (let
                ((cmd
                  (cl-case major-mode
                    (js2-mode (when (executable-find "jsfmt") 'jsfmt))
                    (go-mode  'gofmt-before-save))))
              (when cmd (call-interactively cmd)))))

;; flycheck without prog-mode
(add-hook 'nxml-mode-hook 'flycheck-mode)

;; Dired
(add-hook 'dired-mode-hook '(lambda () (require 'init_dired)))

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
             (yas-global-mode t)
             (my/whitespace-mode)
             (outline-minor-mode t)
             (flyspell-mode t)))

;;;* org-trello
(add-hook 'org-mode-hook
          '(lambda ()
             (when (and buffer-file-name
                        (string-match
                         (expand-file-name "~/trello/") buffer-file-name))
               (org-trello-mode))))

;;;* BUILT-IN
;; Do not display ^M
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m)
;; Use org-table in mail-mode
(add-hook 'mail-mode-hook 'turn-on-orgtbl)
;; Attach executable attribute when saving a file with #!
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; Java
(add-hook 'java-mode-hook '(lambda () (require 'init_java)))

(provide 'my_hooks)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_hooks.el ends here
