;;; init_eshell.el --- init file for eshell
;;; Commentary:
;; http://www.masteringemacs.org/article/complete-guide-mastering-eshell
;; C-c M-d : toggle delayed input and normal input
;;; Code:

(require 'init_eshell-function)
(require 'em-cmpl)
(require 'em-banner)
(require 'em-term)
(require 'my_font)

;; Configure this to show git log correctly.
(add-to-list 'eshell-visual-commands "vim")

(setq eshell-highlight-prompt t
      eshell-cmpl-cycle-completions nil
      eshell-cmpl-cycle-cutoff-length 0
      eshell-save-history-on-exit t
      ;; Manual
      ;; http://www.gnu.org/software/emacs/manual/html_mono/eshell.html
      eshell-banner-message "Dollar Expression:
  $VAR             - Expands the VAR.
  $#VAR            - Expands to the length of the value bound to VAR.
  $(lisp)          - Expands to the result of evaluating the S-expression (lisp).
  ${command}       - Return output of command
  $var[i]          - Expands to the ith element of the value bound to var.
  $var[: i]        - As above, but now splitting occurs at the colon character.
  $var[: i j]      - It returns a list of two strings.
  $var[\"\\\\\" i] - Separate on backslash characters.
                     Actually, the first argument.
  $var[hello]      - Calls assoc on var with \"hello\"
  $#var[hello]     - Returns the length of the cdr of the element of var
                     who car is equal to \"hello\".
  $+               - This variable always contains the current working directory.
  $-               - This variable always contains the previous working directory.
  $_               - It refers to the last argument of the last command.
  $$               - This is the result of the last command.
  $?               - exit code of last command.
  C-c M-d : toggle delayed input and normal input

  Pseudo-Devices | Eshell reimplements the following pseudo-devices:
  /dev/eshell - Prints the output interactively to Eshell.
  /dev/null   - Sends the output to the NULL device.
  /dev/clip   - Sends the output to the clipboard.
  /dev/kill   - Sends the output to the kill ring.")

(advice-add 'eshell :after
            '(lambda ()
               (cd default-directory)
               (goto-char (point-max))
               (eshell-bol)
               (kill-line)
               (insert "\n")
               (eshell-send-input)
               (eshell-redisplay)))

(add-hook 'eshell-mode-hook
          '(lambda ()
             (mykie:set-keys eshell-mode-map
               "C-a"   t eshell-bol
               "C-r"   t helm-shell-history
               "M-t"   t eshell-toggle-direct-send
               "C-M-p" t (lambda () (interactive) (scroll-up-line   10))
               "C-M-n" t (lambda () (interactive) (scroll-down-line 10)))))

;;; ESHELL-BETTER-PROMPT
(require 'eshell-better-prompt)
;; %Y - Year %m - numeric month %d - day of month
;; %H - hour %M -minute
(setq eshell-better-prompt-time-format "%Y/%m/%d %H:%M")

(provide 'init_eshell)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_eshell.el ends here
