;;; init_nim-mode.el --- nim-mode's init file -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'flycheck-nim)
(require 'nim-mode)
(require 'company-nim)

(setq nim-use-smie-indent t)

;; Indent accordingly by the length of statements.
(defconst nim-uncompleted-condition-indent 'stmt+1)

(add-hook 'nim-mode-hook
          '(lambda () (add-to-list 'company-backends 'company-nim)))

;; need to build nimsuggest and move nimsuggest bin file to Nim's bin directory.
(defconst nim-nimsuggest-path
  (format "%s/github.com/nim-lang/Nim/bin/nimsuggest"
          (shell-command-to-string "echo -n `ghq root`")))

;; (defadvice nim-indent-line (around prevent-indent activate)
;;   "Use previous indent level."
;;   (when (and (not noninteractive) (looking-back (rx line-start (0+ space))))
;;     (ad-set-arg 0 t))
;;   ad-do-it)

(defun Y/nim-smart-delete-backward-char ()
  "If current line is just an empty line, indent backward.
Otherwise, work as ‘backward-delete-char‘."
  (interactive)
  (if (looking-back (rx line-start (1+ " ")) nil)
      (nim-indent-line t)
    (backward-delete-char 1)))

(define-key nim-mode-map (kbd "C-h") 'Y/nim-smart-delete-backward-char)

(defadvice nim-mode-smie-rules (around output-debug-message activate)
  "Output debug information."
  (let ((k (ad-get-arg 0))
        (v (ad-get-arg 1))
        (fmt (concat "kind(%s)-Token(%s)-Point(%d)\n"
                     "sibling(%s)-parent(%s)-hanging(%s==%s)")))
    ad-do-it
    (message (format fmt k v (point)
                     (ignore-errors (smie-rule-sibling-p))
                     (ignore-errors smie--parent)
                     (ignore-errors (smie-rule-hanging-p))
                     ad-return-value))))

(provide 'init_nim-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_nim-mode.el ends here
