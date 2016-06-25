;;; yy-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "Y/Y-autoload" "Y/Y-autoload.el" (0 0 0 0))
;;; Generated autoloads from Y/Y-autoload.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-autoload" '(#("Y/autoload-files" 0 16 (face font-lock-variable-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "Y/Y-el-get" "Y/Y-el-get.el" (0 0 0 0))
;;; Generated autoloads from Y/Y-el-get.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-el-get" '(#("el-get-u" 0 8 (fontified nil face font-lock-function-name-face)) #("Y/el-get-npm-install-maybe" 0 26 (face font-lock-function-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "Y/Y-elisp-mode" "Y/Y-elisp-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from Y/Y-elisp-mode.el

(defsubst Y-init-elisp-config nil "\
Setup my Emacs Lisp config.
This function is called from site-start.el." (el-get (quote sync) (quote (auto-compile paredit rainbow-mode))) (paredit-mode 1) (require (quote auto-compile)) (when (fboundp (quote electric-indent-local-mode)) (electric-quote-local-mode t)) (when (and (stringp buffer-file-name) (string-match custom-theme-directory (file-name-directory buffer-file-name))) (rainbow-mode t)))

;;;***

;;;### (autoloads nil "Y/Y-font" "Y/Y-font.el" (0 0 0 0))
;;; Generated autoloads from Y/Y-font.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-font" '("my/parse-xlfd-font-style" "Y/init-fontset")))

;;;***

;;;### (autoloads nil "Y/Y-function" "Y/Y-function.el" (0 0 0 0))
;;; Generated autoloads from Y/Y-function.el

(autoload 'other-window-or-split "Y/Y-function" "\
Move buffer or split when buffer was one.

\(fn &rest R)" t nil)

(autoload 'Y/split-window-spirally "Y/Y-function" "\


\(fn)" t nil)

(autoload 'Y/reverse-transpose-chars "Y/Y-function" "\


\(fn)" t nil)

(autoload 'Y/swap-key "Y/Y-function" "\


\(fn KEYMAP &rest KEYS)" nil nil)

(autoload 'Y/org-src-block-p "Y/Y-function" "\
Return t when inside #+begin_src ... .

\(fn)" nil nil)

(autoload 'Y/org-src-edit-buffer-p "Y/Y-function" "\
Return t when created other inside *Org Src ...* buffer.

\(fn)" nil nil)

(autoload 'my/kill-line "Y/Y-function" "\


\(fn)" nil nil)

(autoload 'my/screen-shot "Y/Y-function" "\


\(fn)" t nil)

(autoload 'my/remap-semicolon "Y/Y-function" "\
Reverse Colon and Semi Colon at specified key MAP.

\(fn MAP)" nil nil)

(autoload 'my/ssh-add "Y/Y-function" "\
Add ssh-key if it was needed when using magit. You may neeed ssh-askpath.

Example of my/keys
 (\"git@github.com\\|https://github.com\" . \"~/.ssh/rsa_github_key\")

\(fn)" t nil)

(autoload 'Y/show-cheat-sheet "Y/Y-function" "\
Popup a buffer by popwin which is related to current ‘major-mode’.

\(fn)" t nil)

(autoload 'my/get-above-dir-name "Y/Y-function" "\


\(fn)" nil nil)

(autoload 'my/in-dir-p "Y/Y-function" "\


\(fn DIRECTORY)" nil nil)

(autoload 'my/execute-from-current-file "Y/Y-function" "\


\(fn &optional STATEMENT)" t nil)

(autoload 'my/copy-current-file-name "Y/Y-function" "\


\(fn)" t nil)

(autoload 'my/kill-backward-word "Y/Y-function" "\


\(fn)" nil nil)

(autoload 'my/newline-and-indent "Y/Y-function" "\
My better newline and indent.

\(fn)" t nil)

(autoload 'my/reset-bg-color "Y/Y-function" "\


\(fn &optional COLOR)" t nil)

(autoload 'Y/eval-and-replace "Y/Y-function" "\
Eval and replace.
This function distinguishes parenthesis and symbol accordingly.

\(fn)" t nil)

(autoload 'Y/echo-current-point "Y/Y-function" "\


\(fn)" t nil)

(autoload 'Y/toggle-truncate-lines "Y/Y-function" "\
My toggle truncate lines.

\(fn)" t nil)

(autoload 'Y/lookup-stardict "Y/Y-function" "\
Lookup word by stardict.

\(fn)" t nil)

(autoload 'Y/visual-fill-mode "Y/Y-function" "\
Show filled sentences by visual line mode.
If ARG is non-nil, turn on visual mode stuff.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-function" '(#("test" 0 4 (fontified nil face font-lock-function-name-face)) #("my/" 0 3 (fontified nil)) #("Y/" 0 2 (fontified nil face font-lock-variable-name-face)) #("banish" 0 6 (face font-lock-function-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "Y/Y-modeline" "Y/Y-modeline.el" (0 0 0 0))
;;; Generated autoloads from Y/Y-modeline.el

(autoload 'Y/update-mode-line-bg "Y/Y-modeline" "\
Update mode line background color.

\(fn &rest R)" nil nil)

(autoload 'Y/clean-mode-line "Y/Y-modeline" "\
Use specified abbreviation of mode-line-name by `mode-line-cleaner-alist'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-modeline" '(#("mode-line-cleaner-alist" 0 23 (face font-lock-variable-name-face fontified t)) #("Y/" 0 2 (fontified nil face font-lock-function-name-face)))))

;;;***

;;;### (autoloads nil "Y/Y-paths" "Y/Y-paths.el" (0 0 0 0))
;;; Generated autoloads from Y/Y-paths.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-paths" '("config-dir" "user-init-file")))

;;;***

;;;### (autoloads nil "Y/Y-premitives" "Y/Y-premitives.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from Y/Y-premitives.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-premitives" '("ido-" "Y/original-cut-and-paste" "remember-notes-initial-major-mode" "recentf-max-")))

;;;***

;;;### (autoloads nil "Y/Y-util" "Y/Y-util.el" (0 0 0 0))
;;; Generated autoloads from Y/Y-util.el

(autoload 'Y/load-packages "Y/Y-util" "\
Load PACKAGES.

\(fn PACKAGES)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-util" '("Y/" "message-startup-time" "autoloader-autoload")))

;;;***

;;;### (autoloads nil "builtin/init_auth-source" "builtin/init_auth-source.el"
;;;;;;  (22104 57664 305180 446000))
;;; Generated autoloads from builtin/init_auth-source.el

(autoload 'Y/get-auth-info "builtin/init_auth-source" "\
Get auth info.

\(fn MACHINE &rest KEYWORDS)" nil nil)

;;;***

;;;### (autoloads nil "builtin/init_autoload" "builtin/init_autoload.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_autoload.el

(autoload 'Y/make-autoload-files "builtin/init_autoload" "\
Make autoload files from elisp directory.
FILES should put a place where is located to elisp directory.

\(fn &optional FILES)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_autoload" '(#("Y/update-autoloads" 0 18 (face font-lock-function-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "builtin/init_calendar" "builtin/init_calendar.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_calendar.el

(autoload 'Y/insert-day "builtin/init_calendar" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "builtin/init_erc" "builtin/init_erc.el" t)
;;; Generated autoloads from builtin/init_erc.el

(autoload 'Y/erc-start-irc "builtin/init_erc" "\
Connect to IRC.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "builtin/init_filecache" "builtin/init_filecache.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_filecache.el

(autoload 'Y/filecache-ido-find-file "builtin/init_filecache" "\
My file cache find-file.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_filecache" '(#("Y/ghq-root" 0 10 (face font-lock-variable-name-face fontified nil)) #("my/filecache-directories" 0 24 (face font-lock-variable-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "builtin/init_flyspell" "builtin/init_flyspell.el"
;;;;;;  (21916 11116 437635 966000))
;;; Generated autoloads from builtin/init_flyspell.el

(defconst flyspell-mode-map 'nil)

;;;***

;;;### (autoloads nil "builtin/init_gnus" "builtin/init_gnus.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_gnus.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_gnus" '(#("my/gnus-" 0 8 (fontified nil)) #("nntp-authinfo-file" 0 18 (face font-lock-variable-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "builtin/init_grep" "builtin/init_grep.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_grep.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_grep" '("grep-" "Y/grep-jump-to-file")))

;;;***

;;;### (autoloads nil "builtin/init_iso-transl" "builtin/init_iso-transl.el"
;;;;;;  (21800 29160 432617 523000))
;;; Generated autoloads from builtin/init_iso-transl.el

(autoload 'Y/iso-transl-toggle-minor-mode "builtin/init_iso-transl" "\
Toggle `iso-transl-ctl-x-8-map' keybinds.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "builtin/init_package" "builtin/init_package.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_package.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_package" '("package-archives")))

;;;***

;;;### (autoloads nil "builtin/init_smerge-mode" "builtin/init_smerge-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_smerge-mode.el

(autoload 'Y/smerge-mode-keep-at-point "builtin/init_smerge-mode" "\
Treat merging at point by smerge way.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "depend/depend_windows" "depend/depend_windows.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from depend/depend_windows.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "depend/depend_windows" '(#("my-window-change-char" 0 21 (face font-lock-variable-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_auto-complete-c-headers" "pkg_conf/init_auto-complete-c-headers.el"
;;;;;;  (21916 11116 813648 453000))
;;; Generated autoloads from pkg_conf/init_auto-complete-c-headers.el

(autoload 'Y/ac-c-headers-init "pkg_conf/init_auto-complete-c-headers" "\
Add ac-c-headers source to auto-complete source.

\(fn)" nil nil)

(add-hook 'c++-mode-hook 'Y/ac-c-headers-init)

(add-hook 'c-mode-hook 'Y/ac-c-headers-init)

;;;***

;;;### (autoloads nil "pkg_conf/init_avy" "pkg_conf/init_avy.el"
;;;;;;  (22088 53798 696454 151000))
;;; Generated autoloads from pkg_conf/init_avy.el

(autoload 'avy-goto-char-by-input-event "pkg_conf/init_avy" "\
Goto char with avy and move to ‘last-input-event’s char.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_crontab-mode" "pkg_conf/init_crontab-mode.el"
;;;;;;  (21953 19901 709416 912000))
;;; Generated autoloads from pkg_conf/init_crontab-mode.el

(add-to-list 'auto-mode-alist (cons "\\(\\.cron\\(tab\\)?\\|cron\\(tab\\)?\\.?\\)\\'" 'crontab-mode))

;;;***

;;;### (autoloads nil "pkg_conf/init_ensime" "pkg_conf/init_ensime.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_ensime.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_ensime" '("my/ensime-")))

;;;***

;;;### (autoloads nil "pkg_conf/init_festival" "pkg_conf/init_festival.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_festival.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_festival" '(#("my/festival" 0 11 (face font-lock-function-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_ginger-api" "pkg_conf/init_ginger-api.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_ginger-api.el

(autoload 'my/ginger-region "pkg_conf/init_ginger-api" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_go-mode" "pkg_conf/init_go-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_go-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_go-mode" '(#("Y/go-mode-deploy-android-app" 0 28 (face font-lock-function-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_google-c-style" "pkg_conf/init_google-c-style.el"
;;;;;;  (21916 11116 257629 988000))
;;; Generated autoloads from pkg_conf/init_google-c-style.el

(add-hook 'c-mode-common-hook 'google-set-c-style)

;;;***

;;;### (autoloads nil "pkg_conf/init_haskell-mode" "pkg_conf/init_haskell-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_haskell-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_haskell-mode" '(#("Y/ac-haskell-" 0 13 (fontified nil face font-lock-function-name-face)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_irony" "pkg_conf/init_irony.el"
;;;;;;  (21916 11117 829682 190000))
;;; Generated autoloads from pkg_conf/init_irony.el

(add-hook 'c++-mode-hook 'irony-mode)

(add-hook 'c-mode-hook 'irony-mode)

(add-hook 'objc-mode-hook 'irony-mode)

(autoload 'Y/irony-mode-setup "pkg_conf/init_irony" "\
Setup irony-mode.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_java" "pkg_conf/init_java.el"
;;;;;;  (21916 11116 257629 988000))
;;; Generated autoloads from pkg_conf/init_java.el

(add-hook 'java-mode-hook 'Y/java-init)

;;;***

;;;### (autoloads nil "pkg_conf/init_lookup" "pkg_conf/init_lookup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_lookup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_lookup" '(#("Y/lookup" 0 8 (face font-lock-function-name-face fontified nil)) #("ndeb-" 0 5 (fontified nil face font-lock-variable-name-face)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_magit" "pkg_conf/init_magit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_magit.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_magit" '("magit-diff-refine-hunk")))

;;;***

;;;### (autoloads nil "pkg_conf/init_markdown-mode" "pkg_conf/init_markdown-mode.el"
;;;;;;  t)
;;; Generated autoloads from pkg_conf/init_markdown-mode.el

(add-to-list 'auto-mode-alist (cons "\\(?:\\.\\(?:\\(?:m\\(?:arkdown\\|d\\(?:own\\)?\\|kdn?\\)\\)\\)\\)\\'" 'gfm-mode))

(add-hook 'with-editor-mode-hook '(lambda nil (when (string-match (rx (or "PULLREQ_EDITMSG" "COMMIT_EDITMSG" "TAG_EDITMSG")) (buffer-name)) (gfm-mode))))

;;;***

;;;### (autoloads nil "pkg_conf/init_multi-term" "pkg_conf/init_multi-term.el"
;;;;;;  (22071 46722 836325 434000))
;;; Generated autoloads from pkg_conf/init_multi-term.el

(autoload 'my/multi-term "pkg_conf/init_multi-term" "\


\(fn &optional SWITCH)" t nil)

(autoload 'my/multi-term-current-buffer "pkg_conf/init_multi-term" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_mykie" "pkg_conf/init_mykie.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_mykie.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_mykie" '(#("my/overriding-mode-map" 0 22 (fontified nil)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_nim-mode" "pkg_conf/init_nim-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_nim-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_nim-mode" '("my-nim-print" "nim" "Y/nim-mode-common-setup")))

;;;***

;;;### (autoloads nil "pkg_conf/init_outline" "pkg_conf/init_outline.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_outline.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_outline" '(#("my/" 0 3 (fontified nil face font-lock-function-name-face)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_ov" "pkg_conf/init_ov.el" (21800
;;;;;;  29264 928621 855000))
;;; Generated autoloads from pkg_conf/init_ov.el

(autoload 'Y/ov-toggle-http-overlay "pkg_conf/init_ov" "\
Overlay https?:// link.

\(fn)" t nil)

(autoload 'Y/ov-turn-off-http-overlay "pkg_conf/init_ov" "\
Turn off overlay.

\(fn)" t nil)

(autoload 'Y/ov-turn-on-http-overlay "pkg_conf/init_ov" "\
Turn on overlay.

\(fn)" t nil)

(autoload 'Y/ov-http-overlay-at-point-p "pkg_conf/init_ov" "\
Whether the point is overlay-ed or not.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_perl-mode" "pkg_conf/init_perl-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_perl-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_perl-mode" '(#("perl-mode" 0 9 (face font-lock-function-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_quickrun" "pkg_conf/init_quickrun.el"
;;;;;;  t)
;;; Generated autoloads from pkg_conf/init_quickrun.el

(autoload 'my/quickrun-dwim "pkg_conf/init_quickrun" "\
Do quickrun.
You can specify 'ask and 'compile-only as symbol to DIRECTION.

\(fn &optional DIRECTION)" t nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_skk-server" "pkg_conf/init_skk-server.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_skk-server.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_skk-server" '(#("skk-server-portnum" 0 18 (face font-lock-variable-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_slime" "pkg_conf/init_slime.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_slime.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_slime" '(#("slime-net-coding-system" 0 23 (face font-lock-variable-name-face fontified nil)) #("inferior-lisp-program" 0 21 (face font-lock-variable-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_twittering-mode" "pkg_conf/init_twittering-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_twittering-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_twittering-mode" '(#("my/twit" 0 7 (fontified nil face font-lock-function-name-face)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_w3m" "pkg_conf/init_w3m.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_w3m.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_w3m" '(#("my/w3m-" 0 2 (fontified nil) 2 7 (face font-lock-function-name-face fontified nil)) #("my-" 0 2 (fontified nil) 2 3 (fontified nil)) #("dired-w3m-find-file" 0 19 (fontified nil)) #("w3m-" 0 4 (fontified nil face font-lock-variable-name-face)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_web-mode" "pkg_conf/init_web-mode.el"
;;;;;;  (22052 32309 381299 889000))
;;; Generated autoloads from pkg_conf/init_web-mode.el

(add-to-list 'auto-mode-alist (cons (rx "." (or "html" "phtml" "tpl.php" "erb" "mustache" "djhtml" (and (or "a" "g" "j") "sp") (and "as" (or "c" "p") "x")) line-end) 'web-mode))

;;;***

;;;### (autoloads nil "pkg_conf/init_yasnippet" "pkg_conf/init_yasnippet.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_yasnippet.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_yasnippet" '(#("yas-" 0 4 (fontified nil face font-lock-function-name-face)))))

;;;***

;;;### (autoloads nil nil ("../test.el" "Y/Y-hooks.el" "Y/Y-prog-mode.el"
;;;;;;  "builtin/init_align.el" "builtin/init_autoinsert.el" "builtin/init_browse-url.el"
;;;;;;  "builtin/init_cc-mode.el" "builtin/init_css-mode.el" "builtin/init_cua-base.el"
;;;;;;  "builtin/init_diff-mode.el" "builtin/init_dired.el" "builtin/init_doc-view.el"
;;;;;;  "builtin/init_ediff.el" "builtin/init_em-banner.el" "builtin/init_epg-config.el"
;;;;;;  "builtin/init_eshell.el" "builtin/init_eww.el" "builtin/init_flymake.el"
;;;;;;  "builtin/init_ido.el" "builtin/init_indent.el" "builtin/init_info.el"
;;;;;;  "builtin/init_isearch.el" "builtin/init_ispell.el" "builtin/init_js.el"
;;;;;;  "builtin/init_lisp-mode.el" "builtin/init_nxml-mode.el" "builtin/init_ob.el"
;;;;;;  "builtin/init_ox-html.el" "builtin/init_ox-latex.el" "builtin/init_paren.el"
;;;;;;  "builtin/init_po-mode.el" "builtin/init_python.el" "builtin/init_recentf.el"
;;;;;;  "builtin/init_ruby-mode.el" "builtin/init_savehist.el" "builtin/init_server.el"
;;;;;;  "builtin/init_sgml-mode.el" "builtin/init_sh-script.el" "builtin/init_shr.el"
;;;;;;  "builtin/init_simple.el" "builtin/init_tool-bar.el" "builtin/init_tramp.el"
;;;;;;  "builtin/init_verilog-mode.el" "builtin/init_view.el" "builtin/init_whitespace.el"
;;;;;;  "builtin/init_windmove.el" "default.el" "depend/depend_emacs24.el"
;;;;;;  "depend/depend_emacs25.el" "depend/depend_main.el" "emacs-custom.el"
;;;;;;  "pkg_conf/init_android-mode.el" "pkg_conf/init_arduino-mode.el"
;;;;;;  "pkg_conf/init_bm.el" "pkg_conf/init_bpe.el" "pkg_conf/init_c-eldoc.el"
;;;;;;  "pkg_conf/init_calfw-gcal.el" "pkg_conf/init_calfw.el" "pkg_conf/init_cider.el"
;;;;;;  "pkg_conf/init_clojure-mode.el" "pkg_conf/init_company-c-headers.el"
;;;;;;  "pkg_conf/init_eclim.el" "pkg_conf/init_eiji.el" "pkg_conf/init_eldoc.el"
;;;;;;  "pkg_conf/init_evil-macros.el" "pkg_conf/init_fold_dwim.el"
;;;;;;  "pkg_conf/init_ger.el" "pkg_conf/init_ggtags.el" "pkg_conf/init_google-translate-default-ui.el"
;;;;;;  "pkg_conf/init_grammar.el" "pkg_conf/init_grep-a-lot.el"
;;;;;;  "pkg_conf/init_hangman.el" "pkg_conf/init_haskell-emacs.el"
;;;;;;  "pkg_conf/init_haskell-font-lock.el" "pkg_conf/init_helm-ag-r.el"
;;;;;;  "pkg_conf/init_helm-ag.el" "pkg_conf/init_helm-files.el"
;;;;;;  "pkg_conf/init_helm-github-issues.el" "pkg_conf/init_helm-go.el"
;;;;;;  "pkg_conf/init_helm-gtags.el" "pkg_conf/init_helm-migemo.el"
;;;;;;  "pkg_conf/init_helm-rb.el" "pkg_conf/init_highlight-indentation.el"
;;;;;;  "pkg_conf/init_hl-line.el" "pkg_conf/init_info.el" "pkg_conf/init_jade.el"
;;;;;;  "pkg_conf/init_javadoc-lookup.el" "pkg_conf/init_jedi.el"
;;;;;;  "pkg_conf/init_js-console.el" "pkg_conf/init_js2-mode.el"
;;;;;;  "pkg_conf/init_jstestmacs.el" "pkg_conf/init_keyboard-converter.el"
;;;;;;  "pkg_conf/init_keychord.el" "pkg_conf/init_logalimacs.el"
;;;;;;  "pkg_conf/init_lua-mode.el" "pkg_conf/init_masaw.el" "pkg_conf/init_migemo.el"
;;;;;;  "pkg_conf/init_milkboy.el" "pkg_conf/init_mmm-mode.el" "pkg_conf/init_mode-compile.el"
;;;;;;  "pkg_conf/init_moz.el" "pkg_conf/init_mozc.el" "pkg_conf/init_multiple-cursors.el"
;;;;;;  "pkg_conf/init_newsticker.el" "pkg_conf/init_node-console.el"
;;;;;;  "pkg_conf/init_nyan-mode.el" "pkg_conf/init_open-junk-file.el"
;;;;;;  "pkg_conf/init_org-indent.el" "pkg_conf/init_org-mobile.el"
;;;;;;  "pkg_conf/init_org-trello.el" "pkg_conf/init_pangu-spacing.el"
;;;;;;  "pkg_conf/init_paredit.el" "pkg_conf/init_picture.el" "pkg_conf/init_popwin.el"
;;;;;;  "pkg_conf/init_powerline.el" "pkg_conf/init_python.el" "pkg_conf/init_rust-mode.el"
;;;;;;  "pkg_conf/init_sbtp.el" "pkg_conf/init_scala-mode.el" "pkg_conf/init_sdic-inline.el"
;;;;;;  "pkg_conf/init_sdic.el" "pkg_conf/init_skk-b.el" "pkg_conf/init_skk.el"
;;;;;;  "pkg_conf/init_skype.el" "pkg_conf/init_smartparens.el" "pkg_conf/init_sql.el"
;;;;;;  "pkg_conf/init_undo-tree.el" "pkg_conf/init_wgrep.el" "pkg_conf/init_winner.el"
;;;;;;  "pkg_conf/init_xmp.el" "pkg_conf/init_yaml-mode.el" "pkg_conf/init_yatemplate.el"
;;;;;;  "pkg_conf/init_yim.el" "site-start.el") (0 0 0 0))

;;;***

(provide 'yy-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; yy-loaddefs.el ends here
