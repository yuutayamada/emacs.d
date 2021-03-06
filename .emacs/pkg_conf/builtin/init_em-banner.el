
;;; Commentary:
;;; Code:
(require 'em-banner)

(setq eshell-banner-message "Dollar Expression:
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

(provide 'init_em-banner)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_em-banner.el ends here
