;;; my_basic-keybinds.el --- init file basic keybinds

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
;;; keybinds configuration
;; You can see valid key configuration
;; at http://ergoemacs.org/emacs/keyboard_shortcuts.html
;;
;; Example
;; (define-prefix-command 'my-insert-map)
;; (global-set-key [(hiragana-katakana)] 'my-insert-map)
;; (define-key my-insert-map "q" 'insert-hat)
;; (define-key my-insert-map "w" 'insert-back-apostrophe)
;; (define-key my-insert-map "z" 'insert-minus)
;; (define-key my-insert-map "x" 'insert-equal)
;; ([?\C->] win-next-window)
;; ([?\C-<] win-prev-window)
;;; Code:

;; For anything/helm to change C-h key
(load "term/bobcat")
(require 'cl-lib)

(cl-defun my/set-keybinds (&keys map &rest key-and-func)
  (cl-loop with use-keymap = (keymapp map)
           for i from 0 to (1- (length key-and-func)) by 2
           for key  = (nth i key-and-func)
           for formatted-key = (if (vectorp key) key (kbd key))
           for func = (nth (1+ i) key-and-func)
           if  use-keymap
           do      (define-key map formatted-key func)
           else do (global-set-key formatted-key
                                   (or func '(lambda () (interactive) nil)))))

;; This key bind will modify by my_keybind.el later.
;; But I added to use this key when Emacs's loading was failed.
(autoload 'ido-switch-buffer "init_ido")

(defun my/set-basic-keys ()
  ""
  (my/set-keybinds :map nil
                   "C-h"     'delete-backward-char
                   "C-M-g"   'grep
                   "M-?"     'help-for-help
                   "C-c i"   'indent-region
                   "C-c C-i" 'hippie-expand
                   "C-c ;"   'comment-dwim
                   "C-r"     'ido-switch-buffer))

;;;* mini-buffer
(define-key minibuffer-local-completion-map "\C-c\C-i"
  'file-cache-minibuffer-complete)

(provide 'my_basic-keybinds)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_basic-keybinds.el ends here
