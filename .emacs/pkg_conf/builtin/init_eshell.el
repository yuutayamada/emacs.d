;;; init_eshell.el --- init file for eshell
;;; Commentary:
;; http://www.masteringemacs.org/article/complete-guide-mastering-eshell
;; C-c M-d : toggle delayed input and normal input
;;; Code:

(require 'em-hist)
(require 'em-prompt)
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

(defvar my/eshell-tmp-buffer nil)
(defun eshell-for-save-buffer (&optional not-new-buffer)
  (interactive)
  (let ((dir default-directory))
    (setq my/eshell-tmp-buffer (current-buffer))
    ;(eshell-prompt-initialize)
    (if not-new-buffer
        (eshell)
      (save-current-buffer
        (eshell 777)
        (cd dir)
        (eshell-interactive-print (concat "cd " dir "\n"))
        (eshell-emit-prompt)))))

(defun eshell-move-save-origin-buffer ()
  (if (version< "24.0.0" emacs-version)
      (switch-to-prev-buffer)
    (kill-this-buffer))
  (pop-to-buffer (get-buffer my/eshell-tmp-buffer)))

;;;*traverse history
(defun eshell-history-beginning-search-backward (arg)
  "arg で始まる履歴を検索して補完する．
zsh の history-beginning-search-backward にあたる機能．"
  (interactive "p")
  (if (equal eshell-history-index
          (1- (ring-length eshell-history-ring)))
      (progn
        (eshell-bol)
        (delete-region (point) (point-max)))
      (let ((cur (point)))
        (eshell-previous-matching-input-from-input arg)
        (delete-region (point) (point-max))
        (goto-char cur)
        (setq this-command
              'eshell-previous-matching-input-from-input))))

(defun eshell-history-beginning-search-forward (arg)
  "arg で始まる履歴を検索して補完する．
zsh の history-beginning-search-forward にあたる機能．"
  (interactive "p")
  (if (or (null eshell-history-index)
          (zerop eshell-history-index))
      (progn
        (eshell-bol)
        (delete-region (point) (point-max)))
      (let ((cur (point)))
        (eshell-next-matching-input-from-input arg)
        (delete-region (point) (point-max))
        (goto-char cur)
        (setq this-command
              'eshell-next-matching-input-from-input))))

(provide 'init_eshell)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_eshell.el ends here
