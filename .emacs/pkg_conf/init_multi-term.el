;;; init_multi-term.el --- init file for multi-term.el
;;; Commentary:
;;; Code:
(require 'multi-term)
(require 'mykie)
(require 'cl-lib)
(defvar-local my/multi-term-original-buffer nil)

;;;###autoload
(defun my/multi-term (&optional switch)
  (interactive)
  (let*
      ((current-directory default-directory)
       (original-buffer   (current-buffer))
       (term '(lambda (&optional flag)
                (when flag
                  ;; 19 -> s(hellscript)
                  (win-switch-to-window 1 19))
                (multi-term)
                (term-send-raw-string (concat "cd " current-directory "\n"))
                (setq-local my/multi-term-original-buffer original-buffer))))
    (if switch
        (funcall term)
      (funcall term :other-window))))

(defadvice multi-term-kill-buffer-hook
  (around ad-move-original-buffer activate)
  ad-do-it
  (if (and (eq major-mode 'term-mode) (equal win:current-config 19))
      (switch-to-buffer my/multi-term-original-buffer)))

;;;###autoload
(defun my/multi-term-current-buffer ()
  (interactive)
  (my/multi-term t))

(setq multi-term-program shell-file-name
      ;; You can set 'NEXT or 'PREVIOUS
      multi-term-switch-after-close 'PREVIOUS)

(let
    ((emacs24.3
      [term term-color-black
            term-color-red
            term-color-yellow
            term-color-green
            term-color-blue
            term-color-magenta
            term-color-cyan
            term-color-white ; foreground
            ])
     (old-emacs
      [unspecified
       "black" "red3" "green3" "yellow3"
       "DeepSkyBlue" ; directory
       "magenta1" "cyan3" "white"]))
  (setq ansi-term-color-vector
        (if (version<= "24.3.1" emacs-version)
            emacs24.3
          old-emacs)))

;; my-keybinds for keybinds -e
(defun term-send-forward-char ()
  (interactive)
  (term-send-raw-string "\C-f"))

(defun term-send-backward-char ()
  (interactive)
  (term-send-raw-string "\C-b"))

(defun term-send-previous-line ()
  (interactive)
  (term-send-raw-string "\C-p"))

(defun term-send-next-line ()
  (interactive)
  (term-send-raw-string "\C-n"))

(add-hook 'term-mode-hook
          `(lambda ()
             (mykie:set-keys term-raw-map
               "C-h"     term-send-backspace
               "C-y"     term-paste
               "C-p"     term-send-previous-line
               "C-n"     term-send-next-line
               "C-b"     term-send-backward-char
               "C-f"     term-send-forward-char
               "C-h"     term-send-backspace
               "C-y"     term-paste
               "C-S-p"   multi-term-prev
               "C-S-n"   multi-term-next
               "ESC ESC" t term-send-raw)))

(provide 'init_multi-term)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_multi-term.el ends here
