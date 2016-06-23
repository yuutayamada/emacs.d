;;; init_mykie.el --- init file for mykie.el -*- lexical-binding: t; -*-

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
;; memo
;; http://www.linux-france.org/article/appli/emacs/manuel/html/key-bindings.html
;;
;; Vector
;; [?\C->], [?\C-<], [(hiragana-katakana)]
;;; Code:

(require 'my_autoload)

(require 'mykie)

;; mykie.el setup ;;
(setq mykie:use-major-mode-key-override 'global
      mykie:region-conditions
      (append mykie:region-conditions
              '((:evil-visual . (eq (bound-and-true-p evil-visual-selection) 'char))
                (:evil-visual-line . (eq (bound-and-true-p evil-visual-selection) 'line))
                (:evil-visual-block . (eq (bound-and-true-p evil-visual-selection) 'block))))
      ;; mykie:use-fuzzy-order nil
      mykie:normal-conditions
      (append mykie:normal-conditions
              '((:error . (error-tip-error-p))
                (:evil-emacs  . (eq (bound-and-true-p evil-state) 'emacs))
                (:evil-normal . (eq (bound-and-true-p evil-state) 'normal))
                (:evil-insert . (eq (bound-and-true-p evil-state) 'insert))
                (:multiline-comment
                 . (let ((ppss (syntax-ppss)))
                     (and (not (eq t (nth 4 ppss)))
                          (nth 4 ppss))))
                (:hs-hidden     . (and mykie:prog-mode-flag
                                       (condition-case err
                                           (hs-already-hidden-p)
                                         (error err))))
                (:hidden . (eq 'hide (bound-and-true-p my/hideshow-state)))
                (:markdown-header . (and (eq 'markdown-mode major-mode)
                                         (string-match "^#+ " (thing-at-point 'line))))
                (:org-src    . (or (org-in-src-block-p)
                                   (org-src-edit-buffer-p)
                                   (string-match "^\\*Org Src .*\\*" (buffer-name))))
                (:org-mobile . (org-mobile-dir-p))
                (:org-header . (and (eq 'org-mode major-mode)
                                    (org-on-heading-p)))
                ("^:skk-\\(on\\|active\\)$" . (mykie:get-skk-state))))
      mykie:major-mode-ignore-list '(magit-status-mode magit-popup-mode)
      mykie:minor-mode-ignore-list '())
(mykie:initialize)

;; ;; self-insert-command keys ;;
;; (mykie:set-keys with-self-key
;;   ;; NOTE
;;   ;; number keys are NOT allowed :C-u and :region&C-u keywords
;;   "1" :region sort-lines
;;   "2" :region (sort-lines ; sort-lines with reverse
;;                t (region-beginning) (region-end))
;;   "3" :region fill-region
;;   "4" :region align

;;   "a"
;;   :C-u anzu-query-replace-at-cursor-thing
;;   :region align

;;   "b"
;;   :region comment-box

;;   "i" :C-u&java-mode add-java-import
;;   ;; "c" :C-u (my/open-calendar)

;;   "e"
;;   :C-u&emacs-lisp-mode Y/eval-and-replace
;;   :C-u&lisp-interaction-mode Y/eval-and-replace

;;   "f"
;;   :C-u! racer-find-definition
;;   :region (mykie:do-while "f" indent-rigidly
;;                           "u" undo)

;;   "g"
;;   :C-u! my/helm-gtags ; helm-gtags-dwim
;;   :region my/ginger-region

;;   ;; "l" :C-u Y/lookup
;;   "m" :C-u mew
;;   "n"
;;   :region     rectangle-number-lines
;;   ;; Specify starting number by M-N number* or C-u number*
;;   :region&C-u (rectangle-number-lines
;;                (region-beginning) (region-end) current-prefix-arg)

;;   "s"
;;   :C-u flop-frame ; swap left and right
;;   :C-u*2 transpose-frame
;;   :C-u*3 flip-frame ; swap up and down
;;   "u" :C-u (undo-tree-visualize)

;;   ;; Just testing
;;   "w"
;;   :C-u!   google-translate-at-point
;;   ;; :C-u*2!
;;   :C-u*3 (message (format "%s" current-prefix-arg))
;;   )

;; (assoc-default "Japanese" google-translate-supported-languages-alist)

;; -------------------------------------------------
;; C-[a-z] ;;
(mykie:set-keys nil ; nil means global-map

  "C-a"
  :default     (seqcmd-home)
  ;; :org-mode    (seqcmd-org-home)
  :comint-mode (sbtp-begging-of-line)
  :C-u         mark-whole-buffer

  "C-b"
  :default backward-char
  :skk-on  skk-b-move-henkan-point-back
  :C-u     backward-char

  "C-d"
  :default delete-char
  :C-u&prog (mykie
             :c-mode helm-info-libc
             :haskell-mode (mykie
                            :C-u   helm-hoogle
                            :C-u*2 helm-ghc-browse-document)
             :go-mode (mykie
                       :C-u   helm-go
                       :C-u*2 helm-go-show-packages)
             :java-mode my/lookup-android-docs
             ;; :ruby-mode helm-rb
             :lisp-mode slime-documentation-lookup)
  :C-u     (mykie
            :default (kill-whole-line)
            :nxml-mode my/lookup-android-docs)
  :region  comment-dwim

  "C-e"
  :default (seqcmd-end)
  :org-mode   (seqcmd-org-end)
  :C-u        eww
  :C-u*2      (if (bound-and-true-p evil-mode)
                  (evil-mode 0)
                (evil-mode))
  :region&C-u align

  "C-f"
  :default    forward-char
  :skk-on     skk-b-move-henkan-point-fwd
  :skk-active skk-b-move-henkan-point-fwd
  :C-u&url (browse-url-firefox mykie:current-thing)
  :C-u&prog (mykie
             :haskell-mode
             (mykie
              :C-u*2 haskell-commander-from-buffer
              t haskell-commander))
  :C-u (mykie
        :C-u*2 (my/copy-current-file-name)
        t (forward-char 1))
  "C-h"
  :default delete-backward-char
  :ido     ido-delete-backward-updir
  :C-u     helm-descbinds
  :C-u*2   switch-to-haskell

  "C-j"
  :default           my/newline-and-indent
  :multiline-comment newline
  :comment           comment-indent-new-line
  :python-mode       newline-and-indent
  :skk-active     (skk-kakutei)
  :skk-on         (skk-kakutei)
  :C-u&url        (browse-url-at-point)
  :C-u*2          jazzradio
  :email          (message mykie:current-thing)
  :mew-draft-mode newline-and-indent
  :C-u!           (save-restriction
                    (narrow-to-region (point-at-bol) (point-at-eol))
                    (call-interactively 'fill-paragraph))
  :region         mc/edit-lines
  :region&C-u     mc/mark-all-in-region

  "C-k"
  :default    (my/kill-line)
  :haskell-mode kill-line
  :grep-mode  kill-this-buffer
  :skk-active (yim-convert-to-katakana)
  :skk-on     (backward-char)

  "C-l"
  :default        (recenter-top-bottom)
  :skk-active     (yim-convert-to-katakana)
  :skk-on         (forward-char)
  :C-u! (mykie
         :error  (mykie:do-while
                  "n" (error-tip-cycle-dwim)
                  "p" (error-tip-cycle-dwim-reverse)
                  "g" (error-tip-delete-popup))
         :org-src  (my/org-dwim)
         :org-mode (my/org-dwim)
         :scala-mode my/ensime-goto-next-error
         t anzu-query-replace-regexp)
  :C-u*2!         anzu-query-replace-at-cursor-thing
  :C-u*3! (message (format "%s" (face-at-point)))
  :region         anzu-query-replace-regexp
  :region&C-u     query-replace-regexp

  "C-n"
  :default    next-line
  :skk-on     skk-b-change-candidate-next
  :skk-active skk-b-change-candidate-next
  :C-u!       (mykie:do-while
               "n" git-gutter:next-hunk
               "p" git-gutter:previous-hunk)

  "C-o"
  :default company-ispell
  :evil-normal ffinder-jump
  :C-u helm-apropos

  "C-p"
  :default    previous-line
  :skk-on     skk-b-change-candidate-previous
  :skk-active skk-b-change-candidate-previous
  :C-u        popwin:popup-last-buffer

  "C-q"
  :default quoted-insert
  :grep-mode kill-this-buffer

  "C-r"
  :default ido-switch-buffer
  :C-u     Y/ido-find-ghq-dirs
  :C-u*2   remember-notes

  "C-s"
  :default isearch-forward
  :git-commit-mode-map helm-ag-r-git-logs
  :C-u!    helm-swoop
  :C-u*2   (helm-ag-r-current-file)

  "C-t"
  :default transpose-chars
  :C-u*2   buttercup-run-at-point
  ;; :C-u     google-translate-at-point
  ;; :region  google-translate-at-point

  "C-S-t"
  :default Y/reverse-transpose-chars

  "C-v"
  :default scroll-up-command
  :C-u     (mykie:vi-faker)
  :C-u*2   (helm-c-yas-complete)
  :region  scroll-up-command

  "C-w"
  :default (my/kill-backward-word)
  :C-u     (ispell-word)
  :region  kill-region

  "C-y"
  :default yank
  :C-u     (helm-c-yas-complete)
  :C-u*2   (mouse-yank-primary (point))

  "C-z" other-window-or-split
  "C--" text-scale-decrease
  "C-+" text-scale-increase
  "C->" win-next-window
  "C-<" win-prev-window
  "C-=" Y/show-cheat-sheet
  ;; "C-0" my/helm-lookup-history
  ;; "C-3" my/toggle-show-hide
  ;; "C-4" helm-show-mykie-keywords
  ;; "C-8" (cider-turn-on-eldoc-mode)
  )

;; SUPER KEY BINDING ;;
(mykie:set-keys global-map
  "s-s" t win-switch-menu)

;; RESTRICTED KEYBINDS                 ;;
;; Below keys Can not uses at terminal ;;
;; Testing without :default            ;;
(mykie:set-keys nil
  "C-S-d" doctor
  "C-S-m" mew
  "C-S-n" linum-mode
  "C-S-o" remember
  "C-S-h" helm-descbinds

  "C-;"
  :region  (if buffer-read-only
               (helm-resume current-prefix-arg)
             (comment-dwim current-prefix-arg))
  :C-u     (cl-case major-mode
             (eshell-mode (delete-window))
             (t (eshell)))
  :default (helm-resume current-prefix-arg)

  "C-'"
  :default magit-status
  :region  align

  "C-," Y/lookup-stardict
  )

;; C-c prefix map ;;
(mykie:set-keys global-map
  "C-c s"
  :default my/w3m-search
  :c-mode  helm-c-etags-select

  "C-c g" :default  grep

  "C-c C-a"
  :default (message "Implement me")
  :prog (mykie
         :scala-mode sbtp-console-send-current-page)

  "C-c C-c"
  :default (message "Implement me")
  :grep-mode grep-edit-finish-edit

  "C-c i"
  :default nil ; implement me
  :region indent-region

  "C-c C-p"
  :default  (message "Implement me!")
  :prog (mykie
         :scala-mode sbtp-console-send)
  :org-mode bpe:post-article
  :org-mobile (mykie :default (org-mobile-push)
                     :C-u     (org-mobile-pull))

  "C-c C-l"
  :default (message "Implement me")
  :prog (mykie
         :scala-mode sbtp-console-send-line)

  "C-c C-o"
  :default pane-toggle-window-structure)

;; C-x keymap ;;
;; Default keymap for C-x commands.
;; The normal global definition of the character C-x indirects to this keymap.
(mykie:set-keys ctl-x-map ; test other key map
  ;; Note:
  ;;   C-x c : helm binds helm related commands
  ;;   C-x b : ido-switch-buffer
  "C-b" Y/ido-find-ghq-dirs
  "g"   grep
  "o"   (mykie:do-while "o" other-window-or-split)

  "j"
  :default my/open-junk-today
  :C-u     open-junk-file

  "C-f" ido-find-file)

;; I couldn't bind C-x C-c pair on above ctl-x-map...
(mykie:set-keys nil
  "C-x C-c"
  :C-u     save-buffers-kill-emacs    ; remain emacs daemon
  :default save-buffers-kill-terminal ; kill daemon as well
  )

;; f0-9 ;;
(mykie:set-keys global-map
  "<f1>"     winner-undo
  "<f2>"     winner-redo
  "S-<f1>"   my/load-color-theme
  "<f5>"     my/revert-buffer
  "<f7>"     point-undo
  "S-<f7>"   point-redo
  "<f8>"     goto-last-change
  "S-<f8>"   goto-last-change-reverse
  "<f9>"     my/toggle-opacity
  "<f10>"    my/festival-read-buffer
  "S-<f10>"  my/load-color-theme
  "<f11>"    my/open-calendar
  "<f12>"    helm-skk-rules
  "S-<f12>"  my/screen-shot)

;; NON ALPHABETICAL CHARACTER ;;
;; Do not bind "M-[" because it will take over F5-F10 keybind of terminal Emacs.
(mykie:set-keys nil
  "M-;"  comment-dwim
  "M-]"  bm-previous
  "C-\]" esc-map
  "C-\\" toggle-input-method
  "C-*"  undo)

;; Japanese keyboard only ;;
(mykie:set-keys nil
  [(henkan)]
  :default           (yim-convert)
  :C-u               skk-j-mode-on

  [(hiragana-katakana)] :default yim-abbrev

  "<muhenkan>"
  :default (when (and (bound-and-true-p evil-mode)
                      (not (member major-mode evil-emacs-state-modes)))
             (call-interactively 'evil-normal-state))
  :repeat magit-status

  "<C-muhenkan>"
  :default buf-move-down
  :C-u     buf-move-left

  "<C-henkan>"
  :default (condition-case err
               (buf-move-left)
             (error (buf-move-right)))
  :C-u     git-messenger:popup-message)

;; TABS ;;
;; memo: there is a difference between <tab> and TAB
;; http://stackoverflow.com/questions/1792326/how-do-i-bind-a-command-to-c-i-without-changing-tab
(mykie:set-keys nil
  "S-TAB"       my/insert ; C-S-TAB
  "M-TAB"       company-complete
  [(C-tab)]     fold-dwim-toggle
  [(backtab)]   my/toggle-opacity
  [(super tab)] pcomplete)

(mykie:global-set-key [tab]
  :default indent-for-tab-command
  :markdown-header markdown-cycle
  :evil-normal (mykie :prog ffinder-jump-to-begging
                      :org-mode org-cycle))

(mykie:global-set-key (kbd "A-i")
  :default indent-for-tab-command
  :markdown-header markdown-cycle
  :evil-normal (mykie :prog ffinder-jump-to-begging
                      :org-mode org-cycle))

;; RET key ;;
(mykie:set-keys nil
  "M-RET" sane-term
  ;; "<C-return>"   cua-set-rectangle-mark
  ;; "<C-M-return>" my/multi-term

  ;; This key bind works if I activates xterm-keybinder's enable C-m
  ;; key feature, but it's currently work in progress.
  "A-m"
  :default     (newline)
  :C-u         (mykie:do-while "m" my/replicate-current-line)
  :org-mode    (org-return))

;; TODO: make :on-enter, :on-exit
(mykie:define-prefix-key global-map "M-j"
  (:exit
   (lambda ()
     (or (member last-command
                 '(mc/keyboard-quit
                   self-insert-command
                   mc/insert-numbers))
         (eq last-command-event (string-to-char "q"))))
   ;; :before (lambda () (Y/change-style '("blue" "black" nil) 1))
   ;; :after  (lambda () (Y/change-style nil 0))
   )
  ;; multiple-cursors ;;
  "q"     :default nil
  "C-s"   mc/mark-next-like-this
  "M-s"   mc/skip-to-next-like-this
  "C-r"   mc/mark-previous-like-this
  "M-r"   mc/skip-to-previous-like-this
  "C-u"   mc/unmark-next-like-this
  "M-u"   mc/unmark-previous-like-this
  "M-j"   mc/mark-all-like-this-dwim
  "C-M-i" mc/insert-numbers
  "C-M-s" mc/sort-regions
  "C-M-r" mc/reverse-regions)

;; M- prefix ;;
(mykie:set-keys nil
  "M-c"
  :default seqcmd-capitalize-backward-word

  "M-h"
  :default mark-paragraph
  :C-u     (mykie:do-while "h" hs-hide-all "s" hs-show-all)

  "M-o"
  :default (yim-convert)
  :prog    (mykie :c-mode helm-gtags-select)

  "M-l"
  :default seqcmd-downcase-backward-word

  "M-n"
  :default    (tabbar-forward)
  :org-header (org-move-subtree-down)

  "M-p"
  :default    (tabbar-backward)
  :org-header (org-move-subtree-up)

  "M-q"
  :default     (message "M-q")
  :prog        quickrun
  :C-u&prog    (my/quickrun-dwim ask)
  :region&prog quickrun-region

  "M-r"
  :default helm-for-files

  "M-u"
  :default seqcmd-upcase-backward-word

  "M-x"
  :default helm-M-x
  :C-u! execute-extended-command ; for emergency

  "M-y" helm-show-kill-ring

  "M-z" Y/split-window-spirally

  "M-w"
  :default (if (bound-and-true-p cua--rectangle)
               (cua-copy-rectangle t)
             (eiji:search))
  :region  kill-ring-save
  :C-u     (eiji:search))

;; C-M- prefix ;;
;; C-M-a : begging-of-defun
;; C-M-e : end-of-defun
;; C-M-h : mark-defun
(mykie:set-keys global-map
  "C-M-g"
  :default grep
  :C-u     my/refactor
  "C-M-n" :default tabbar-forward
  "C-M-p" :default tabbar-backward)

;; M-g prefix ;;
;; (goto-map & windows.el prefix keymap) ;;
;; Note that windows.el uses a to z key to switch window(frame), so
;; do not override the a_to_z keymap.
(mykie:set-keys goto-map
  "1" e2wm:dp-code
  "2" e2wm:dp-two
  "3" e2wm:dp-doc
  "0" (if (e2wm:pst-get-instance)
          (e2wm:stop-management)
        (e2wm:start-management))
  "M-s" magit-status
  "M-c" (find-file "~/share/doc/study/2016spring")
  "M-h" my/toggle-hide-show
  "M-r" win-switch-menu
  "M-t" Y/visual-fill-mode
  ;; toggle-truncate-lines
  "M-g" win-toggle-window
  "M-k" mode-compile-kill
  "M-l" goto-line
  "M-i" loga-interactive-command
  "M-u" loga-lookup-at-manually
  "M-a" loga-add
  )

;; Arrow keys ;;
(mykie:set-keys global-map
  "<S-up>"       :default windmove-up
  "<S-down>"     :default windmove-down
  "<S-left>"     :default windmove-left
  "<S-right>"    :default windmove-right
  "<C-S-up>"     :default my/increase-opacity
  "<C-S-down>"   :default my/decrease-opacity)

;; SPACE key ;;
(mykie:set-keys nil
  "C-SPC"
  ;; check transient-mark-mode if the region can not select
  :default set-mark-command
  :C-u     bm-toggle
  ;;
  ;; TODO: implement function of smartchr.el
  "S-SPC" :default scroll-down-command
  )

;; Escape ;;
(mykie:set-keys esc-map
  "ESC" tibus-toggle)

(mykie:set-keys global-map
  "A-ESC" ESC-prefix)

;; Overridden keys ;;
(defvar my/overriding-mode-map (make-sparse-keymap))
(mykie:set-keys my/overriding-mode-map
  "<delete>"    follow-mode
  "<insert>"    my/toggle-opacity
  "<pause>"     scroll-other-window-down
  ;; "<backsclipboadpace>" something
  )

;; Load isearch configuration
(advice-add (global-key-binding (kbd "C-s")) :before
            (lambda () (require 'init_isearch)))

;; Bind Hyper key to jump over buffer.
(require 'xterm-keybinder)
(cl-loop for (c . C) in xterm-keybinder-key-pairs
         for char = (if (eq c ?\s) "SPC" (string c))
         for Char = (when C (if (eq c ?\s) "SPC" (downcase (string C))))
         if char
         do (global-set-key (kbd (format "H-%s" char)) 'avy-goto-char-by-input-event)
         if Char
         do (global-set-key (kbd (format "H-S-%s" Char)) 'avy-goto-char-by-input-event))

;; Mouse
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Mouse-Buttons.html
(mykie:set-keys nil
  "<mouse-1>" ; left click
  :default mouse-set-point
  :url     browse-url-at-point
  :file    find-file-at-point
  ;; [drag-mouse-1]
  ;; [double-mouse-1]
  ;; [drag-mouse-1] mouse-set-region
  ;; [down-mouse-1] mouse-drag-region
  ;; middle click
  [mouse-2] mouse-yank-primary
  ;; right click
  [mouse-3] mouse-save-then-kill)

;; Helm (C-x c prefix)
;;   C-x c 8 | helm-ucs (helm with mathematics symbol)
;;   C-x c a | helm-apropos
;;   C-x c b | helm-resume
;;   C-x c c | helm-colors
;;   C-x c e | helm-etags-select
;;   C-x c f | helm-multi-files
;;   C-x c F | helm-select-xfont
;;   C-x c i | helm-semantic-or-imenu
;;   C-x c I | helm-imenu-all-buffer
;;   C-x c t | helm-top
;;   C-x c p | helm-list-emacs-process
;;   C-x c r | helm-regex
;;   C-x c s | helm-surflaw
;;   C-x c h g | Info gnus
;;   C-x c h i | Info index elisp
;;   C-x c h r | Info index emacs <- why is the suffix r? should be e...

;; -- Emacs --
;; C-x r c  : clear rectangle
;; C-x r t  : string rectangle(replace)
;; C-x r o  : open-rectangle
;; C-x r d  : delete-rectangle
;; C-M-v    : scroll other window
;; C-M-S-v  : scroll other window

(provide 'init_mykie)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_mykie.el ends here
