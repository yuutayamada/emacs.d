;;; Y-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "../default" "../default.el" (0 0 0 0))
;;; Generated autoloads from ../default.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../default" '("el-get-is-lazy")))

;;;***

;;;### (autoloads nil "Y-autoload" "Y-autoload.el" (0 0 0 0))
;;; Generated autoloads from Y-autoload.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y-autoload" '(#("Y/autoload-files" 0 16 (face font-lock-variable-name-face fontified t)))))

;;;***

;;;### (autoloads nil "Y-el-get" "Y-el-get.el" (0 0 0 0))
;;; Generated autoloads from Y-el-get.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y-el-get" '("el-get-u" "Y/el-get-npm-install-maybe")))

;;;***

;;;### (autoloads nil "Y-elisp-mode" "Y-elisp-mode.el" (0 0 0 0))
;;; Generated autoloads from Y-elisp-mode.el

(autoload 'Y-init-elisp-config "Y-elisp-mode" "\
Setup my Emacs Lisp config.
This function is called from site-start.el.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "Y-font" "Y-font.el" (0 0 0 0))
;;; Generated autoloads from Y-font.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y-font" '("my/parse-xlfd-font-style" "Y/init-fontset")))

;;;***

;;;### (autoloads nil "Y-function" "Y-function.el" (0 0 0 0))
;;; Generated autoloads from Y-function.el

(autoload 'other-window-or-split "Y-function" "\
Move buffer or split when buffer was one.

\(fn &rest R)" t nil)

(autoload 'Y/split-window-spirally "Y-function" "\


\(fn)" t nil)

(autoload 'Y/reverse-transpose-chars "Y-function" "\


\(fn)" t nil)

(autoload 'Y/swap-key "Y-function" "\


\(fn KEYMAP &rest KEYS)" nil nil)

(autoload 'Y/org-src-block-p "Y-function" "\
Return t when inside #+begin_src ... .

\(fn)" nil nil)

(autoload 'Y/org-src-edit-buffer-p "Y-function" "\
Return t when created other inside *Org Src ...* buffer.

\(fn)" nil nil)

(autoload 'my/kill-line "Y-function" "\


\(fn)" nil nil)

(autoload 'my/screen-shot "Y-function" "\


\(fn)" t nil)

(autoload 'my/remap-semicolon "Y-function" "\
Reverse Colon and Semi Colon at specified key MAP.

\(fn MAP)" nil nil)

(autoload 'Y/ssh-add "Y-function" "\
Add ssh-key if it was needed when using magit.  You may neeed ssh-askpath.

Example of my/keys
 (\"git@github.com\\|https://github.com\" . \"~/.ssh/rsa_github_key\")

\(fn &rest R)" t nil)

(autoload 'Y/show-cheat-sheet "Y-function" "\
Popup a buffer by popwin which is related to current ‘major-mode’.

\(fn)" t nil)

(autoload 'my/get-above-dir-name "Y-function" "\


\(fn)" nil nil)

(autoload 'my/in-dir-p "Y-function" "\


\(fn DIRECTORY)" nil nil)

(autoload 'my/execute-from-current-file "Y-function" "\


\(fn &optional STATEMENT)" t nil)

(autoload 'my/copy-current-file-name "Y-function" "\


\(fn)" t nil)

(autoload 'my/kill-backward-word "Y-function" "\


\(fn)" nil nil)

(autoload 'my/newline-and-indent "Y-function" "\
My better newline and indent.

\(fn)" t nil)

(autoload 'my/reset-bg-color "Y-function" "\


\(fn &optional COLOR)" t nil)

(autoload 'Y/echo-current-point "Y-function" "\


\(fn)" t nil)

(autoload 'Y/toggle-truncate-lines "Y-function" "\
My toggle truncate lines.

\(fn)" t nil)

(autoload 'Y/lookup-stardict "Y-function" "\
Lookup word by stardict.

\(fn)" t nil)

(autoload 'Y/visual-fill-mode "Y-function" "\
Show filled sentences by visual line mode.
If ARG is non-nil, turn on visual mode stuff.

\(fn &optional ARG)" t nil)

(autoload 'replace-last-sexp "Y-function" "\
Replace last sexp.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y-function" '(#("test" 0 4 (fontified nil)) #("my/" 0 3 (fontified nil)) #("Y/" 0 2 (fontified t face font-lock-variable-name-face)) #("banish" 0 6 (face font-lock-function-name-face fontified t)))))

;;;***

;;;### (autoloads nil "Y-modeline" "Y-modeline.el" (0 0 0 0))
;;; Generated autoloads from Y-modeline.el

(autoload 'Y/clean-mode-line "Y-modeline" "\
Use specified abbreviation of mode-line-name by `mode-line-cleaner-alist'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y-modeline" '("mode-line-cleaner-alist")))

;;;***

;;;### (autoloads nil "Y-paths" "Y-paths.el" (0 0 0 0))
;;; Generated autoloads from Y-paths.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y-paths" '("config-dir" "user-init-file")))

;;;***

;;;### (autoloads nil "Y-premitives" "Y-premitives.el" (0 0 0 0))
;;; Generated autoloads from Y-premitives.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y-premitives" '("ido-" "Y/original-cut-and-paste" "remember-notes-initial-major-mode" "recentf-max-")))

;;;***

;;;### (autoloads nil "Y-util" "Y-util.el" (0 0 0 0))
;;; Generated autoloads from Y-util.el

(autoload 'Y/load-packages "Y-util" "\
Load PACKAGES.

\(fn PACKAGES)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "Y-util" '("Y/" "autoloader-autoload")))

;;;***

;;;### (autoloads nil nil ("../emacs-custom.el" "../site-start.el"
;;;;;;  "Y-hooks.el" "Y-prog-mode.el") (0 0 0 0))

;;;***

(provide 'Y-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; Y-loaddefs.el ends here
