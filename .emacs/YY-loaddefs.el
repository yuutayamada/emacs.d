;;; YY-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "../test" "../test.el" (0 0 0 0))
;;; Generated autoloads from ../test.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../test" '(#("Y/on-test" 0 9 (face font-lock-variable-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "Y/Y-autoload" "Y/Y-autoload.el" (0 0 0 0))
;;; Generated autoloads from Y/Y-autoload.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-autoload" '("Y/autoload-files")))

;;;***

;;;### (autoloads nil "Y/Y-el-get" "Y/Y-el-get.el" (0 0 0 0))
;;; Generated autoloads from Y/Y-el-get.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-el-get" '(#("el-get-u" 0 8 (face font-lock-function-name-face fontified nil)) #("Y/el-get-npm-install-maybe" 0 26 (fontified nil face font-lock-function-name-face)))))

;;;***

;;;### (autoloads nil "Y/Y-elisp-mode" "Y/Y-elisp-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from Y/Y-elisp-mode.el

(autoload 'Y-init-elisp-config "Y/Y-elisp-mode" "\
Setup my Emacs Lisp config.
This function is called from site-start.el.

\(fn)" nil nil)

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

(autoload 'Y/ssh-add "Y/Y-function" "\
Add ssh-key if it was needed when using magit.  You may neeed ssh-askpath.

Example of my/keys
 (\"git@github.com\\|https://github.com\" . \"~/.ssh/rsa_github_key\")

\(fn &rest R)" t nil)

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

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-function" '(#("test" 0 4 (fontified nil)) #("my/" 0 3 (fontified nil)) #("Y/" 0 2 (fontified nil face font-lock-variable-name-face)) #("banish" 0 6 (face font-lock-function-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "Y/Y-modeline" "Y/Y-modeline.el" (0 0 0 0))
;;; Generated autoloads from Y/Y-modeline.el

(autoload 'Y/clean-mode-line "Y/Y-modeline" "\
Use specified abbreviation of mode-line-name by `mode-line-cleaner-alist'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-modeline" '("mode-line-cleaner-alist")))

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

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y/Y-util" '("Y/" "autoloader-autoload")))

;;;***

;;;### (autoloads nil "default" "default.el" (0 0 0 0))
;;; Generated autoloads from default.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "default" '("el-get-is-lazy")))

;;;***

;;;### (autoloads nil "depend/depend_windows" "depend/depend_windows.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from depend/depend_windows.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "depend/depend_windows" '("my-window-change-char")))

;;;***

;;;### (autoloads nil "pkg_conf/init_android-mode" "pkg_conf/init_android-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_android-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_android-mode" '("Y/")))

;;;***

;;;### (autoloads nil "pkg_conf/init_auto-capitalize" "pkg_conf/init_auto-capitalize.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_auto-capitalize.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_auto-capitalize" '("auto-capitalize-aspell-file")))

;;;***

;;;### (autoloads nil "pkg_conf/init_auto-complete" "pkg_conf/init_auto-complete.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_auto-complete.el

(autoload 'my/ac-add-sources-for-prog "pkg_conf/init_auto-complete" "\
Add ac-sources for each programming-mode.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_auto-complete" '("my/ac-sources-default")))

;;;***

;;;### (autoloads nil "pkg_conf/init_auto-complete-c-headers" "pkg_conf/init_auto-complete-c-headers.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_auto-complete-c-headers.el

(autoload 'Y/ac-c-headers-init "pkg_conf/init_auto-complete-c-headers" "\
Add ac-c-headers source to auto-complete source.

\(fn)" nil nil)

(add-hook 'c++-mode-hook 'Y/ac-c-headers-init)

(add-hook 'c-mode-hook 'Y/ac-c-headers-init)

;;;***

;;;### (autoloads nil "pkg_conf/init_calfw-gcal" "pkg_conf/init_calfw-gcal.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_calfw-gcal.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_calfw-gcal" '("cfw:gcal-format-status")))

;;;***

;;;### (autoloads nil "pkg_conf/init_crontab-mode" "pkg_conf/init_crontab-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_crontab-mode.el

(add-to-list 'auto-mode-alist (cons "\\(\\.cron\\(tab\\)?\\|cron\\(tab\\)?\\.?\\)\\'" 'crontab-mode))

;;;***

;;;### (autoloads nil "pkg_conf/init_eclim" "pkg_conf/init_eclim.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_eclim.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_eclim" '("my/boot-eclim" "eclimd-executable")))

;;;***

;;;### (autoloads nil "pkg_conf/init_ensime" "pkg_conf/init_ensime.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_ensime.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_ensime" '("my/ensime-")))

;;;***

;;;### (autoloads nil "pkg_conf/init_evil-macros" "pkg_conf/init_evil-macros.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_evil-macros.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_evil-macros" '("Y/")))

;;;***

;;;### (autoloads nil "pkg_conf/init_festival" "pkg_conf/init_festival.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_festival.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_festival" '("my/festival")))

;;;***

;;;### (autoloads nil "pkg_conf/init_fold_dwim" "pkg_conf/init_fold_dwim.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_fold_dwim.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_fold_dwim" '("my/")))

;;;***

;;;### (autoloads nil "pkg_conf/init_ginger-api" "pkg_conf/init_ginger-api.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_ginger-api.el

(autoload 'Y/ginger-region "pkg_conf/init_ginger-api" "\
Check region by ‘ginger-region’ or ‘ginger-rephrase’.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_go-mode" "pkg_conf/init_go-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_go-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_go-mode" '("Y/go-mode-deploy-android-app")))

;;;***

;;;### (autoloads nil "pkg_conf/init_google-c-style" "pkg_conf/init_google-c-style.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_google-c-style.el

(add-hook 'c-mode-common-hook 'google-set-c-style)

;;;***

;;;### (autoloads nil "pkg_conf/init_google-translate-default-ui"
;;;;;;  "pkg_conf/init_google-translate-default-ui.el" (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_google-translate-default-ui.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_google-translate-default-ui" '("Y/google-translate-")))

;;;***

;;;### (autoloads nil "pkg_conf/init_grep-a-lot" "pkg_conf/init_grep-a-lot.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_grep-a-lot.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_grep-a-lot" '("grep-a-lot-buffer-name" "my-grep-a-lot-search-word" "my/remove-buffer-if-exist")))

;;;***

;;;### (autoloads nil "pkg_conf/init_haskell-mode" "pkg_conf/init_haskell-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_haskell-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_haskell-mode" '("Y/ac-haskell-")))

;;;***

;;;### (autoloads nil "pkg_conf/init_helm-gtags" "pkg_conf/init_helm-gtags.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_helm-gtags.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_helm-gtags" '("my/helm-gtags")))

;;;***

;;;### (autoloads nil "pkg_conf/init_irony" "pkg_conf/init_irony.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_irony.el

(add-hook 'c++-mode-hook 'irony-mode)

(add-hook 'c-mode-hook 'irony-mode)

(add-hook 'objc-mode-hook 'irony-mode)

(autoload 'Y/irony-mode-setup "pkg_conf/init_irony" "\
Setup irony-mode.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_irony" '("irony-")))

;;;***

;;;### (autoloads nil "pkg_conf/init_java" "pkg_conf/init_java.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_java.el

(add-hook 'java-mode-hook 'Y/java-init)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_java" '("Y/java-init" "flymake-java-default-android-sdk-version")))

;;;***

;;;### (autoloads nil "pkg_conf/init_lookup" "pkg_conf/init_lookup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_lookup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_lookup" '("Y/lookup" "ndeb-")))

;;;***

;;;### (autoloads nil "pkg_conf/init_magit" "pkg_conf/init_magit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_magit.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_magit" '("Y/magit-jump-to-g-window" "magit-diff-refine-hunk")))

;;;***

;;;### (autoloads nil "pkg_conf/init_markdown-mode" "pkg_conf/init_markdown-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_markdown-mode.el

(add-to-list 'auto-mode-alist (cons "\\(?:\\.\\(?:\\(?:m\\(?:arkdown\\|d\\(?:own\\)?\\|kdn?\\)\\)\\)\\)\\'" 'gfm-mode))

(add-hook 'with-editor-mode-hook '(lambda nil (when (string-match (rx (or "PULLREQ_EDITMSG" "COMMIT_EDITMSG" "TAG_EDITMSG")) (buffer-name)) (gfm-mode))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_markdown-mode" '("Y/markdown-pr")))

;;;***

;;;### (autoloads nil "pkg_conf/init_mode-compile" "pkg_conf/init_mode-compile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_mode-compile.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_mode-compile" '("my/")))

;;;***

;;;### (autoloads nil "pkg_conf/init_multi-term" "pkg_conf/init_multi-term.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_multi-term.el

(autoload 'my/multi-term "pkg_conf/init_multi-term" "\


\(fn &optional SWITCH)" t nil)

(autoload 'my/multi-term-current-buffer "pkg_conf/init_multi-term" "\


\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_multi-term" '("term-send-" "my/multi-term-original-buffer")))

;;;***

;;;### (autoloads nil "pkg_conf/init_mykie" "pkg_conf/init_mykie.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_mykie.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_mykie" '(#("my/overriding-mode-map" 0 22 (fontified nil)))))

;;;***

;;;### (autoloads nil "pkg_conf/init_nim-mode" "pkg_conf/init_nim-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_nim-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_nim-mode" '("my-nim-print" "nim-electric-backward-char" "Y/nim-mode-common-setup")))

;;;***

;;;### (autoloads nil "pkg_conf/init_open-junk-file" "pkg_conf/init_open-junk-file.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_open-junk-file.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_open-junk-file" '("my/open-junk-today")))

;;;***

;;;### (autoloads nil "pkg_conf/init_org-mobile" "pkg_conf/init_org-mobile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_org-mobile.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_org-mobile" '("org-mobile-")))

;;;***

;;;### (autoloads nil "pkg_conf/init_outline" "pkg_conf/init_outline.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_outline.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_outline" '("my/")))

;;;***

;;;### (autoloads nil "pkg_conf/init_ov" "pkg_conf/init_ov.el" (0
;;;;;;  0 0 0))
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

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_ov" '("Y/http-overlay")))

;;;***

;;;### (autoloads nil "pkg_conf/init_perl-mode" "pkg_conf/init_perl-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_perl-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_perl-mode" '("perl-mode")))

;;;***

;;;### (autoloads nil "pkg_conf/init_picture" "pkg_conf/init_picture.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_picture.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_picture" '("picture-")))

;;;***

;;;### (autoloads nil "pkg_conf/init_popup" "pkg_conf/init_popup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_popup.el

(autoload 'yas-popup-isearch-prompt "pkg_conf/init_popup" "\
See http://www.emacswiki.org/emacs/Yasnippet.

\(fn PROMPT CHOICES &optional DISPLAY-FN)" nil nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_quickrun" "pkg_conf/init_quickrun.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_quickrun.el

(autoload 'my/quickrun-dwim "pkg_conf/init_quickrun" "\
Do quickrun.
You can specify 'ask and 'compile-only as symbol to DIRECTION.

\(fn &optional DIRECTION)" t nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_rust-mode" "pkg_conf/init_rust-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_rust-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_rust-mode" '("my/rustdoc")))

;;;***

;;;### (autoloads nil "pkg_conf/init_sdic" "pkg_conf/init_sdic.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_sdic.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_sdic" '("my-sdic-describe-word-with-popup" "temp-cancel-read-only")))

;;;***

;;;### (autoloads nil "pkg_conf/init_sdic-inline" "pkg_conf/init_sdic-inline.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_sdic-inline.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_sdic-inline" '("sdic-inline-pos-tip-show-when-region-selected")))

;;;***

;;;### (autoloads nil "pkg_conf/init_skk" "pkg_conf/init_skk.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_skk.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_skk" '("skk-")))

;;;***

;;;### (autoloads nil "pkg_conf/init_skk-server" "pkg_conf/init_skk-server.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_skk-server.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_skk-server" '("skk-server-portnum")))

;;;***

;;;### (autoloads nil "pkg_conf/init_skype" "pkg_conf/init_skype.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_skype.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_skype" '("skype")))

;;;***

;;;### (autoloads nil "pkg_conf/init_slime" "pkg_conf/init_slime.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_slime.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_slime" '("slime-net-coding-system" "inferior-lisp-program")))

;;;***

;;;### (autoloads nil "pkg_conf/init_twittering-mode" "pkg_conf/init_twittering-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_twittering-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_twittering-mode" '("my/twit")))

;;;***

;;;### (autoloads nil "pkg_conf/init_w3m" "pkg_conf/init_w3m.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_w3m.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_w3m" '("my/w3m-" "my-" "dired-w3m-find-file" "w3m-")))

;;;***

;;;### (autoloads nil "pkg_conf/init_web-mode" "pkg_conf/init_web-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_web-mode.el

(add-to-list 'auto-mode-alist (cons (rx "." (or "html" "phtml" "tpl.php" "erb" "mustache" "djhtml" (and (or "a" "g" "j") "sp") (and "as" (or "c" "p") "x")) line-end) 'web-mode))

;;;***

;;;### (autoloads nil "pkg_conf/init_yasnippet" "pkg_conf/init_yasnippet.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg_conf/init_yasnippet.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg_conf/init_yasnippet" '("yas-snippet-dirs")))

;;;***

;;;### (autoloads nil nil ("Y/Y-hooks.el" "Y/Y-prog-mode.el" "depend/depend_emacs24.el"
;;;;;;  "depend/depend_emacs25.el" "depend/depend_main.el" "emacs-custom.el"
;;;;;;  "pkg_conf/init_arduino-mode.el" "pkg_conf/init_bm.el" "pkg_conf/init_bpe.el"
;;;;;;  "pkg_conf/init_c-eldoc.el" "pkg_conf/init_calfw.el" "pkg_conf/init_cider.el"
;;;;;;  "pkg_conf/init_clojure-mode.el" "pkg_conf/init_company-c-headers.el"
;;;;;;  "pkg_conf/init_company.el" "pkg_conf/init_eiji.el" "pkg_conf/init_ger.el"
;;;;;;  "pkg_conf/init_ggtags.el" "pkg_conf/init_grammar.el" "pkg_conf/init_hangman.el"
;;;;;;  "pkg_conf/init_haskell-emacs.el" "pkg_conf/init_haskell-font-lock.el"
;;;;;;  "pkg_conf/init_helm-ag-r.el" "pkg_conf/init_helm-ag.el" "pkg_conf/init_helm-files.el"
;;;;;;  "pkg_conf/init_helm-github-issues.el" "pkg_conf/init_helm-go.el"
;;;;;;  "pkg_conf/init_helm-migemo.el" "pkg_conf/init_helm-rb.el"
;;;;;;  "pkg_conf/init_highlight-indentation.el" "pkg_conf/init_hl-line.el"
;;;;;;  "pkg_conf/init_info.el" "pkg_conf/init_jade.el" "pkg_conf/init_javadoc-lookup.el"
;;;;;;  "pkg_conf/init_jedi.el" "pkg_conf/init_js-console.el" "pkg_conf/init_js2-mode.el"
;;;;;;  "pkg_conf/init_jstestmacs.el" "pkg_conf/init_keyboard-converter.el"
;;;;;;  "pkg_conf/init_keychord.el" "pkg_conf/init_logalimacs.el"
;;;;;;  "pkg_conf/init_lua-mode.el" "pkg_conf/init_masaw.el" "pkg_conf/init_migemo.el"
;;;;;;  "pkg_conf/init_mmm-mode.el" "pkg_conf/init_moz.el" "pkg_conf/init_mozc.el"
;;;;;;  "pkg_conf/init_multiple-cursors.el" "pkg_conf/init_newsticker.el"
;;;;;;  "pkg_conf/init_node-console.el" "pkg_conf/init_nyan-mode.el"
;;;;;;  "pkg_conf/init_org-trello.el" "pkg_conf/init_pangu-spacing.el"
;;;;;;  "pkg_conf/init_paredit.el" "pkg_conf/init_popwin.el" "pkg_conf/init_powerline.el"
;;;;;;  "pkg_conf/init_python.el" "pkg_conf/init_sbtp.el" "pkg_conf/init_scala-mode.el"
;;;;;;  "pkg_conf/init_skk-b.el" "pkg_conf/init_smartparens.el" "pkg_conf/init_sql.el"
;;;;;;  "pkg_conf/init_undo-tree.el" "pkg_conf/init_wgrep.el" "pkg_conf/init_winner.el"
;;;;;;  "pkg_conf/init_xmp.el" "pkg_conf/init_yaml-mode.el" "pkg_conf/init_yatemplate.el"
;;;;;;  "pkg_conf/init_yim.el" "site-start.el") (0 0 0 0))

;;;***

(provide 'YY-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; YY-loaddefs.el ends here
