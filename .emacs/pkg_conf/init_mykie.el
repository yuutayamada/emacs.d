;;; init_mykie.el --- init file for mykie.el

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
;; memo : http://www.linux-france.org/article/appli/emacs/manuel/html/key-bindings.html
;;; Code:

(require 'mykie)
(require 'my_autoload)
(require 'init_keyboard-converter)

;;;;;;;;;;;;;;;;;;;;
;; mykie.el setup ;;
;;;;;;;;;;;;;;;;;;;;
(setq mykie:use-major-mode-key-override 'both
      ;; mykie:use-fuzzy-order nil
      mykie:normal-conditions
      (append mykie:normal-conditions
              '((:error . (error-tip-error-p))
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
      mykie:major-mode-ignore-list '(magit-status-mode)
      mykie:minor-mode-ignore-list '())
(mykie:initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; self-insert-command keys ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(mykie:set-keys with-self-key
  ;; NOTE
  ;; number is NOT allow :C-u & :region&C-u keyword
  "1" :region sort-lines
  "2" :region (sort-lines ; sort-lines with reverse
               t (region-beginning) (region-end))
  "3" :region fill-region
  "4" :region align

  "a" :C-u anzu-query-replace-at-cursor-thing
  "c" :C-u (my/open-calendar)
  "f" :C-u! racer-find-definition
      :region (mykie:do-while "f" indent-rigidly
                              "u" undo)
  "g" :C-u! my/helm-gtags ; helm-gtags-dwim
      :region my/ginger-region
  "l" :C-u my/lookup
  "m" :C-u mew
  "r" :region rectangle-number-lines
  "t" :C-u (my/twit t)
  "u" :C-u (undo-tree-visualize)
  "w" :C-u (message "test this is w"))

;;;;;;;;;;;;;
;; C-[a-z] ;;
;;;;;;;;;;;;;
(mykie:set-keys nil ; nil means global-map

  "C-a"
  :default     (seq-home)
  :org-mode    (org-seq-home)
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
                            :C-u   helm-hooglel-by-context
                            :C-u*2 helm-ghc-browse-document)
             :go-mode (mykie
                       :C-u   helm-go
                       :C-u*2 helm-go-show-packages)
             :java-mode my/lookup-android-docs
             :ruby-mode helm-rb
             :lisp-mode slime-documentation-lookup)
  :C-u     (mykie
            :default (kill-whole-line)
            :nxml-mode my/lookup-android-docs)
  :region  comment-dwim

  "C-e"
  :default    (seq-end)
  :org-mode   (org-seq-end)
  :C-u        eww
  :C-u*2      (evil-mode)
  :region&C-u align

  "C-f"
  :default    forward-char
  :skk-on     skk-b-move-henkan-point-fwd
  :skk-active skk-b-move-henkan-point-fwd
  :C-u&prog (mykie
             :haskell-mode
             (mykie
              :C-u*2 haskell-commander-from-buffer
              t haskell-commander))
  :C-u (mykie
        :C-u*2 (my/copy-current-file-name)
        t (forward-char 1))
  ;; :region (mykie:do-while
  ;;          "l" my/region-extender
  ;;          "h" (my/region-extender "b")
  ;;          "j" (my/region-extender "n")
  ;;          "k" (my/region-extender "p"))
  :C-u&url    (browse-url-firefox mykie:current-thing)

  "C-h"
  :default delete-backward-char
  :ido     ido-delete-backward-updir
  :C-u     helm-descbinds
  :C-u*2   switch-to-haskell

  "C-j"
  :default        my/newline-and-indent
  :skk-active     (skk-kakutei)
  :skk-on         (skk-kakutei)
  :C-u&url        (browse-url-at-point)
  :email          (message mykie:current-thing)
  :mew-draft-mode newline-and-indent
  :C-u&eolp       (cl-case major-mode
                    (org-mode (my/org-capitalize-header-string))
                    (t (my/fill-current-line)))
  :region         mc/edit-lines
  :region&C-u     mc/mark-all-in-region

  "C-k"
  :default    (my/kill-line)
  :haskell-mode kill-line
  :grep-mode  kill-this-buffer
  :skk-active (yim-convert-to-katakana)
  :skk-on     (backward-char)
  :C-u        paredit-kill

  "C-l"
  :default        (recenter-top-bottom)
  :skk-active     (yim-convert-to-katakana)
  :skk-on         (forward-char)
  :C-u (mykie
        :org-src  (my/org-dwim)
        :org-mode (my/org-dwim)
        :error  (mykie:do-while
                 "n" (error-tip-cycle-dwim)
                 "p" (error-tip-cycle-dwim-reverse)
                 "g" (error-tip-delete-popup))
        :scala-mode my/ensime-goto-next-error
        t anzu-query-replace-regexp)
  :C-u*2          (mykie :C-u! helm-github-issues)
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
  :default (other-window-or-split)
  :C-u (mykie
        :java-mode javadoc-lookup
        :clojure-mode clojure-cheatsheet
        :default helm-c-apropos)
  :C-u*2 (my/reset-bg-color (read-from-minibuffer "bg color: "))

  "C-p"
  :default    previous-line
  :skk-on     skk-b-change-candidate-previous
  :skk-active skk-b-change-candidate-previous
  :C-u        popwin:popup-last-buffer

  "C-q"
  :default quoted-insert
  :grep-mode kill-this-buffer

  "C-r"
  :default helm-recentf
  :git-commit-mode helm-ag-r-git-logs
  :C-u     helm-ghq

  "C-s"
  :default isearch-forward
  :git-commit-mode-map helm-ag-r-git-logs
  :C-u!    ace-jump-mode
  :C-u*2   (helm-ag-r-current-file)

  "C-t"
  :default transpose-chars
  :repeat  (my/google-translate
            (read-string "google-translate: " (word-at-point)))
  :C-u*2   (cl-case major-mode
             (eshell-mode (delete-window))
             (t (eshell)))
  :C-u     (my/google-translate (word-at-point))
  :region  (my/google-translate mykie:region-str)

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

  "C-z" :default (require 'init_windows)

  "C--" :default text-scale-decrease
  "C->" :default win-next-window
  "C-<" :default win-prev-window

  "C-0" :default my/helm-lookup-history
  "C-3" :default my/toggle-show-hide

  "C-4" :default helm-show-mykie-keywords

  "C-8" :default (cider-turn-on-eldoc-mode))

;;;;;;;;;;;;;;;;;;;;;;;
;; SUPER KEY BINDING ;;
;;;;;;;;;;;;;;;;;;;;;;;
(mykie:set-keys global-map
  "s-s" t win-switch-menu)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RESTRACTED KEYBINDS                 ;;
;; Below keys Can not uses at terminal ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(mykie:set-keys nil
  "C-S-d" :default  doctor
  "C-S-g" :default  ger
  "C-S-m" :default  mew
  "C-S-n" :default  global-linum-mode
  "C-S-o" :default  remember
  "C-S-t" :default  twit
  "C-S-w" :default  w3m
  "C-S-h" :default  helm-descbinds

  "C-;"
  :region  (if buffer-read-only
               (helm-resume current-prefix-arg)
             (comment-dwim current-prefix-arg))
  :C-u     (cl-case major-mode
             (eshell-mode (delete-window))
             (t (eshell)))
  :default (helm-resume current-prefix-arg)
  :clone ";"

  ;; "C-."
  ;; :default

  "C-,"
  :default eiji:search)

;;;;;;;;;;;;;;;;;;;;
;; C-c prefix map ;;
;;;;;;;;;;;;;;;;;;;;
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
  :prog (mykie
         :default               my/quickrun-dwim
         :org-src               my/run-prog-from-tempfile
         :coffee-mode           node-console
         :go-mode               (if (Y/go-mode-deploy-android-app)
                                    (my/quickrun-dwim))
         :haskell-mode          my/runghc
         :ruby-mode             xmp
         :emacs-lisp-mode       lispxmp
         :lisp-interaction-mode lispxmp
         :scala-mode            my/execute-from-current-file)

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
  :default pane-toggle-window-structure

  "C-c m" :default  goto-line)

;;;;;;;;;;;;;;;;
;; C-x keymap ;;
;;;;;;;;;;;;;;;;
;; Control x map(for other keymap testing)
(mykie:set-keys ctl-x-map
  "C" t save-buffers-kill-emacs)

(mykie:set-keys global-map
  "C-x C-c"
  :default save-buffers-kill-terminal ; or delete frame?
  :C-u     save-buffers-kill-emacs
  "C-x j"
  :default my/open-junk-today
  :C-u     open-junk-file)

;;;;;;;;;;
;; f0-9 ;;
;;;;;;;;;;
(mykie:set-keys global-map
  "<f1>"         :default winner-undo
  "<f2>"         :default winner-redo
  "S-<f1>"       :default my/load-color-theme
  "<f5>"         :default my/revert-buffer
  "<f7>"         :default point-undo
  "S-<f7>"       :default point-redo
  "<f8>"         :default goto-last-change
  "S-<f8>"       :default goto-last-change-reverse
  "<f9>"         :default my/toggle-opacity
  "<f10>"        :default my/festival-read-buffer
  "S-<f10>"      :default my/load-color-theme
  "<f11>"        :default my/open-calendar
  "<f12>"        :default helm-skk-rules
  "S-<f12>"      :default my/screen-shot)

;;;;;;;;;;
;; TABS ;;
;;;;;;;;;;
(mykie:set-keys nil
  "TAB"
  ;; :hs-hidden hs-show-block ;; fix this error occured
  :markdown-header markdown-cycle
  :default indent-for-tab-command
  :repeat yas-expand
  "S-TAB"       :default my/insert ; C-S-TAB
  "M-TAB"       :default auto-complete
  [(C-tab)]     :default fold-dwim-toggle
  [(backtab)]   :default my/toggle-opacity
  [(super tab)] :default pcomplete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NON ALPHABETICAL CHARACTER ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(mykie:set-keys nil
  "M-;"  t comment-dwim
  "M-["  t bm-next
  "M-]"  t bm-previous
  "C-\]" t my/grammar-check
  "C-\\" t mozc-mode ; toggle-input-method ;my/festival
  "C-/"
  :default helm-swoop
  :C-u!    helm-multi-swoop
  "C-*"  t undo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TRANSLATE KEYS TO USE SAME POSITION ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(apply
 `((lambda ()
     (mykie:set-keys nil
       ;; C-=
       ,(concat "C-" (keyboard-converter-find "^"))
       :default helm-c-apropos
       :C-u     helm-colors
       ;; C-:
       ,(concat "C-" (keyboard-converter-find "+"))
       :default text-scale-increase
       ;; C-'
       ,(concat "C-" (keyboard-converter-find ":"))
       :default loga-lookup-in-popup
       :region comment-box
       ;; C-+
       ,(concat "C-" (keyboard-converter-find "~"))
       :default show-cheat-sheet))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Japanese keyboard only ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(mykie:set-keys nil
  [(henkan)]
  :default           (yim-convert)
  :C-u               skk-j-mode-on
  :gnus-summary-mode (my/lookup-by-ace-jump)

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

;;;;;;;;;;;;;
;; RET key ;;
;;;;;;;;;;;;;
(mykie:set-keys nil
  "C-m"
  :org-mode (org-return)
  :default  (newline)
  :C-u      (mykie:do-while "m" my/replicate-current-line)

  "M-RET"        :default my/multi-term-current-buffer
  "<C-return>"   :default cua-set-rectangle-mark
  "<C-M-return>" :default my/multi-term)

;;;;;;;;;;;;;;;
;; M- prefix ;;
;;;;;;;;;;;;;;;
(mykie:set-keys nil
  "M-c"
  :default seq-capitalize-backward-word
  "M-h"
  :default mark-paragraph
  :C-u     (mykie:do-while "h" hs-hide-all
                           "s" hs-show-all)
  "M-o"
  :default (yim-convert)
  :prog    (mykie :c-mode helm-gtags-select)

  "M-j"
  :default yim-convert
  ;; :comment mozc-mode
  :prog    (mykie :go-mode godef-jump)

  "M-l"
  :default seq-downcase-backward-word

  "M-n"
  :default    (tabbar-forward)
  :org-header (org-move-subtree-down)

  "M-p"
  :default    (tabbar-backward)
  :org-header (org-move-subtree-up)

  "M-q"
  :default     (message "M-q")
  :prog        (my/quickrun-dwim)
  :C-u&prog    (my/quickrun-dwim ask)
  :region&prog quickrun-region

  "M-r"
  :default helm-for-files

  "M-u"
  :default seq-upcase-backward-word

  "M-x"
  :default  helm-M-x

  "M-y"
  :default  helm-show-kill-ring

  "M-z"
  :default  my/toggle-outline

  "M-w"
  :default (if (bound-and-true-p cua--rectangle)
               (cua-copy-rectangle t)
             (eiji:search))
  :region  kill-ring-save
  :C-u     (eiji:search))

;;;;;;;;;;;;;;;;;
;; C-M- prefix ;;
;;;;;;;;;;;;;;;;;
(mykie:set-keys global-map
  "C-M-g" :default grep
          :C-u     my/refactor
  "C-M-h" :default howm-menu
  "C-M-j" :default my/load-mc-init-file
  "C-M-n" :default tabbar-forward
  "C-M-p" :default tabbar-backward)

;;;;;;;;;;;;;;;;
;; M-g prefix ;;
;; (goto-map) ;;
;;;;;;;;;;;;;;;;
(mykie:set-keys nil
  "M-g s"   :default magit-status
  "M-g M-s" :default magit-status
  "M-g M-h" :default my/toggle-hide-show
  "M-g M-r" :default remember
  "M-g M-t" :default toggle-truncate-lines
  "M-g M-g"
  :default mode-compile
  :coffee-mode coffee-compile-file
  "M-g M-k" :default mode-compile-kill
  "M-g M-i" :default loga-interactive-command
  "M-g M-u" :default loga-lookup-at-manually
  "M-g M-a" :default loga-add
  )

;;;;;;;;;;;;;;;;
;; Arrow keys ;;
;;;;;;;;;;;;;;;;
(mykie:set-keys global-map
  "<S-up>"       :default windmove-up
  "<S-down>"     :default windmove-down
  "<S-left>"     :default windmove-left
  "<S-right>"    :default windmove-right
  "<C-S-up>"     :default my/increase-opacity
  "<C-S-down>"   :default my/decrease-opacity)

;;;;;;;;;;;;;;;
;; SPACE key ;;
;;;;;;;;;;;;;;;
(mykie:set-keys nil
  "C-SPC"
  :default set-mark-command
  :C-u     bm-toggle
  ;; TODO: implement function of smartchr.el
  ;; "S-SPC" :default scroll-down-command
  )

;;;;;;;;;;;;;;
;; TOY FUNC ;;
;;;;;;;;;;;;;;
(defun mykie:vi-faker ()
  (interactive)
  (let
      ((scroll (lambda (direction)
                 (condition-case err
                     (cl-case direction
                       (next     (call-interactively 'next-line))
                       (previous (call-interactively 'previous-line))
                       (up       (scroll-up-command))
                       (down     (scroll-down-command)))
                   (error err)))))
    (mykie:loop
     ;; show hide
     "H" hs-hide-all
     "S" hs-show-all
     ;; vi style
     "h" backward-char
     "j" (funcall scroll 'next)
     "k" (funcall scroll 'previous)
     "l" forward-char
     ;; less
     "f" (funcall scroll 'up)
     "b" (funcall scroll 'down)
     ;; ace-jump
     "s" (return (call-interactively 'ace-jump-mode)))))

;; Overridden keys
(defvar my/overriding-mode-map (make-sparse-keymap))
(mykie:set-keys my/overriding-mode-map
  "<delete>"    :default follow-mode
  "<insert>"    :default my/toggle-opacity
  "<pause>"     :default scroll-other-window-down
  "<backspace>" :default my/toggle-flyspell)

;; Override helm-map to use DDSKK's function
(add-hook 'helm-before-initialize-hook
          '(lambda ()
             (mykie:attach-mykie-func-to 'helm)))

(provide 'init_mykie)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_mykie.el ends here
