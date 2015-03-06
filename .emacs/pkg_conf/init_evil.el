;;; init_evil.el --- init file for evil-mode -*- lexical-binding: t; -*-

;;; Commentary:
;; MEMO
;; vim cheat sheet:  http://www.fprintf.net/vimCheatSheet.html
;; macro: register macro: q [a-zA-Z] and then do something then push q
;; text-object: http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
;; To call registered the macro, push @ [a-z-A-Z] that you pushed before.
;; Use `evil-add-hjkl-bindings' function to add hjkl binding to a key map.
;;; Code:

(require 'evil)
(require 'my_autoload)
(require 'cl-lib)

;; Set default emacs state ;;
;; This is an upside using emacs state; using emacs state as default doesn't
;; involve evil keymap on other emacs based modes like dired.
(setq evil-default-state 'emacs)
;; Use emacs-state as insert mode.
(advice-add 'evil-insert-state :override 'evil-emacs-state)

;; Emacs state than evil states
(when (or evil-insert-state-modes evil-motion-state-modes)
  (setq evil-emacs-state-modes
        (append evil-emacs-state-modes
                evil-insert-state-modes
                evil-motion-state-modes)
        ;; Then reset
        evil-insert-state-modes nil
        evil-motion-state-modes nil))

;; Prior specific mode keybinding than Evil keybind.
;; this configuration is needed if I use normal state as default state
;; instead of emacs state, so now this configuration is not efficient...
(setq evil-emacs-state-modes
      (append evil-emacs-state-modes
              '(eww-mode git-commit-mode git-rebase-mode dired-mode
                         mew-message-mode mew-summary-mode fundamental-mode)))

(defadvice evil-normal-state (around Y/prevent-on-emacs-mode activate)
  "Prevent turn to Emacs state on specific modes."
  (unless (member major-mode evil-emacs-state-modes)
    ad-do-it))

;; KEY BINDING ;;
;; Unbind needless keys
(cl-loop with maps = `(evil-normal-state-map
                       evil-motion-state-map
                       evil-emacs-state-map)
         with avoid-keys = '("C-e" "C-r" "C-s" "C-t" "C-w" "C-z"
                             "C-i" "C-o"
                             "C-^" "C-=" "M-n" "M-p")
         for map in maps
         do (apply `((lambda () (mykie:set-keys ,map ,@avoid-keys)))))

;; NORMAL STATE
(mykie:set-keys evil-normal-state-map
  "U" undo-tree-visualize
  ";" evil-ex)

(defun Y/toggle-background-color ()
  "Toggle background color."
  (interactive)
  (unless (display-graphic-p)
    (let ((color (if (equal "unspecified" (face-attribute 'default :background))
                     "black"
                   "unspecified")))
      (set-face-background 'default color nil))))

;; Create SPC keymap for normal state
(mykie:define-prefix-key evil-motion-state-map "SPC"
  (:keep
   (lambda () (member (char-to-string last-command-event)
                 '("h" "j" "k" "l" "f" "b" "t" "r" "+" "-"
                   "F" "B" "N" "P"
                   "" "" "" "" "	" "")))
   :before (lambda () (Y/change-style '("#00bfff" "red" nil) 1))
   :after  (lambda () (Y/change-style nil 0)))
  "q" :default nil ; this means just a quit and do not insert q
  "c" show-cheat-sheet
  "o" evil-normal-state
  "g" grep
  "t" tabbar-forward
  "r" tabbar-backward
  "f" scroll-up
  "b" scroll-down
  "z" Y/toggle-background-color
  "C-f" ffinder-jump
  "C-b" ffinder-jump-to-begging
  "C-n" evil-numbers/inc-at-pt
  "C-p" evil-numbers/dec-at-pt
  ;; window move
  "B" windmove-left
  "N" windmove-down
  "P" windmove-up
  "F" windmove-right
  "SPC" magit-status)

;; MOTION STATE
(mykie:set-keys evil-motion-state-map
  "+"     evil-numbers/inc-at-pt
  "-"     evil-numbers/dec-at-pt)

;; VISUAL STATE
(mykie:set-keys evil-visual-state-map
  ";" comment-dwim)

;; Mykielize evil keybinds
(mykie:attach-mykie-func-to 'evil-normal-state)
(mykie:attach-mykie-func-to 'evil-motion-state)
(mykie:initialize)

;;;;;;;;;;;;;;;;;
;; my function ;;
;;;;;;;;;;;;;;;;;
(defun Y-evil-key-exist-p (key)
  "My debug function to examine evil's KEY bind."
  (interactive)
  (cl-loop for m in '(evil-normal-state-map
                      evil-motion-state-map
                      evil-emacs-state-map
                      evil-insert-state-map
                      evil-window-map
                      evil-suppress-map
                      evil-ex-map
                      evil-read-key-map)
           if (and m (lookup-key (symbol-value m) (kbd key)))
           collect m))

;; HIGHLIGHT Cursor or etc.
(setq evil-default-cursor      'box ; You can specify: 'hbar or 'box
      evil-normal-state-cursor '("#Ff00ff")
      evil-insert-state-cursor '("#4169e1" (bar . 2))
      evil-emacs-state-cursor  '("#00ced1" (bar . 2))
      evil-cross-lines t
      ;; Do not move eol when normal state
      evil-move-cursor-back t)

(advice-add 'other-window-or-split :after 'evil-refresh-cursor)
(add-hook 'find-file-hook 'evil-refresh-cursor)

(defun Y/evil-change-highlight ()
  "Change highlight color of line."
  (let ((attributes
         (cl-case evil-state
           (emacs   '("#444488" "#ffffff" nil))
           (normal  '("#e80000" "#ffffff" nil))
           (insert  '("#00cd00" "#ffffff" nil))
           (visual  '("#006fa0" "#ffffff" nil))
           (replace '("#00af87" "#ffffff" nil))
           (t       '(nil nil t)))))
    (Y/change-style attributes)))

(cl-loop for func in '(evil-change-state evil-refresh-cursor)
         do (apply `((lambda ()
                       (advice-add (quote ,func) :after
                                   (lambda (&rest _args)
                                     (Y/evil-change-highlight)))))))

;; evil surround
(require 'evil-surround)
(global-evil-surround-mode 1)

(provide 'init_evil)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_evil.el ends here
