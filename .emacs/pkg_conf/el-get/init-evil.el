;;; init-evil.el --- init file for evil-mode -*- lexical-binding: t; -*-

;;; Commentary:
;; MEMO
;; vim cheat sheet: http://www.fprintf.net/vimCheatSheet.html
;;   macro register: Push "q" and [a-zA-Z] and then do something then push q
;;   text-object: http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
;;   To call registered macros, push @ [a-z-A-Z].
;;
;; Use `evil-add-hjkl-bindings' function to add hjkl binding to a key map.
;; To see whole evil commands, checks evil-maps.el

;;; Code:
(require 'evil)
(require 'Y-autoload)
(require 'cl-lib)

;; Set default emacs state ;;
;; This is an upside using emacs state; using emacs state as default doesn't
;; involve evil keymap on other emacs based modes. (i.e., dired)
(setq evil-default-state 'emacs
      evil-inhibit-esc t)
;; Use emacs-state as insert mode.

;; Evil uses ESC key as `evil-esc' and I don't like this due to the delay.
(advice-add 'evil-insert-state :override 'evil-emacs-state)
;; Only keybind C-[ (don't affect to other ESC map)
(define-key evil-emacs-state-map   (kbd "A-ESC") 'evil-normal-state)
(define-key evil-visual-state-map  (kbd "A-ESC") 'evil-normal-state)
(define-key evil-motion-state-map  (kbd "A-ESC") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "A-ESC") 'evil-normal-state)
(define-key evil-normal-state-map  (kbd "A-ESC") 'evil-force-normal-state)

;; Move evil states to emacs state.
(when (or evil-insert-state-modes evil-motion-state-modes)
  (setq evil-emacs-state-modes
        (append evil-emacs-state-modes
                evil-insert-state-modes
                evil-motion-state-modes)
        ;; Then reset
        evil-insert-state-modes nil
        evil-motion-state-modes nil))

;; Prioritize specific mode keybinding than Evil keybind.
;; This configuration is needed if I use normal state as default state
;; instead of emacs state, so now this configuration is not efficient...
(setq evil-emacs-state-modes
      (append evil-emacs-state-modes
              '(eww-mode git-commit-mode git-rebase-mode dired-mode
                         mew-message-mode mew-summary-mode
                         image-mode ; <- image-dired
                         minibuffer-inactive-mode)))

(defadvice evil-normal-state (around Y/prevent-on-emacs-mode activate)
  "Prevent turn to Emacs state on specific modes."
  (unless (member major-mode evil-emacs-state-modes)
    ad-do-it))

(cl-loop with maps = `(evil-normal-state-map
                       evil-motion-state-map
                       evil-emacs-state-map)
         with avoid-keys = '("C-e" "C-s" "C-t" "C-w" "C-z"
                             "C-i" "C-o" "C-m"
                             "C-^" "C-=" "M-n" "M-p" "M-.")
         for map in maps
         do (apply `((lambda () (mykie:set-keys ,map ,@avoid-keys)))))

;; NORMAL STATE
(mykie:set-keys evil-normal-state-map
  ;; "U" undo-tree-visualize
  "T" Y/reverse-transpose-chars)
;; Emacs STATE
;; (define-key evil-emacs-state-map [escape] 'picture-mode)
;; (define-key evil-emacs-state-map (kbd "ESC") 'picture-mode)

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
   (lambda () (cl-typecase last-command-event
           (character (member
                       (char-to-string last-command-event)
                       '("h" "j" "k" "l" "f" "b" "t" "r" "+" "-"
                         "F" "B" "N" "P" "" "" "" "" ""
                         ;; Space and Tab
                         " " "	")))
           (t (member (vector last-command-event) `(,(kbd "S-SPC"))))))
   ;; :before (lambda () (Y/change-style '("#00bfff" "red" nil) 1))
   ;; :after  (lambda () (Y/change-style nil 0))
   )
  "q" :default nil ; this means just a quit and do not insert q
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
  ";" magit-status
  "SPC"   scroll-up
  "S-SPC" scroll-down)

;; MOTION STATE
(mykie:set-keys evil-motion-state-map
  "+"     evil-numbers/inc-at-pt
  "-"     evil-numbers/dec-at-pt
  "[ TAB" ffinder-jump
  "[ f"   error-tip-cycle-dwim
  "[ F"   (error-tip-cycle-dwim t)
  "[ n"   git-gutter:next-hunk
  "[ p"   git-gutter:previous-hunk
  "[ b"   (dired "~/share/doc/articles")
  "[ c"   (dired "~/code/cheat_sheets"))

;; VISUAL STATE
(mykie:set-keys evil-visual-state-map
  ";" comment-dwim)

;; Mykielize evil keybinds
;; (mykie:attach-mykie-func-to 'evil-normal-state)
;; this made a trouble which can not highlight region when I use C-v
;; (mykie:attach-mykie-func-to 'evil-motion-state)
;; (mykie:initialize)

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

;; HIGHLIGHT Cursor or etc. ;; hollow
;; (rainbow-mode t)
(setq evil-cross-lines t
      ;; Do not move eol when normal state
      evil-move-cursor-back t)

(advice-add 'other-window-or-split :after 'evil-refresh-cursor)
(add-hook 'find-file-hook 'evil-refresh-cursor)

;; xcc
(require 'xterm-cursor-changer)

;; turn on evil after saved
(add-hook 'after-save-hook 'evil-normal-state)

;; evil surround
(add-hook 'evil-mode-hook 'global-evil-surround-mode)

;; Go through end of line (evil affects M-f command, so this config is essential.)
(setq evil-move-beyond-eol t)

(provide 'init-evil)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init-evil.el ends here
