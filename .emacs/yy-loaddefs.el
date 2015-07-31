;;; yy-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "builtin/init_autoload" "builtin/init_autoload.el"
;;;;;;  (21916 11118 629708 752000))
;;; Generated autoloads from builtin/init_autoload.el

(autoload 'Y/make-autoload-files "builtin/init_autoload" "\
Make autoload files from elisp directory.
FILES should put a place where is located to elisp directory.

\(fn &optional FILES)" t nil)

;;;***

;;;### (autoloads nil "builtin/init_erc" "builtin/init_erc.el" (21916
;;;;;;  11116 913651 774000))
;;; Generated autoloads from builtin/init_erc.el

(autoload 'Y/start-irc "builtin/init_erc" "\
Connect to IRC.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "builtin/init_filecache" "builtin/init_filecache.el"
;;;;;;  (21800 29178 312618 264000))
;;; Generated autoloads from builtin/init_filecache.el

(autoload 'Y/filecache-ido-find-file "builtin/init_filecache" "\
My file cache find-file.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "builtin/init_flyspell" "builtin/init_flyspell.el"
;;;;;;  (21916 11116 437635 966000))
;;; Generated autoloads from builtin/init_flyspell.el

(defconst flyspell-mode-map 'nil)

;;;***

;;;### (autoloads nil "builtin/init_iso-transl" "builtin/init_iso-transl.el"
;;;;;;  (21800 29160 432617 523000))
;;; Generated autoloads from builtin/init_iso-transl.el

(autoload 'Y/iso-transl-toggle-minor-mode "builtin/init_iso-transl" "\
Toggle `iso-transl-ctl-x-8-map' keybinds.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "builtin/init_org" "builtin/init_org.el" (21800
;;;;;;  28599 624594 273000))
;;; Generated autoloads from builtin/init_org.el

(autoload 'my/org-dwim "builtin/init_org" "\
My convinience function for `org-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "builtin/init_smerge-mode" "builtin/init_smerge-mode.el"
;;;;;;  (21802 21765 775219 993000))
;;; Generated autoloads from builtin/init_smerge-mode.el

(autoload 'Y/smerge-mode-keep-at-point "builtin/init_smerge-mode" "\
Treat merging at point by smerge way.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "my_daemon" "my_daemon.el" (21825 10582 74777
;;;;;;  69000))
;;; Generated autoloads from my_daemon.el

(autoload 'Y/frame-init-func "my_daemon" "\
Init function when Emacs connects new server with FRAME object.

\(fn &optional FRAME)" nil nil)

(autoload 'Y/set-default-window-frame-alist "my_daemon" "\
Set `window-system-default-frame-alist' of FRAME.

\(fn FRAME)" nil nil)

;;;***

;;;### (autoloads nil "my_function" "my_function.el" (21932 36634
;;;;;;  126532 578000))
;;; Generated autoloads from my_function.el

(autoload 'other-window-or-split "my_function" "\
Move buffer or split when buffer was one.

\(fn)" t nil)

(autoload 'Y/split-window-spirally "my_function" "\


\(fn)" t nil)

(autoload 'Y/reverse-transpose-chars "my_function" "\


\(fn)" t nil)

(autoload 'Y/change-color "my_function" "\
Change highlight color to which correspond to FACE, BG, FG, UL.

\(fn FACE BG FG UL)" nil nil)

(autoload 'Y/change-style "my_function" "\
Change looking of window.

\(fn ATTRIBUTES &optional INHIBIT)" nil nil)

(autoload 'my/org-src-code-buffer-p "my_function" "\


\(fn)" nil nil)

(autoload 'my/kill-line "my_function" "\


\(fn)" nil nil)

(autoload 'my/screen-shot "my_function" "\


\(fn)" t nil)

(autoload 'my/remap-semicolon "my_function" "\
Reverse Colon and Semi Colon at specified key MAP.

\(fn MAP)" nil nil)

(autoload 'my/ssh-add "my_function" "\
Add ssh-key if it was needed when using magit. You may neeed ssh-askpath.

Example of my/keys
 (\"git@github.com\\|https://github.com\" . \"~/.ssh/rsa_github_key\")

\(fn)" t nil)

(autoload 'my/get-aspell-capital-words "my_function" "\


\(fn FILE)" nil nil)

(autoload 'my/file-exists-p "my_function" "\
Search FILE recursively to check whether file is exist until home directory.

\(fn FILE)" nil nil)

(autoload 'Y/show-cheat-sheet "my_function" "\


\(fn)" t nil)

(autoload 'my/get-above-dir-name "my_function" "\


\(fn)" nil nil)

(autoload 'my/in-dir-p "my_function" "\


\(fn DIRECTORY)" nil nil)

(autoload 'my/execute-from-current-file "my_function" "\


\(fn &optional STATEMENT)" t nil)

(autoload 'Y/get-auth-info "my_function" "\


\(fn MACHINE &rest KEYWORDS)" nil nil)

(autoload 'my/copy-current-file-name "my_function" "\


\(fn)" t nil)

(autoload 'my/kill-backward-word "my_function" "\


\(fn)" nil nil)

(autoload 'my/newline-and-indent "my_function" "\
My better newline and indent.

\(fn)" t nil)

(autoload 'my/reset-bg-color "my_function" "\


\(fn &optional COLOR)" t nil)

(autoload 'Y/eval-and-replace "my_function" "\
Eval and replace.
This function distinguishes parenthesis and symbol accordingly.

\(fn)" t nil)

(autoload 'Y/echo-current-point "my_function" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "my_util" "my_util.el" (21912 30253 266815
;;;;;;  215000))
;;; Generated autoloads from my_util.el

(autoload 'Y/load-packages "my_util" "\
Load PACKAGES.

\(fn PACKAGES)" nil nil)

(autoload 'Y/apply-color-theme "my_util" "\
Use my transparent color theme if it is in terminal Emacs.
Otherwise, use a dark theme.  The FRAME is frame object.

\(fn NEW-THEME HL-FLAG)" t nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_auto-complete" "pkg_conf/init_auto-complete.el"
;;;;;;  (21916 11116 85624 277000))
;;; Generated autoloads from pkg_conf/init_auto-complete.el

(autoload 'my/ac-add-sources-for-prog "pkg_conf/init_auto-complete" "\
Add ac-sources for each programming-mode.

\(fn)" nil nil)

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
;;;;;;  (21946 27299 703707 858000))
;;; Generated autoloads from pkg_conf/init_avy.el

(autoload 'avy-goto-char-by-input-event "pkg_conf/init_avy" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_ginger-api" "pkg_conf/init_ginger-api.el"
;;;;;;  (21800 29732 464641 238000))
;;; Generated autoloads from pkg_conf/init_ginger-api.el

(autoload 'my/ginger-region "pkg_conf/init_ginger-api" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "pkg_conf/init_google-c-style" "pkg_conf/init_google-c-style.el"
;;;;;;  (21916 11116 257629 988000))
;;; Generated autoloads from pkg_conf/init_google-c-style.el

(add-hook 'c-mode-common-hook 'google-set-c-style)

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

;;;### (autoloads nil "pkg_conf/init_multi-term" "pkg_conf/init_multi-term.el"
;;;;;;  (21800 27723 548557 953000))
;;; Generated autoloads from pkg_conf/init_multi-term.el

(autoload 'my/multi-term "pkg_conf/init_multi-term" "\


\(fn &optional SWITCH)" t nil)

(autoload 'my/multi-term-current-buffer "pkg_conf/init_multi-term" "\


\(fn)" t nil)

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

;;;### (autoloads nil "pkg_conf/init_quickrun" "pkg_conf/init_quickrun.el"
;;;;;;  (21916 11115 865616 970000))
;;; Generated autoloads from pkg_conf/init_quickrun.el

(autoload 'my/quickrun-dwim "pkg_conf/init_quickrun" "\
Do quickrun.
You can specify 'ask and 'compile-only as symbol to DIRECTION.

\(fn &optional DIRECTION)" t nil)

;;;***

;;;### (autoloads nil nil ("../test.el" "Y-launch.el" "builtin/init_align.el"
;;;;;;  "builtin/init_autoinsert.el" "builtin/init_browse-url.el"
;;;;;;  "builtin/init_cc-mode.el" "builtin/init_css-mode.el" "builtin/init_cua-base.el"
;;;;;;  "builtin/init_diff-mode.el" "builtin/init_dired-x.el" "builtin/init_dired.el"
;;;;;;  "builtin/init_doc-view.el" "builtin/init_ediff.el" "builtin/init_elisp-mode.el"
;;;;;;  "builtin/init_em-banner.el" "builtin/init_eshell.el" "builtin/init_eww.el"
;;;;;;  "builtin/init_flycheck.el" "builtin/init_flymake.el" "builtin/init_gnus.el"
;;;;;;  "builtin/init_grep.el" "builtin/init_ido.el" "builtin/init_indent.el"
;;;;;;  "builtin/init_info.el" "builtin/init_isearch.el" "builtin/init_ispell.el"
;;;;;;  "builtin/init_js.el" "builtin/init_lisp-mode.el" "builtin/init_nxml-mode.el"
;;;;;;  "builtin/init_ob.el" "builtin/init_org-indent.el" "builtin/init_ox-html.el"
;;;;;;  "builtin/init_ox-latex.el" "builtin/init_paren.el" "builtin/init_po-mode.el"
;;;;;;  "builtin/init_prog-mode.el" "builtin/init_python.el" "builtin/init_recentf.el"
;;;;;;  "builtin/init_remember.el" "builtin/init_ruby-mode.el" "builtin/init_savehist.el"
;;;;;;  "builtin/init_server.el" "builtin/init_sgml-mode.el" "builtin/init_sh-script.el"
;;;;;;  "builtin/init_shr.el" "builtin/init_tool-bar.el" "builtin/init_tramp.el"
;;;;;;  "builtin/init_verilog-mode.el" "builtin/init_view.el" "builtin/init_whitespace.el"
;;;;;;  "builtin/init_windmove.el" "depend/depend_emacs24.el" "depend/depend_emacs25.el"
;;;;;;  "depend/depend_main.el" "depend/depend_windows.el" "my_autoload.el"
;;;;;;  "my_automode.el" "my_font.el" "my_hooks.el" "my_paths.el"
;;;;;;  "pkg_conf/init_ac_irony.el" "pkg_conf/init_ac_slime.el" "pkg_conf/init_ace-jump-mode.el"
;;;;;;  "pkg_conf/init_android-mode.el" "pkg_conf/init_anzu.el" "pkg_conf/init_arduino-mode.el"
;;;;;;  "pkg_conf/init_auto-async-byte-compile.el" "pkg_conf/init_auto-capitalize.el"
;;;;;;  "pkg_conf/init_auto-java-complete.el" "pkg_conf/init_bm.el"
;;;;;;  "pkg_conf/init_bpe.el" "pkg_conf/init_c-eldoc.el" "pkg_conf/init_calfw-gcal.el"
;;;;;;  "pkg_conf/init_calfw.el" "pkg_conf/init_cider.el" "pkg_conf/init_clojure-mode.el"
;;;;;;  "pkg_conf/init_coffee-mode.el" "pkg_conf/init_company-c-headers.el"
;;;;;;  "pkg_conf/init_company.el" "pkg_conf/init_eclim.el" "pkg_conf/init_eiji.el"
;;;;;;  "pkg_conf/init_el-get.el" "pkg_conf/init_eldoc.el" "pkg_conf/init_ensime.el"
;;;;;;  "pkg_conf/init_evil-macros.el" "pkg_conf/init_evil-surround.el"
;;;;;;  "pkg_conf/init_evil.el" "pkg_conf/init_festival.el" "pkg_conf/init_fold_dwim.el"
;;;;;;  "pkg_conf/init_ger.el" "pkg_conf/init_ggtags.el" "pkg_conf/init_go-mode.el"
;;;;;;  "pkg_conf/init_google-translate.el" "pkg_conf/init_grammar.el"
;;;;;;  "pkg_conf/init_grep-a-lot.el" "pkg_conf/init_hangman.el"
;;;;;;  "pkg_conf/init_haskell-emacs.el" "pkg_conf/init_haskell-font-lock.el"
;;;;;;  "pkg_conf/init_haskell-mode.el" "pkg_conf/init_helm-ag-r.el"
;;;;;;  "pkg_conf/init_helm-ag.el" "pkg_conf/init_helm-config.el"
;;;;;;  "pkg_conf/init_helm-files.el" "pkg_conf/init_helm-github-issues.el"
;;;;;;  "pkg_conf/init_helm-go.el" "pkg_conf/init_helm-gtags.el"
;;;;;;  "pkg_conf/init_helm-migemo.el" "pkg_conf/init_helm-rb.el"
;;;;;;  "pkg_conf/init_highlight-indentation.el" "pkg_conf/init_hl-line.el"
;;;;;;  "pkg_conf/init_idle-require.el" "pkg_conf/init_image-dired+.el"
;;;;;;  "pkg_conf/init_info.el" "pkg_conf/init_jade.el" "pkg_conf/init_javadoc-lookup.el"
;;;;;;  "pkg_conf/init_jedi.el" "pkg_conf/init_js-console.el" "pkg_conf/init_js2-mode.el"
;;;;;;  "pkg_conf/init_jstestmacs.el" "pkg_conf/init_keyboard-converter.el"
;;;;;;  "pkg_conf/init_keychord.el" "pkg_conf/init_logalimacs.el"
;;;;;;  "pkg_conf/init_lookup.el" "pkg_conf/init_lua-mode.el" "pkg_conf/init_magit.el"
;;;;;;  "pkg_conf/init_markdown-mode.el" "pkg_conf/init_masaw.el"
;;;;;;  "pkg_conf/init_mew.el" "pkg_conf/init_migemo.el" "pkg_conf/init_milkboy.el"
;;;;;;  "pkg_conf/init_mmm-mode.el" "pkg_conf/init_mode-compile.el"
;;;;;;  "pkg_conf/init_moz.el" "pkg_conf/init_mozc.el" "pkg_conf/init_multiple-cursors.el"
;;;;;;  "pkg_conf/init_mykie.el" "pkg_conf/init_newsticker.el" "pkg_conf/init_nim-mode.el"
;;;;;;  "pkg_conf/init_node-console.el" "pkg_conf/init_nyan-mode.el"
;;;;;;  "pkg_conf/init_open-junk-file.el" "pkg_conf/init_org-mobile.el"
;;;;;;  "pkg_conf/init_org-trello.el" "pkg_conf/init_outline.el"
;;;;;;  "pkg_conf/init_package.el" "pkg_conf/init_pangu-spacing.el"
;;;;;;  "pkg_conf/init_paredit.el" "pkg_conf/init_perl-mode.el" "pkg_conf/init_picture.el"
;;;;;;  "pkg_conf/init_popwin.el" "pkg_conf/init_powerline.el" "pkg_conf/init_python.el"
;;;;;;  "pkg_conf/init_refe.el" "pkg_conf/init_rsense.el" "pkg_conf/init_rust-mode.el"
;;;;;;  "pkg_conf/init_sbtp.el" "pkg_conf/init_scala-mode.el" "pkg_conf/init_sdic-inline.el"
;;;;;;  "pkg_conf/init_sdic.el" "pkg_conf/init_skk-b.el" "pkg_conf/init_skk-server.el"
;;;;;;  "pkg_conf/init_skk.el" "pkg_conf/init_skype.el" "pkg_conf/init_slime.el"
;;;;;;  "pkg_conf/init_smart-tabs-mode.el" "pkg_conf/init_smartparens.el"
;;;;;;  "pkg_conf/init_sql.el" "pkg_conf/init_tabbar.el" "pkg_conf/init_twittering-mode.el"
;;;;;;  "pkg_conf/init_undo-tree.el" "pkg_conf/init_w3m.el" "pkg_conf/init_web-mode.el"
;;;;;;  "pkg_conf/init_wgrep.el" "pkg_conf/init_winner.el" "pkg_conf/init_xmp.el"
;;;;;;  "pkg_conf/init_yaml-mode.el" "pkg_conf/init_yasnippet.el"
;;;;;;  "pkg_conf/init_yatemplate.el" "pkg_conf/init_yim.el" "pkg_conf/init_zencoding.el"
;;;;;;  "site-start.el" "style/my_modeline.el") (21946 32489 459159
;;;;;;  213000))

;;;***

(provide 'yy-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; yy-loaddefs.el ends here
