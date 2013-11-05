;;; my_autoload.el --- autoload definitions

;;; Commentary:

;;; Code:
(require 'my_util)

(require 'vars)

;; Load files with `with-eval-after-load' func from `package-conf-dir'.
(condition-case err
    (my/add-after-load-files "init_" package-conf-dir)
  (error err))

;; TODO: Load from file
(autoloader-autoloads
 ;; Set pair of file name and function's list
 ;; auto-capitalize(Note I'm using emacswiki's auto-capitalize)
 ;; A
 ("auto-complete"
  auto-complete ac-set-trigger-key
  my/ac-add-sources-for-prog ac-flyspell-workaround
  auto-complete-mode global-auto-complete-mode)
 ("auto-async-byte-compile"
  auto-async-byte-compile auto-async-byte-compile-mode
  enable-auto-async-byte-compile-mode)
 ("android-mode" android-create-project)
 ("anzu"
  anzu-query-replace anzu-query-replace-regexp
  anzu-query-replace-at-cursor-thing)
 ("aggressive-indent" aggressive-indent-mode)
 ("actionscript-mode" actionscript-mode)
 ("ace-jump-mode" ace-jump-mode ace-jump-do)
 ;; B
 ("buffer-move" buf-move-left buf-move-right buf-move-up buf-move-down)
 ("bpe" bpe:post-article)
 ("bm" bm-toggle my/ispell-word-or-kill-region)
 ;; C
 ("capitalizer" capitalizer-mode capitalizer-comment-or-string-p)
 ("calfw" cfw:howm-schedule-inline calendar-date-string
  my/open-calendar exit-calendar calendar-cursor-to-date)
 ("company" company-mode)
 ("calendar" calendar-exit)
 ("comint" comint-send-string)
 ("css-eldoc" turn-on-css-eldoc)
 ("c-eldoc" c-turn-on-eldoc-mode)
 ("cc-mode" c-toggle-auto-newline c-toggle-hungry-state)
 ("ccc" update-buffer-local-frame-params)
 ("clojure-cheatsheet" clojure-cheatsheet)
 ("cider" cider-mode cider-turn-on-eldoc-mode)
 ("cua-base" cua-set-rectangle-mark cua-rectangle cua-cut-rectangle)
 ("lips-mode" common-lisp-mode lisp-mode)
 ("coffee-mode" coffee-mode)
 ("clojure-mode" clojure-mode)
 ;; D
 ("diff-mode" diff-mode my/apply-diff-face diff-refine-hunk)
 ("dockerfile-mode" dockerfile-mode)
 ;; E
 ("eclim-tip" eclim-tip-cycle eclim-tip-cycle-reverse)
 ("evil-numbers" evil-numbers/inc-at-pt)
 ("ensime" ensime)
 ("erc" start-irc)
 ("el-get"
  el-get-package-exists-p el-get-install el-get-list-packages el-get-update
  el-get-remove)
 ("eclim"
  eclim-mode eclim--project-name global-eclim-mode my/boot-eclim
  ac-emacs-eclim-config)
 ("evil" evil-mode evil-normal-state my/evil-inject-hjkl-keybinds+
  evil-normal-state-p evil-insert-state evil-emacs-state)
 ("eww-lnum" eww-lnum-follow eww-lnum-universal)
 ;; F
 ("flymake-json" flymake-json-maybe-load)
 ("flycheck-tip" flycheck-tip-cycle)
 ("flymake-shell" flymake-shell-load)
 ("fold_dwim" fold-dwim-toggle fold-dwim-show-all fold-dwim-hide-all)
 ("my_font" my/set-combined-font)
 ("flycheck" flycheck-mode error-tip-error-p)
 ("festival"
  festival-start festival-stop festival-say
  festivalp my/festival my/festival-read-buffer)
 ("flymake" flymake-mode)
 ("flyspell"
  turn-on-flyspell flyspell-mode-on my/toggle-flyspell
  flyspell-generic-progmode-verify)
 ;; G
 ;; grep was moved to my_builtin-configs.el
 ("ghc" ; Make sure ~/.cabel/share/ghc-mode-*/ and do compiling
  ghc-init ghc-select-completion-symbol ghc-resolve-package-name)
 ("ace-mode" ace-mode)
 ("go-eldoc" go-eldoc-setup)
 ("git-gutter" git-gutter-mode git-gutter:next-hunk git-gutter:previous-hunk)
 ("git-messenger" git-messenger:popup-message)
 ("git-blame" git-blame-mode)
 ("goto-chg" goto-last-change goto-last-change-reverse)
 ("ggtags" ggtags-mode)
 ("google-translate" my/google-translate)
 ("go-mode" go-mode gofmt gofmt-before-save)
 ("ger" ger ger-fetch)
 ("grammar" grammar-mode grammar-check my/grammar-check)
 ("google-contacts" google-contacts-update-bbdb)
 ("ginger-api" my/ginger-region ginger-rephrase)
 ;; H
 ("haskell-mode" haskell-mode switch-to-haskell haskell-commnader)
 ("helm-swoop" helm-swoop helm-multi-swoop)
 ("helm-ag" helm-ag)
 ("helm-ag-r"
  helm-ag-r helm-ag-r-current-file helm-ag-r-from-git-repo
  helm-ag-r-google-contacts-list helm-ag-r-pype
  helm-ag-r-shell-history helm-ag-r-git-logs)
 ("helm-ghq" helm-ghq)
 ("helm-descbinds" helm-descbinds)
 ("helm-utils" helm-find-file-as-root)
 ("helm-command" helm-M-x)
 ("helm-files" helm-for-files)
 ("helm-ring" helm-show-kill-ring)
 ("helm-shell-history" helm-shell-history)
 ("helm-commit-message" helm-show-git-commit-messages)
 ("helm-gtags" helm-gtags-select my/helm-gtags)
 ("helm-shell-history" helm-complete-shell-history)
 ("helm-rb" helm-rb)
 ("helm-go" helm-go helm-go-update-doc)
 ("helm-github-issues" helm-github-issues)
 ("helm-c-yasnippet"
  helm-c-yas-complete helm-c-yas-visit-snippet-file
  helm-c-yas-create-snippet-on-region)
 ("highlight-indentation" highlight-indentation-current-column-mode)
 ("howm" howm-menu)
 ("hangman" hangman)
 ("hideshow" hs-show-block hs-already-hidden-p hs-show-all hs-hide-all)
 ;; I
 ("inf-ruby" inf-ruby inf-ruby-setup-keybindings)
 ;; J
 ("jade" sws-mode jade-mode)
 ("javadoc-lookup" javadoc-lookup)
 ("js2-mode" js2-mode)
 ("js-console" js-console)
 ("jsfmt" jsfmt-before-save jsfmt)
 ;; ;; K
 ;; ("keychord" key-chord-define key-chord-define-global)
 ("keyboard-converter" keyboard-converter-find)
 ;; L
 ("lingr" lingr-login)
 ("lispxmp" lispxmp)
 ("logalimacs"
  eiji:search
  loga-lookup-in-buffer loga-lookup-in-buffer-light loga-lookup-in-popup
  loga-fallback loga-decide-source-word my/search-pronunciation)
 ("lookup"
  my/lookup lookup-pattern lookup my/lookup-by-ace-jump
  my/helm-lookup-history myhistory-save-search-history
  myhistory-save-remembered-history)
 ("lua-mode" lua-mode)
 ;; M
 ("magit" magit-status my/magit-status magit-get-top-dir magit-rebase-info
  magit-anything-modified-p magit-no-commit-p)
 ("markdown-mode"    markdown-mode markdown-cycle)
 ;; need before load
 ("mew"              mew mew-send)
 ("multiple-cursors" my/load-mc-init-file)
 ("mode-compile"     mode-compile mode-compile-kill)
 ("masaw" masaw masaw-mode)
 ("mykie"
  mykie:loop mykie:do-while mykie:set-keys mykie mykie:attach-mykie-func-to)
 ("multi-term"
  my/multi-term my/multi-term-current-buffer multi-term)
 ("mozc" mozc-mode)
 ("my_util" my/defconst my/load-packages my/after-load-function)
 ("my_basic-keybinds"     my/set-keybinds my/set-basic-keys)
 ("myanything-c-pdfgrep" my/anything-pdfgrep)
 ("my_function"
  Y-init-prog-style
  my/ssh-add my/file-exists-p my/execute-from-current-file
  other-window-or-split my/newline-and-indent
  my/get-aspell-capital-words my/screen-shot my/remap-semicolon
  my/org-src-code-buffer-p my/in-dir-p
  my/get-above-dir-name my/define-prefix-key
  my/reset-bg-color
  my/copy-current-file-name my/festival my/kill-backward-word my/kill-line)
 ("my_sdic" sdic-describe-word-at-point sdic)
 ("minor-mode-hack"
  show-minor-mode-map-priority lower-minor-mode-map-alist
  raise-minor-mode-map-alist)
 ;; N
 ("navi2ch" navi2ch)
 ;; R
 ("rainbow-delimiters" rainbow-delimiters-mode)
 ("ruby-electric" ruby-electric-mode)
 ("rubydb3x" rubydb)
 ("rust-mode" rust-mode)
 ;; O
 ("org-trello" org-trello-mode)
 ("open-junk-file" open-junk-file my/open-junk-today)
 ("outline" my/hs-hide-all)
 ("org"
  org-mode org-src-edit-buffer-p org-return-indent my/org-dwim
  org-in-src-block-p org-table-p)
 ("org-mobile" my/org-mobile-dwim org-mobile-dir-p)
 ;; P
 ("paren" show-paren-mode)
 ("pane" pane-toggle-window-structure)
 ("paredit" paredit-kill paredit-mode)
 ("po-mode" po-mode)
 ("popwin" popwin:popup-buffer popwin:find-file)
 ("package"
  package-list-packages-no-fetch list-packages package-list-packages)
 ("point-undo" point-undo point-redo)
 ("popup" popup-tip)
 ;; add this autoload function to avoid a warning
 ("powerline" powerline-default-theme my/change-powerline-color)
 ;; Q
 ("quickrun"
  quickrun quickrun-with-arg quickrun-region my/quickrun-dwim)
 ;; S
 ("savehist" savehist-mode)
 ("stem" stem:stripping-suffix stem:stripping-inflection stem-english)
 ("smartrep" smartrep-define-key)
 ("sequential-command-config"
  seq-home seq-end org-seq-home org-seq-end seq-upcase-backward-word
  seq-capitalize-backward-word seq-downcase-backward-word)
 ("sbtp"
  sbtp-begging-of-line sbtp-console-send sbtp-console-send-line
  sbtp-console-send-current-page)
 ("smartparens" turn-on-smartparens-mode)
 ("scala-mode" my/ensime-goto-next-error scala-mode)
 ("smart-tabs-mode"
  smart-tabs-mode smart-tabs-mode-enable smart-tabs-mode-advice
  smart-tabs-insinuate)
 ("s" s-chomp)
 ("skype" skype)
 ("skk-server" skk-server-live-p my/boot-skk-server)
 ("skk-macs" skk-erase-prefix)
 ("sql" sql-set-product)
 ("slime" slime slime-connect slime-connected-p slime-mode)
 ;; T
 ("tabbar" tabbar-forward tabbar-backward)
 ("twittering-mode" twit my/twit)
 ("thingatpt" word-at-point)
 ("text-translator" text-translator-all-by-auto-selection)
 ;; V
 ("vc-git" vc-git-mode-line-string vc-git-branches vc-git-conflicted-files
  vc-git-root)
 ;; W
 ("web-mode" web-mode)
 ("w3m"
  w3m my/w3m-search browse-url-interactive-arg w3m-minor-mode w3m-browse-url
  w3m-find-file)
 ("w3m-search" w3m-search)
 ("whitespace"
  my/set-truncate-notification-locally my/whitespace-mode)
 ("windmove"
  windmove-up windmove-down windmove-left windmove-right)
 ("winner" winner-undo winner-redo)
 ("which-func" which-function-mode)
 ;; X
 ("xclip" turn-on-xclip) ; To copy from terminal Emacs
 ;; Y
 ("yaml-mode" yaml-mode)
 ("yasnippet"
  yas/new-snippet yas-new-snippet yas/visit-snippet-file yas-visit-snippet-file
  yas-global-mode yas/find-snippets yas-find-snippets yas/expand
  yas-expand yas-describe-tables yas-expand-from-trigger-key
  my/yas-set-trigger-key)
 ("yim"
  yim-convert yim-abbrev skk-current-input-mode
  helm-skk-rules skk-j-mode-on my-skk-toggle-j-mode-and-latin-mode)
 ;; Z
 ("zencoding" my/zencoding-expand)
 ;; below packages need specification of INIT
 ("init_flymake-java" my/get-java-lint-options)
 ("init_xmp" xmp)
 ("init_windows"
  win-switch-menu resume-windows win-switch-to-window
  my/define-windows-prefix-key))

(require 'helm-config) ; helm-config loads autoload files

(provide 'my_autoload)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_autoload.el ends here
