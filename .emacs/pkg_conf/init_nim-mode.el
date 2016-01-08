;;; init_nim-mode.el --- nim-mode's init file -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'flycheck-nim)
(require 'nim-mode)
(require 'company-nim)

(defun nim-electric-backward-char ()
  "If current line is just an empty line, indent backward.
Otherwise, work as ‘backward-delete-char‘."
  (interactive)
  (if (and (looking-back (rx line-start (1+ " ")) nil)
           (not (nth 3 (syntax-ppss)))
           (not (nth 4 (syntax-ppss))))
      (nim-indent-line t)
    (backward-delete-char 1)))

(add-hook 'nim-mode-hook
          '(lambda ()
             (define-key nim-mode-map (kbd "C-h")
               'nim-electric-backward-char)
             (define-key nim-mode-map (kbd "TAB")
               (lambda ()
                 (interactive)
                 (setq this-command 'indent-for-tab-command)
                 (mykie:global-map:<tab>:key)))
             (add-to-list 'company-backends 'company-nim)))

;; need to build nimsuggest and move nimsuggest bin file to Nim's bin directory.
(defconst nim-nimsuggest-path
  (format "%s/github.com/nim-lang/nimsuggest/nimsuggest"
          (shell-command-to-string "echo -n `ghq root`")))

(provide 'init_nim-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_nim-mode.el ends here
