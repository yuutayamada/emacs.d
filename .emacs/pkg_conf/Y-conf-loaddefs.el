;;; Y-conf-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "../default" "../default.el" (0 0 0 0))
;;; Generated autoloads from ../default.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../default" '(#("tty-setup-once" 0 14 (face font-lock-function-name-face fontified nil)) #("el-get-is-lazy" 0 14 (face font-lock-variable-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "builtin/init_auth-source" "builtin/init_auth-source.el"
;;;;;;  (0 0 0 0))
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

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_autoload" '(#("Y/update-autoloads" 0 18 (face font-lock-function-name-face fontified t)))))

;;;***

;;;### (autoloads nil "builtin/init_calendar" "builtin/init_calendar.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_calendar.el

(autoload 'Y/insert-day "builtin/init_calendar" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "builtin/init_dired" "builtin/init_dired.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_dired.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_dired" '(#("Y-open-file-as-root" 0 19 (face font-lock-function-name-face fontified nil)) #("image-dired-gallery-dir" 0 23 (face font-lock-variable-name-face fontified nil)) #("dired-" 0 6 (fontified nil face font-lock-variable-name-face)))))

;;;***

;;;### (autoloads nil "builtin/init_doc-view" "builtin/init_doc-view.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_doc-view.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_doc-view" '("Y/doc-view-maybe-pdf-tools")))

;;;***

;;;### (autoloads nil "builtin/init_erc" "builtin/init_erc.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from builtin/init_erc.el

(autoload 'Y/erc-start-irc "builtin/init_erc" "\
Connect to IRC.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_erc" '(#("erc-prompt" 0 10 (face font-lock-function-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "builtin/init_eshell" "builtin/init_eshell.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_eshell.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_eshell" '("eshell-" "my/eshell-tmp-buffer")))

;;;***

;;;### (autoloads nil "builtin/init_eww" "builtin/init_eww.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from builtin/init_eww.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_eww" '("eww-search-prefix")))

;;;***

;;;### (autoloads nil "builtin/init_filecache" "builtin/init_filecache.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_filecache.el

(autoload 'Y/filecache-ido-find-file "builtin/init_filecache" "\
My file cache find-file.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_filecache" '("Y/ghq-root" "my/filecache-directories")))

;;;***

;;;### (autoloads nil "builtin/init_gnus" "builtin/init_gnus.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_gnus.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_gnus" '("my/gnus-" "nntp-authinfo-file")))

;;;***

;;;### (autoloads nil "builtin/init_grep" "builtin/init_grep.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_grep.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_grep" '(#("grep-" 0 5 (fontified t face font-lock-function-name-face)) #("Y/grep-jump-to-file" 0 19 (face font-lock-function-name-face fontified t)))))

;;;***

;;;### (autoloads nil "builtin/init_ido" "builtin/init_ido.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from builtin/init_ido.el

(autoload 'Y/ido-find-ghq-dirs "builtin/init_ido" "\
Find file from my favorite resource.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_ido" '("Y/ido-toggle")))

;;;***

;;;### (autoloads nil "builtin/init_indent" "builtin/init_indent.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_indent.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_indent" '("standard-indent")))

;;;***

;;;### (autoloads nil "builtin/init_iso-transl" "builtin/init_iso-transl.el"
;;;;;;  (0 0 0 0))
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

;;;### (autoloads nil "builtin/init_python" "builtin/init_python.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_python.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_python" '("python-indent")))

;;;***

;;;### (autoloads nil "builtin/init_sh-script" "builtin/init_sh-script.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_sh-script.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_sh-script" '("sh-")))

;;;***

;;;### (autoloads nil "builtin/init_smerge-mode" "builtin/init_smerge-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_smerge-mode.el

(autoload 'Y/smerge-mode-keep-at-point "builtin/init_smerge-mode" "\
Treat merging at point by smerge way.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "builtin/init_term" "builtin/init_term.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_term.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_term" '("Y-term-mode-line-colors")))

;;;***

;;;### (autoloads nil "builtin/init_verilog-mode" "builtin/init_verilog-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_verilog-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_verilog-mode" '("Y/verilog-")))

;;;***

;;;### (autoloads nil "builtin/init_whitespace" "builtin/init_whitespace.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from builtin/init_whitespace.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "builtin/init_whitespace" '("whitespace-")))

;;;***

;;;### (autoloads nil "el-get/init-evil" "el-get/init-evil.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from el-get/init-evil.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/init-evil" '("Y/toggle-background-color" "Y-evil-key-exist-p")))

;;;***

;;;### (autoloads nil "el-get/init-flycheck-tip" "el-get/init-flycheck-tip.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/init-flycheck-tip.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/init-flycheck-tip" '("error-tip-timer-delay")))

;;;***

;;;### (autoloads nil "el-get/init-idle-require" "el-get/init-idle-require.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/init-idle-require.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/init-idle-require" '("idle-require-symbols" "Y/idle-require-set-timer")))

;;;***

;;;### (autoloads nil "el-get/init-pdf-tools" "el-get/init-pdf-tools.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/init-pdf-tools.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/init-pdf-tools" '("Y/nim-in-action-slice")))

;;;***

;;;### (autoloads nil "el-get/init-windows" "el-get/init-windows.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/init-windows.el

(autoload 'Y/win-switch-window "el-get/init-windows" "\


\(fn CHAR-A-TO-Z)" nil nil)

(autoload 'Y/win-current-alpha "el-get/init-windows" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "init_android-mode" "init_android-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_android-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_android-mode" '("Y/")))

;;;***

;;;### (autoloads nil "init_auto-capitalize" "init_auto-capitalize.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_auto-capitalize.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_auto-capitalize" '("auto-capitalize-aspell-file")))

;;;***

;;;### (autoloads nil "init_auto-complete" "init_auto-complete.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_auto-complete.el

(autoload 'my/ac-add-sources-for-prog "init_auto-complete" "\
Add ac-sources for each programming-mode.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_auto-complete" '("my/ac-sources-default")))

;;;***

;;;### (autoloads nil "init_auto-complete-c-headers" "init_auto-complete-c-headers.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_auto-complete-c-headers.el

(autoload 'Y/ac-c-headers-init "init_auto-complete-c-headers" "\
Add ac-c-headers source to auto-complete source.

\(fn)" nil nil)

(add-hook 'c++-mode-hook 'Y/ac-c-headers-init)

(add-hook 'c-mode-hook 'Y/ac-c-headers-init)

;;;***

;;;### (autoloads nil "init_avy" "init_avy.el" (0 0 0 0))
;;; Generated autoloads from init_avy.el

(autoload 'Y/avy-goto-char-by-input-event "init_avy" "\
Goto char with avy and move to ‘last-input-event’s char.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_avy" '("avy-keys")))

;;;***

;;;### (autoloads nil "init_calfw-gcal" "init_calfw-gcal.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from init_calfw-gcal.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_calfw-gcal" '("cfw:gcal-format-status")))

;;;***

;;;### (autoloads nil "init_company-flx" "init_company-flx.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from init_company-flx.el

(autoload 'Y/company-flx-setup "init_company-flx" "\
Set up fuzzy matching.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "init_crontab-mode" "init_crontab-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_crontab-mode.el

(add-to-list 'auto-mode-alist (cons "\\(\\.cron\\(tab\\)?\\|cron\\(tab\\)?\\.?\\)\\'" 'crontab-mode))

;;;***

;;;### (autoloads nil "init_ensime" "init_ensime.el" (0 0 0 0))
;;; Generated autoloads from init_ensime.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_ensime" '("my/ensime-")))

;;;***

;;;### (autoloads nil "init_evil-macros" "init_evil-macros.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from init_evil-macros.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_evil-macros" '("Y/")))

;;;***

;;;### (autoloads nil "init_festival" "init_festival.el" (0 0 0 0))
;;; Generated autoloads from init_festival.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_festival" '("my/festival")))

;;;***

;;;### (autoloads nil "init_flycheck" "init_flycheck.el" (0 0 0 0))
;;; Generated autoloads from init_flycheck.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_flycheck" '("flycheck-emacs-lisp-")))

;;;***

;;;### (autoloads nil "init_ginger-api" "init_ginger-api.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from init_ginger-api.el

(autoload 'Y/ginger-region "init_ginger-api" "\
Check region by ‘ginger-region’ or ‘ginger-rephrase’.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "init_go-mode" "init_go-mode.el" (0 0 0 0))
;;; Generated autoloads from init_go-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_go-mode" '("Y/go-mode-deploy-android-app")))

;;;***

;;;### (autoloads nil "init_google-c-style" "init_google-c-style.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_google-c-style.el

(add-hook 'c-mode-common-hook 'google-set-c-style)

;;;***

;;;### (autoloads nil "init_google-translate-default-ui" "init_google-translate-default-ui.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_google-translate-default-ui.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_google-translate-default-ui" '("Y/google-translate-")))

;;;***

;;;### (autoloads nil "init_grep-a-lot" "init_grep-a-lot.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from init_grep-a-lot.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_grep-a-lot" '("grep-a-lot-buffer-name" "my-grep-a-lot-search-word" "my/remove-buffer-if-exist")))

;;;***

;;;### (autoloads nil "init_haskell-mode" "init_haskell-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_haskell-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_haskell-mode" '("Y/ac-haskell-")))

;;;***

;;;### (autoloads nil "init_helm-gtags" "init_helm-gtags.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from init_helm-gtags.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_helm-gtags" '("my/helm-gtags")))

;;;***

;;;### (autoloads nil "init_irony" "init_irony.el" (0 0 0 0))
;;; Generated autoloads from init_irony.el

(add-hook 'c++-mode-hook 'irony-mode)

(add-hook 'c-mode-hook 'irony-mode)

(add-hook 'objc-mode-hook 'irony-mode)

(autoload 'Y/irony-mode-setup "init_irony" "\
Setup irony-mode.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_irony" '("irony-")))

;;;***

;;;### (autoloads nil "init_java" "init_java.el" (0 0 0 0))
;;; Generated autoloads from init_java.el

(add-hook 'java-mode-hook 'Y/java-init)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_java" '("Y/java-init" "flymake-java-default-android-sdk-version")))

;;;***

;;;### (autoloads nil "init_lookup" "init_lookup.el" (0 0 0 0))
;;; Generated autoloads from init_lookup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_lookup" '("Y/lookup" "ndeb-")))

;;;***

;;;### (autoloads nil "init_lua-mode" "init_lua-mode.el" (0 0 0 0))
;;; Generated autoloads from init_lua-mode.el

(el-get 'sync 'lua-mode)

;;;***

;;;### (autoloads nil "init_magit" "init_magit.el" (0 0 0 0))
;;; Generated autoloads from init_magit.el

(autoload 'Y/magit-status "init_magit" "\
Call `magit-status'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_magit" '("Y/magit-jump-to-g-window" "magit-diff-refine-hunk")))

;;;***

;;;### (autoloads nil "init_markdown-mode" "init_markdown-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_markdown-mode.el

(el-get 'sync 'markdown-mode)

(add-to-list 'auto-mode-alist (cons "\\(?:\\.\\(?:\\(?:m\\(?:arkdown\\|d\\(?:own\\)?\\|kdn?\\)\\)\\)\\)\\'" 'gfm-mode))

(add-hook 'with-editor-mode-hook '(lambda nil (when (string-match (rx (or "PULLREQ_EDITMSG" "COMMIT_EDITMSG" "TAG_EDITMSG")) (buffer-name)) (gfm-mode))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_markdown-mode" '("Y/markdown-pr")))

;;;***

;;;### (autoloads nil "init_mode-compile" "init_mode-compile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_mode-compile.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_mode-compile" '("my/")))

;;;***

;;;### (autoloads nil "init_mykie" "init_mykie.el" (0 0 0 0))
;;; Generated autoloads from init_mykie.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_mykie" '(#("my/overriding-mode-map" 0 22 (fontified nil)) #("Y/mykie-tab" 0 11 (face font-lock-function-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "init_nim-mode" "init_nim-mode.el" (0 0 0 0))
;;; Generated autoloads from init_nim-mode.el

(el-get 'sync 'nim-mode)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_nim-mode" '("my-nim-print" "Y/nim-mode-common-setup")))

;;;***

;;;### (autoloads nil "init_open-junk-file" "init_open-junk-file.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_open-junk-file.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_open-junk-file" '("my/open-junk-today")))

;;;***

;;;### (autoloads nil "init_org-mobile" "init_org-mobile.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from init_org-mobile.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_org-mobile" '("org-mobile-")))

;;;***

;;;### (autoloads nil "init_perl-mode" "init_perl-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from init_perl-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_perl-mode" '("perl-mode")))

;;;***

;;;### (autoloads nil "init_picture" "init_picture.el" (0 0 0 0))
;;; Generated autoloads from init_picture.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_picture" '("picture-")))

;;;***

;;;### (autoloads nil "init_popup" "init_popup.el" (0 0 0 0))
;;; Generated autoloads from init_popup.el

(autoload 'yas-popup-isearch-prompt "init_popup" "\
See http://www.emacswiki.org/emacs/Yasnippet.

\(fn PROMPT CHOICES &optional DISPLAY-FN)" nil nil)

;;;***

;;;### (autoloads nil "init_quickrun" "init_quickrun.el" (0 0 0 0))
;;; Generated autoloads from init_quickrun.el

(autoload 'my/quickrun-dwim "init_quickrun" "\
Do quickrun.
You can specify 'ask and 'compile-only as symbol to DIRECTION.

\(fn &optional DIRECTION)" t nil)

;;;***

;;;### (autoloads nil "init_rust-mode" "init_rust-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from init_rust-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_rust-mode" '("my/rustdoc")))

;;;***

;;;### (autoloads nil "init_sane-term" "init_sane-term.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from init_sane-term.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_sane-term" '("sane-term-shell-command")))

;;;***

;;;### (autoloads nil "init_sdic" "init_sdic.el" (0 0 0 0))
;;; Generated autoloads from init_sdic.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_sdic" '("my-sdic-describe-word-with-popup" "temp-cancel-read-only")))

;;;***

;;;### (autoloads nil "init_sdic-inline" "init_sdic-inline.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from init_sdic-inline.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_sdic-inline" '("sdic-inline-pos-tip-show-when-region-selected")))

;;;***

;;;### (autoloads nil "init_skk" "init_skk.el" (0 0 0 0))
;;; Generated autoloads from init_skk.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_skk" '("skk-")))

;;;***

;;;### (autoloads nil "init_skk-server" "init_skk-server.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from init_skk-server.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_skk-server" '("skk-server-portnum")))

;;;***

;;;### (autoloads nil "init_slime" "init_slime.el" (0 0 0 0))
;;; Generated autoloads from init_slime.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_slime" '("slime-net-coding-system" "inferior-lisp-program")))

;;;***

;;;### (autoloads nil "init_twittering-mode" "init_twittering-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_twittering-mode.el

(advice-add 'twit :before 'my/twit-select-user-name)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_twittering-mode" '("my/twit")))

;;;***

;;;### (autoloads nil "init_visual-fill-column" "init_visual-fill-column.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_visual-fill-column.el

(autoload 'Y/visual-fill-mode "init_visual-fill-column" "\
Show filled sentences by visual line mode.
If ARG is non-nil, turn on visual mode stuff.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "init_w3m" "init_w3m.el" (0 0 0 0))
;;; Generated autoloads from init_w3m.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init_w3m" '("my/w3m-" "my-" "dired-w3m-find-file" "w3m-")))

;;;***

;;;### (autoloads nil "init_web-mode" "init_web-mode.el" (0 0 0 0))
;;; Generated autoloads from init_web-mode.el

(add-to-list 'auto-mode-alist (cons (rx "." (or "html" "phtml" "tpl.php" "erb" "mustache" "djhtml" (and (or "a" "g" "j") "sp") (and "as" (or "c" "p") "x")) line-end) 'web-mode))

;;;***

;;;### (autoloads nil "init_wgrep" "init_wgrep.el" (0 0 0 0))
;;; Generated autoloads from init_wgrep.el

(el-get 'sync 'wgrep)

;;;***

;;;### (autoloads nil "init_xterm-cursor-changer" "init_xterm-cursor-changer.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from init_xterm-cursor-changer.el

(autoload 'Y-update-modeline "init_xterm-cursor-changer" "\
Update modeline color with BG-COLOR.

\(fn &optional BG-COLOR &rest R)" nil nil)

(autoload 'Y-update-cursor-&-modeline "init_xterm-cursor-changer" "\
Update modeline and cursor colors.

\(fn &rest R)" nil nil)

;;;***

;;;### (autoloads nil "init_yasnippet" "init_yasnippet.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from init_yasnippet.el

(autoload 'Y/generic-yas "init_yasnippet" "\
Call FUNC.
Reduce loading time using autoload cookie.

\(fn FUNC)" t nil)

;;;***

;;;### (autoloads nil "obsolete/init_ac-mozc" "obsolete/init_ac-mozc.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from obsolete/init_ac-mozc.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "obsolete/init_ac-mozc" '("my/ac-mozc-setup")))

;;;***

;;;### (autoloads nil "rcfiles/Y-orgrc" "rcfiles/Y-orgrc.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from rcfiles/Y-orgrc.el

(autoload 'my/org-dwim "rcfiles/Y-orgrc" "\
My convinience function for `org-mode'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "rcfiles/Y-orgrc" '("my/" "Y/org-" "org-")))

;;;***

;;;### (autoloads nil "rcfiles/init-mew" "rcfiles/init-mew.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from rcfiles/init-mew.el

(autoload 'Y/mew "rcfiles/init-mew" "\
Switch m window.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "rcfiles/init-mew" '("mew" "my/")))

;;;***

;;;### (autoloads nil nil ("../emacs-custom.el" "../site-start.el"
;;;;;;  "builtin/init_align.el" "builtin/init_autoinsert.el" "builtin/init_browse-url.el"
;;;;;;  "builtin/init_cc-mode.el" "builtin/init_css-mode.el" "builtin/init_cua-base.el"
;;;;;;  "builtin/init_diff-mode.el" "builtin/init_ediff.el" "builtin/init_em-banner.el"
;;;;;;  "builtin/init_epg-config.el" "builtin/init_flyspell.el" "builtin/init_info.el"
;;;;;;  "builtin/init_isearch.el" "builtin/init_ispell.el" "builtin/init_js.el"
;;;;;;  "builtin/init_lisp-mode.el" "builtin/init_nxml-mode.el" "builtin/init_ox-html.el"
;;;;;;  "builtin/init_ox-latex.el" "builtin/init_paren.el" "builtin/init_po-mode.el"
;;;;;;  "builtin/init_recentf.el" "builtin/init_ruby-mode.el" "builtin/init_server.el"
;;;;;;  "builtin/init_sgml-mode.el" "builtin/init_shr.el" "builtin/init_simple.el"
;;;;;;  "builtin/init_tool-bar.el" "builtin/init_tramp.el" "builtin/init_view.el"
;;;;;;  "builtin/init_windmove.el" "el-get/init-ac-slime.el" "el-get/init-auto-compile.el"
;;;;;;  "el-get/init-beacon.el" "el-get/init-eshell-better-prompt.el"
;;;;;;  "el-get/init-evil-surround.el" "el-get/init-git-gutter.el"
;;;;;;  "el-get/init-helm.el" "el-get/init-tabbar.el" "init_arduino-mode.el"
;;;;;;  "init_bm.el" "init_bpe.el" "init_c-eldoc.el" "init_calfw.el"
;;;;;;  "init_cider.el" "init_clojure-mode.el" "init_company-c-headers.el"
;;;;;;  "init_company.el" "init_eiji.el" "init_ger.el" "init_ggtags.el"
;;;;;;  "init_grammar.el" "init_hangman.el" "init_haskell-emacs.el"
;;;;;;  "init_haskell-font-lock.el" "init_helm-ag-r.el" "init_helm-ag.el"
;;;;;;  "init_helm-files.el" "init_helm-github-issues.el" "init_helm-go.el"
;;;;;;  "init_helm-migemo.el" "init_helm-rb.el" "init_highlight-indentation.el"
;;;;;;  "init_hl-line.el" "init_info.el" "init_jade.el" "init_javadoc-lookup.el"
;;;;;;  "init_jedi.el" "init_js-console.el" "init_js2-mode.el" "init_jstestmacs.el"
;;;;;;  "init_keyboard-converter.el" "init_keychord.el" "init_logalimacs.el"
;;;;;;  "init_masaw.el" "init_migemo.el" "init_mmm-mode.el" "init_moz.el"
;;;;;;  "init_mozc.el" "init_multiple-cursors.el" "init_newsticker.el"
;;;;;;  "init_nlinum-relative.el" "init_node-console.el" "init_org-trello.el"
;;;;;;  "init_pangu-spacing.el" "init_paredit.el" "init_popwin.el"
;;;;;;  "init_powerline.el" "init_python.el" "init_sbtp.el" "init_scala-mode.el"
;;;;;;  "init_skk-b.el" "init_sql.el" "init_undo-tree.el" "init_winner.el"
;;;;;;  "init_xmp.el" "init_yatemplate.el" "init_yim.el" "obsolete/init_actionscript-mode.el")
;;;;;;  (0 0 0 0))

;;;***

(provide 'Y-conf-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; Y-conf-loaddefs.el ends here
