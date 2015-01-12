;;; init_evil.el --- init file for evil-mode

;;; Commentary:
;; MEMO
;; v, Shift v, C-v : switch visual-mode
;;; Code:
(require 'evil)
(require 'mykie)
(require 'cl-lib)

;; Override Evil's keybinds
(cl-dolist (map `(,evil-normal-state-map
                  ,evil-motion-state-map
                  ;; I added this only for C-z
                  ,evil-emacs-state-map))
  (mykie:set-keys map
    "C-e" "C-o" "C-r" "C-s" "C-t" "C-w" "C-z" "C-^" "C-="
    "M-n" "M-p"))

(setq evil-default-cursor      'box ; 'hbar box
      evil-normal-state-cursor '("#Ff00ff")
      evil-insert-state-cursor '("#4169e1" (bar . 2))
      evil-emacs-state-cursor  '("#00ced1" (bar . 2))
      evil-cross-lines t
      ;; Do not move eol when normal state
      evil-move-cursor-back t)

(advice-add 'other-window-or-split :after 'evil-refresh-cursor)
(add-hook 'find-file-hook 'evil-refresh-cursor)

(setq ;; Use emacs state as default
 evil-default-state 'emacs)

(when (or evil-insert-state-modes evil-motion-state-modes)
  (setq evil-emacs-state-modes
        (append evil-emacs-state-modes
                evil-insert-state-modes
                evil-motion-state-modes)
        ;; Then reset
        evil-insert-state-modes nil
        evil-motion-state-modes nil))

(add-to-list 'evil-emacs-state-modes 'eshell-mode)

(advice-add 'evil-insert-state :override 'evil-emacs-state)

;;;;;;;;;;;;;;;;;
;; KEY BINDING ;;
;;;;;;;;;;;;;;;;;

;; MOTION STATE
(mykie:set-keys evil-motion-state-map
  "SPC"   :default scroll-up-command
  "S-SPC" :default scroll-down-command
  ";"     :default evil-ex
  ","     :default ace-jump-word-mode)

;;;;;;;;;;;;;;;;;
;; my function ;;
;;;;;;;;;;;;;;;;;
(defun Y-evil-key-exist-p (key)
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

;;;;;;;;;;;;;;;;;;;;;;
;; work in progress ;;
;;;;;;;;;;;;;;;;;;;;;;
;; ;; Create SPC keymap for normal state
;; (let ((map 'my/evil-state-spc-map))
;;   (my/define-prefix-key evil-normal-state-map map (kbd "SPC"))
;;   (mykie:set-keys map
;;     "a"   :default auto-capitalize-mode
;;     "c"   :default show-cheat-sheet
;;     "m"   :default flymake-mode
;;     "o"   :default my/toggle-opacity
;;     "r"   :default read-only-mode
;;     "s"   :default my/toggle-flyspell
;;     "g"   :default grep
;;     "j"   :default (global-key-binding (kbd "C-M-j"))
;;     "z"   :default (global-key-binding (kbd "C-z"))
;;     "h"   :default helm-descbinds
;;     "SPC" :default my/magit-status))

;; ;;; INSERT STATE
;; ;: Use Emacs's keybind
;; (setcdr evil-insert-state-map nil)
;; (define-key evil-insert-state-map (kbd "<muhenkan>") 'evil-normal-state)

;; (when (display-graphic-p) ;; return t if Emacs was GUI
;;   ;; This is faster than above [escape] and it can use at terminal.
;;   ;; Because below key doesn't need evil-esc-delay.
;;   (define-key evil-insert-state-map (kbd "C-[") 'evil-normal-state))

;; ;;; MOTION STATE
;; (mykie:set-keys evil-motion-state-map "n" "p")

;; ;; Bind other function to C-p and C-n, Use those function
;; ;; if evil-paste-pop or evil-paste-pop-next was failed.
;; (let ((setup
;;        (lambda (func-name move-func)
;;          (eval
;;           `(defadvice ,func-name
;;              (around evil-paste-or-move-line activate)
;;              (condition-case err
;;                  ad-do-it
;;                (error (if (eq this-command (quote ,func-name))
;;                           (call-interactively (quote ,move-func))
;;                         (signal (car err) (cdr err))))))))))
;;   (funcall setup 'evil-paste-pop-next (global-key-binding (kbd "C-n")))
;;   (funcall setup 'evil-paste-pop      (global-key-binding (kbd "C-p"))))
;; (defadvice evil-paste-after

;;   (around ad-evil-paste-after activate)
;;   (if buffer-read-only
;;       (call-interactively (global-key-binding (kbd "C-p")))
;;     ad-do-it
;;     (message "yank")))

;; ;; Function
;; (defun my/turn-to-evil-normal-state ()
;;   (interactive)
;;   (if (and evil-mode (and (not (evil-normal-state-p))
;;                           (not (evil-visual-state-p))))
;;       (evil-normal-state t)
;;     nil))

;; ;; Turn on evil insert state before use cua to prevent visual mode
;; (defadvice cua-set-rectangle-mark
;;   (around ad-switch-to-insert-state activate)
;;   (when evil-mode
;;     (evil-insert-state t))
;;   ad-do-it)

;; (add-hook 'text-mode-hook
;;           '(lambda ()
;;              (when evil-mode
;;                (if buffer-read-only
;;                    (evil-motion-state t)
;;                  (evil-insert-state t)))))

;; (add-hook 'org-src-mode-hook
;;           '(lambda ()
;;              (if (and evil-mode (org-src-edit-buffer-p))
;;                  (evil-insert-state t))))

;; ;; Avoid evil keybinds
;; (defun my/evil-inject-hjkl-keybinds+ (keymap &optional additional)
;;   ""
;;   (when (keymapp keymap)
;;     (evil-make-overriding-map keymap)
;;     (when additional
;;       (evil-add-hjkl-bindings keymap nil
;;         "s" (lookup-key global-map (kbd "C-v"))
;;         ;; "t" (lookup-key global-map (kbd "M-v"))
;;         " " (lookup-key evil-normal-state-map (kbd "SPC"))))
;;     (unless evil-mode
;;       (evil-emacs-state))))

;; (add-hook 'evil-after-load-hook
;;           '(lambda ()
;;              ;; helm
;;              (evil-make-overriding-map helm-map)
;;              ;; windows.el
;;              (evil-make-overriding-map win:switch-map)
;;              ;; dired
;;              (my/evil-inject-hjkl-keybinds+ dired-mode-map)
;;              ;; view-mode
;;              (my/evil-inject-hjkl-keybinds+ view-mode-map)
;;              ;; mew
;;              (add-hook 'mew-draft-mode-hook
;;                        '(lambda ()
;;                           (when (evil-normal-state-p)
;;                             (evil-insert-state t))))
;;              (cl-dolist (map `(,mew-summary-mode-map))
;;                (my/evil-inject-hjkl-keybinds+ map))
;;              ;; lookup.el
;;              (my/evil-inject-hjkl-keybinds+ lookup-summary-mode-map)
;;              (my/evil-inject-hjkl-keybinds+ lookup-content-mode-map)
;;              ;; isearch
;;              (my/evil-inject-hjkl-keybinds+ isearch-mode-map)
;;              ;; eww
;;              (my/evil-inject-hjkl-keybinds+ eww-mode-map t)
;;              ;; erc
;;              (my/evil-inject-hjkl-keybinds+ erc-mode-map)))

;; (dolist (hook '(minibuffer-setup-hook))
;;   (add-hook hook
;;             '(lambda ()
;;                (let ((evil-echo-state nil))
;;                  (unless (evil-insert-state-p)
;;                    (when evil-mode
;;                      (evil-insert-state t)))))))

;; (unless evil-mode (evil-emacs-state))

(provide 'init_evil)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_evil.el ends here
