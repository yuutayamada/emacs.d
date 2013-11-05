;;; init_multi-term.el --- init file for multi-term.el

;; Copyright (C) 2013 by Yuta Yamada

;; Author: Yuta Yamada <cokesboy"at"gmail.com>

;;; License:
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;; Commentary:

;;; Code:
(require 'multi-term)
(require 'mykie)
(require 'cl-lib)
(defvar-local my/multi-term-original-buffer nil)

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

(set-face-attribute 'term-color-blue nil
                    :background "#483d8b"
                    :foreground "#7fffd4")

(set-face-attribute 'term-color-magenta nil
                    :background "#8b008b")

(set-face-attribute 'term-color-red nil
                    :foreground "#Ff6347")

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

(defun term-send-kill-line ()
  (interactive)
  (call-interactively 'kill-line)
  (term-send-raw-string "\C-k"))

(add-hook 'term-mode-hook
          `(lambda ()
             (mykie:set-keys term-raw-map
               "C-r"     t helm-shell-history
               "C-h"     t term-send-backspace
               "C-y"     t term-paste
               "C-p"     t term-send-previous-line
               "C-n"     t term-send-next-line
               "C-b"     t term-send-backward-char
               "C-f"     t term-send-forward-char
               ;; "C-a"     t term-bol ;sbtp-begging-of-line
               "C-k"     t term-send-kill-line
               "C-h"     t term-send-backspace
               "C-y"     t term-paste
               "C-S-p"   t multi-term-prev
               "C-S-n"   t multi-term-next
               ;; "C-o"     t ,(global-key-binding (kbd "C-o"))
               "ESC ESC" t term-send-raw)))

(provide 'init_multi-term)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_multi-term.el ends here
