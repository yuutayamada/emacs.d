;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "ac-irony/ac-irony" "ac-irony/ac-irony.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ac-irony/ac-irony.el

(defvar ac-source-irony '((cache) (requires . -1) (limit) (prefix . ac-irony-prefix) (candidates . ac-irony-candidates)))

(autoload 'ac-complete-irony "ac-irony/ac-irony" "\


\(fn)" t nil)

(autoload 'ac-complete-irony-async "ac-irony/ac-irony" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "ag/ag" "ag/ag.el" (0 0 0 0))
;;; Generated autoloads from ag/ag.el

(autoload 'ag "ag/ag" "\
Search using ag in a given DIRECTORY for a given search STRING,
with STRING defaulting to the symbol under point.

If called with a prefix, prompts for flags to pass to ag.

\(fn STRING DIRECTORY)" t nil)

(autoload 'ag-files "ag/ag" "\
Search using ag in a given DIRECTORY for a given search STRING,
limited to files that match FILE-TYPE. STRING defaults to
the symbol under point.

If called with a prefix, prompts for flags to pass to ag.

\(fn STRING FILE-TYPE DIRECTORY)" t nil)

(autoload 'ag-regexp "ag/ag" "\
Search using ag in a given directory for a given regexp.
The regexp should be in PCRE syntax, not Emacs regexp syntax.

If called with a prefix, prompts for flags to pass to ag.

\(fn STRING DIRECTORY)" t nil)

(autoload 'ag-project "ag/ag" "\
Guess the root of the current project and search it with ag
for the given string.

If called with a prefix, prompts for flags to pass to ag.

\(fn STRING)" t nil)

(autoload 'ag-project-files "ag/ag" "\
Search using ag for a given search STRING,
limited to files that match FILE-TYPE. STRING defaults to the
symbol under point.

If called with a prefix, prompts for flags to pass to ag.

\(fn STRING FILE-TYPE)" t nil)

(autoload 'ag-project-regexp "ag/ag" "\
Guess the root of the current project and search it with ag
for the given regexp. The regexp should be in PCRE syntax, not
Emacs regexp syntax.

If called with a prefix, prompts for flags to pass to ag.

\(fn REGEXP)" t nil)

(defalias 'ag-project-at-point 'ag-project)

(defalias 'ag-regexp-project-at-point 'ag-project-regexp)

(autoload 'ag-dired "ag/ag" "\
Recursively find files in DIR matching PATTERN.

The PATTERN is matched against the full path to the file, not
only against the file name.

The results are presented as a `dired-mode' buffer with
`default-directory' being DIR.

See also `ag-dired-regexp'.

\(fn DIR PATTERN)" t nil)

(autoload 'ag-dired-regexp "ag/ag" "\
Recursively find files in DIR matching REGEXP.
REGEXP should be in PCRE syntax, not Emacs regexp syntax.

The REGEXP is matched against the full path to the file, not
only against the file name.

Results are presented as a `dired-mode' buffer with
`default-directory' being DIR.

See also `find-dired'.

\(fn DIR REGEXP)" t nil)

(autoload 'ag-project-dired "ag/ag" "\
Recursively find files in current project matching PATTERN.

See also `ag-dired'.

\(fn PATTERN)" t nil)

(autoload 'ag-project-dired-regexp "ag/ag" "\
Recursively find files in current project matching REGEXP.

See also `ag-dired-regexp'.

\(fn REGEXP)" t nil)

(autoload 'ag-kill-buffers "ag/ag" "\
Kill all `ag-mode' buffers.

\(fn)" t nil)

(autoload 'ag-kill-other-buffers "ag/ag" "\
Kill all `ag-mode' buffers other than the current buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "ample-regexps/ample-regexps" "ample-regexps/ample-regexps.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ample-regexps/ample-regexps.el

(autoload 'define-arx "ample-regexps/ample-regexps" "\
Generate a custom rx-like macro under name MACRO.

See `rx' for how the generated macro can be invoked.

FORM-DEFS is a list of custom s-exp definitions to create whose
elements have the form (SYM DEF), where DEF is one of
the following:

- \"LITERAL\" -- create a matcher to match a string literally

- (regexp \"LITERAL\") -- create a match given a regexp

- SYMBOL -- create an alias for a symbol either defined earlier
  on the list or provided by `rx'

- (SUBFORM ...) -- create an alias for an application of s-exp
  subform either defined earlier on the list or provided by `rx'

- (:func #'FORM-FUNC ...) -- create an s-exp definition

The most interesting here is the last variant.  When a
corresponding rx form will be encountered, FORM-FUNC will be
called with all elements of that form as arguments (with the
first one being the form symbol itself).  FORM-FUNC must then
return a valid s-exp or a properly grouped plain regexp.

Another keywords that are recognized in the plist are:
- :min-args -- minimum number of arguments for that form (default nil)
- :max-args -- maximum number of arguments for that form (default nil)
- :predicate -- if given, all rx form arguments must satisfy it

\(fn MACRO FORM-DEFS)" nil t)

(autoload 'arx-and "ample-regexps/ample-regexps" "\
Generate an expression to match a sequence of FORMS.

\(fn FORMS)" nil nil)

(autoload 'arx-or "ample-regexps/ample-regexps" "\
Generate an expression to match one of FORMS.

\(fn FORMS)" nil nil)

(autoload 'arx-builder "ample-regexps/ample-regexps" "\
Run `re-builder' using arx form named ARX-NAME.

\(fn &optional ARX-NAME)" t nil)

;;;***

;;;### (autoloads nil "anzu/anzu" "anzu/anzu.el" (0 0 0 0))
;;; Generated autoloads from anzu/anzu.el

(autoload 'anzu-mode "anzu/anzu" "\
minor-mode which display search information in mode-line.

\(fn &optional ARG)" t nil)

(defvar global-anzu-mode nil "\
Non-nil if Global Anzu mode is enabled.
See the `global-anzu-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-anzu-mode'.")

(custom-autoload 'global-anzu-mode "anzu/anzu" nil)

(autoload 'global-anzu-mode "anzu/anzu" "\
Toggle Anzu mode in all buffers.
With prefix ARG, enable Global Anzu mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Anzu mode is enabled in all buffers where
`anzu--turn-on' would do it.
See `anzu-mode' for more information on Anzu mode.

\(fn &optional ARG)" t nil)

(autoload 'anzu-query-replace-at-cursor "anzu/anzu" "\


\(fn)" t nil)

(autoload 'anzu-query-replace-at-cursor-thing "anzu/anzu" "\


\(fn)" t nil)

(autoload 'anzu-query-replace "anzu/anzu" "\


\(fn ARG)" t nil)

(autoload 'anzu-query-replace-regexp "anzu/anzu" "\


\(fn ARG)" t nil)

(autoload 'anzu-replace-at-cursor-thing "anzu/anzu" "\


\(fn)" t nil)

(autoload 'anzu-isearch-query-replace "anzu/anzu" "\


\(fn ARG)" t nil)

(autoload 'anzu-isearch-query-replace-regexp "anzu/anzu" "\


\(fn ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "anzu/anzu" '("anzu-")))

;;;***

;;;### (autoloads nil "auto-capitalize/auto-capitalize" "auto-capitalize/auto-capitalize.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from auto-capitalize/auto-capitalize.el

(autoload 'auto-capitalize-mode "auto-capitalize/auto-capitalize" "\
Toggle `auto-capitalize' minor mode in this buffer.
With optional prefix ARG, turn `auto-capitalize' mode on iff ARG is positive.
This sets `auto-capitalize' to t or nil (for this buffer) and ensures that
`auto-capitalize' is installed in `after-change-functions' (for all buffers).

\(fn &optional ARG)" t nil)

(autoload 'turn-on-auto-capitalize-mode "auto-capitalize/auto-capitalize" "\
Turn on `auto-capitalize' mode in this buffer.
This sets `auto-capitalize' to t.

\(fn)" t nil)

(autoload 'turn-off-auto-capitalize-mode "auto-capitalize/auto-capitalize" "\
Turn off `auto-capitalize' mode in this buffer.
This sets `auto-capitalize' to nil.

\(fn)" t nil)

(autoload 'enable-auto-capitalize-mode "auto-capitalize/auto-capitalize" "\
Enable `auto-capitalize' mode in this buffer.
This sets `auto-capitalize' to `query'.

\(fn)" t nil)

(autoload 'auto-capitalize-setup "auto-capitalize/auto-capitalize" "\


\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "auto-capitalize/auto-capitalize" '(#("auto-capitalize" 0 13 (fontified nil face font-lock-function-name-face) 13 15 (fontified nil face font-lock-function-name-face)))))

;;;***

;;;### (autoloads nil "auto-compile/auto-compile" "auto-compile/auto-compile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from auto-compile/auto-compile.el

(autoload 'auto-compile-mode "auto-compile/auto-compile" "\
Compile Emacs Lisp source files after the visiting buffers are saved.

After a buffer containing Emacs Lisp code is saved to its source
file update the respective byte code file.  If the latter does
not exist do nothing.  Therefore to disable automatic compilation
remove the byte code file.  See command `toggle-auto-compile' for
a convenient way to do so.

This mode should be enabled globally, using it's globalized
variant `auto-compile-on-save-mode'.  Also see the related
`auto-compile-on-load-mode'.

\(fn &optional ARG)" t nil)

(defvar auto-compile-on-save-mode nil "\
Non-nil if Auto-Compile-On-Save mode is enabled.
See the `auto-compile-on-save-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `auto-compile-on-save-mode'.")

(custom-autoload 'auto-compile-on-save-mode "auto-compile/auto-compile" nil)

(autoload 'auto-compile-on-save-mode "auto-compile/auto-compile" "\
Toggle Auto-Compile mode in all buffers.
With prefix ARG, enable Auto-Compile-On-Save mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Compile mode is enabled in all buffers where
`turn-on-auto-compile-mode' would do it.
See `auto-compile-mode' for more information on Auto-Compile mode.

\(fn &optional ARG)" t nil)

(autoload 'toggle-auto-compile "auto-compile/auto-compile" "\
Toggle automatic compilation of an Emacs Lisp source file or files.

Read a file or directory name from the minibuffer defaulting to
the visited Emacs Lisp source file or `default-directory' if no
such file is being visited in the current buffer.

If the user selects a file then automatic compilation of only
that file is toggled.  Since both `auto-compile-on-save' and
`auto-compile-on-save' only ever _recompile_ byte code files,
toggling automatic compilation is done simply by creating or
removing the respective byte code file.

If the user selects a directory then automatic compilation for
multiple files is toggled as follows:

* With a positive prefix argument always compile source files;
  with a negative prefix argument always remove byte code files.

* Otherwise the existence or absence of the byte code file of
  the source file that was current when this command was invoked
  determines whether byte code files should be created or removed.

* If no Emacs Lisp source file is being visited in the buffer
  that was current when the command was invoked ask the user what
  to do.

* When _removing_ byte code files then all byte code files are
  removed.  If `auto-compile-deletes-stray-dest' is non-nil this
  even includes byte code files for which no source file exists.

* When _creating_ byte code files only do so for source files
  that are actual libraries.  Source files that provide the
  correct feature are considered to be libraries; see
  `packed-library-p'.

* Note that non-libraries can still be automatically compiled,
  you just cannot _recursively_ turn on automatic compilation
  using this command.

* When `auto-compile-toggle-recompiles' is non-nil recompile all
  affected source files even when the respective source files are
  up-to-date.  Do so even for non-library source files.

* Only enter subdirectories for which `packed-ignore-directory-p'
  returns nil; most importantly don't enter hidden directories or
  those containing a file named \".nosearch\".

\(fn FILE ACTION)" t nil)

(defvar auto-compile-on-load-mode nil "\
Non-nil if Auto-Compile-On-Load mode is enabled.
See the `auto-compile-on-load-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `auto-compile-on-load-mode'.")

(custom-autoload 'auto-compile-on-load-mode "auto-compile/auto-compile" nil)

(autoload 'auto-compile-on-load-mode "auto-compile/auto-compile" "\
Before loading a library recompile it if it needs recompilation.

A library needs to be recompiled if the source file is newer than
it's byte-compile destination.  Without this advice the outdated
byte code file would be loaded instead.

Also see the related `auto-compile-on-save-mode'.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "auto-compile/auto-compile" '("auto-compile-" "mode-line-" "turn-on-auto-compile-mode")))

;;;***

;;;### (autoloads nil "auto-complete/auto-complete" "auto-complete/auto-complete.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from auto-complete/auto-complete.el

(autoload 'auto-complete "auto-complete/auto-complete" "\
Start auto-completion at current point.

\(fn &optional SOURCES)" t nil)

(autoload 'auto-complete-mode "auto-complete/auto-complete" "\
AutoComplete mode

\(fn &optional ARG)" t nil)

(defvar global-auto-complete-mode nil "\
Non-nil if Global Auto-Complete mode is enabled.
See the `global-auto-complete-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-auto-complete-mode'.")

(custom-autoload 'global-auto-complete-mode "auto-complete/auto-complete" nil)

(autoload 'global-auto-complete-mode "auto-complete/auto-complete" "\
Toggle Auto-Complete mode in all buffers.
With prefix ARG, enable Global Auto-Complete mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Complete mode is enabled in all buffers where
`auto-complete-mode-maybe' would do it.
See `auto-complete-mode' for more information on Auto-Complete mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "auto-complete/auto-complete-config" "auto-complete/auto-complete-config.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from auto-complete/auto-complete-config.el

(autoload 'ac-config-default "auto-complete/auto-complete-config" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "avy/avy" "avy/avy.el" (0 0 0 0))
;;; Generated autoloads from avy/avy.el

(autoload 'avy-goto-char "avy/avy" "\
Jump to the currently visible CHAR.
The window scope is determined by `avy-all-windows' (ARG negates it).

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-char-in-line "avy/avy" "\
Jump to the currently visible CHAR in the current line.

\(fn CHAR)" t nil)

(autoload 'avy-goto-char-2 "avy/avy" "\
Jump to the currently visible CHAR1 followed by CHAR2.
The window scope is determined by `avy-all-windows' (ARG negates it).

\(fn CHAR1 CHAR2 &optional ARG BEG END)" t nil)

(autoload 'avy-goto-char-2-above "avy/avy" "\
Jump to the currently visible CHAR1 followed by CHAR2.
This is a scoped version of `avy-goto-char-2', where the scope is
the visible part of the current buffer up to point.

\(fn CHAR1 CHAR2 &optional ARG)" t nil)

(autoload 'avy-goto-char-2-below "avy/avy" "\
Jump to the currently visible CHAR1 followed by CHAR2.
This is a scoped version of `avy-goto-char-2', where the scope is
the visible part of the current buffer following point.

\(fn CHAR1 CHAR2 &optional ARG)" t nil)

(autoload 'avy-isearch "avy/avy" "\
Jump to one of the current isearch candidates.

\(fn)" t nil)

(autoload 'avy-goto-word-0 "avy/avy" "\
Jump to a word start.
The window scope is determined by `avy-all-windows' (ARG negates it).

\(fn ARG)" t nil)

(autoload 'avy-goto-word-1 "avy/avy" "\
Jump to the currently visible CHAR at a word start.
The window scope is determined by `avy-all-windows' (ARG negates it).

\(fn CHAR &optional ARG BEG END SYMBOL)" t nil)

(autoload 'avy-goto-word-1-above "avy/avy" "\
Jump to the currently visible CHAR at a word start.
This is a scoped version of `avy-goto-word-1', where the scope is
the visible part of the current buffer up to point.

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-word-1-below "avy/avy" "\
Jump to the currently visible CHAR at a word start.
This is a scoped version of `avy-goto-word-1', where the scope is
the visible part of the current buffer following point.

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-symbol-1 "avy/avy" "\
Jump to the currently visible CHAR at a symbol start.
The window scope is determined by `avy-all-windows' (ARG negates it).

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-symbol-1-above "avy/avy" "\
Jump to the currently visible CHAR at a symbol start.
This is a scoped version of `avy-goto-symbol-1', where the scope is
the visible part of the current buffer up to point.

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-symbol-1-below "avy/avy" "\
Jump to the currently visible CHAR at a symbol start.
This is a scoped version of `avy-goto-symbol-1', where the scope is
the visible part of the current buffer following point.

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-subword-0 "avy/avy" "\
Jump to a word or subword start.

The window scope is determined by `avy-all-windows' (ARG negates it).

When PREDICATE is non-nil it's a function of zero parameters that
should return true.

\(fn &optional ARG PREDICATE)" t nil)

(autoload 'avy-goto-subword-1 "avy/avy" "\
Jump to the currently visible CHAR at a subword start.
The window scope is determined by `avy-all-windows' (ARG negates it).
The case of CHAR is ignored.

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-word-or-subword-1 "avy/avy" "\
Forward to `avy-goto-subword-1' or `avy-goto-word-1'.
Which one depends on variable `subword-mode'.

\(fn)" t nil)

(autoload 'avy-goto-line "avy/avy" "\
Jump to a line start in current buffer.

When ARG is 1, jump to lines currently visible, with the option
to cancel to `goto-line' by entering a number.

When ARG is 4, negate the window scope determined by
`avy-all-windows'.

Otherwise, forward to `goto-line' with ARG.

\(fn &optional ARG)" t nil)

(autoload 'avy-goto-line-above "avy/avy" "\
Goto visible line above the cursor.

\(fn)" t nil)

(autoload 'avy-goto-line-below "avy/avy" "\
Goto visible line below the cursor.

\(fn)" t nil)

(autoload 'avy-copy-line "avy/avy" "\
Copy a selected line above the current line.
ARG lines can be used.

\(fn ARG)" t nil)

(autoload 'avy-move-line "avy/avy" "\
Move a selected line above the current line.
ARG lines can be used.

\(fn ARG)" t nil)

(autoload 'avy-copy-region "avy/avy" "\
Select two lines and copy the text between them to point.

The window scope is determined by `avy-all-windows' or
`avy-all-windows-alt' when ARG is non-nil.

\(fn ARG)" t nil)

(autoload 'avy-move-region "avy/avy" "\
Select two lines and move the text between them here.

\(fn)" t nil)

(autoload 'avy-setup-default "avy/avy" "\
Setup the default shortcuts.

\(fn)" nil nil)

(autoload 'avy-goto-char-timer "avy/avy" "\
Read one or many consecutive chars and jump to the first one.
The window scope is determined by `avy-all-windows' (ARG negates it).

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "buttercup/buttercup" "buttercup/buttercup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from buttercup/buttercup.el

(autoload 'buttercup-run-at-point "buttercup/buttercup" "\
Run the buttercup suite at point.

\(fn)" t nil)

(autoload 'buttercup-run-discover "buttercup/buttercup" "\
Discover and load test files, then run all defined suites.

Takes directories as command line arguments, defaulting to the
current directory.

\(fn)" nil nil)

(autoload 'buttercup-run-markdown "buttercup/buttercup" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "chumpy-windows/spaces" "chumpy-windows/spaces.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from chumpy-windows/spaces.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "chumpy-windows/spaces" '("sp-")))

;;;***

;;;### (autoloads nil "chumpy-windows/splitter" "chumpy-windows/splitter.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from chumpy-windows/splitter.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "chumpy-windows/splitter" '("spl-")))

;;;***

;;;### (autoloads nil "chumpy-windows/window-jump" "chumpy-windows/window-jump.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from chumpy-windows/window-jump.el

(autoload 'window-jump-left "chumpy-windows/window-jump" "\
Move to the window to the left of the current window.

\(fn)" t nil)

(autoload 'window-jump-right "chumpy-windows/window-jump" "\
Move to the window to the right of the current window.

\(fn)" t nil)

(autoload 'window-jump-down "chumpy-windows/window-jump" "\
Move to the window below the current window.

\(fn)" t nil)

(autoload 'window-jump-up "chumpy-windows/window-jump" "\
Move to the window above the current window.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "chumpy-windows/window-jump" '("wj-" "window-jump" "-wj-inf")))

;;;***

;;;### (autoloads nil "commenter/commenter" "commenter/commenter.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from commenter/commenter.el

(autoload 'commenter-setup "commenter/commenter" "\
Add advises to ‘comment-normalize-vars’.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "commenter/commenter" '("commenter-")))

;;;***

;;;### (autoloads nil "company-c-headers/company-c-headers" "company-c-headers/company-c-headers.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-c-headers/company-c-headers.el

(autoload 'company-c-headers "company-c-headers/company-c-headers" "\
Company backend for C/C++ header files.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-flx/company-flx" "company-flx/company-flx.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-flx/company-flx.el

(defvar company-flx-mode nil "\
Non-nil if Company-Flx mode is enabled.
See the `company-flx-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `company-flx-mode'.")

(custom-autoload 'company-flx-mode "company-flx/company-flx" nil)

(autoload 'company-flx-mode "company-flx/company-flx" "\
company-flx minor mode

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "company-irony/company-irony" "company-irony/company-irony.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-irony/company-irony.el

(autoload 'company-irony "company-irony/company-irony" "\


\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'company-irony-setup-begin-commands "company-irony/company-irony" "\
Include irony trigger commands to `company-begin-commands'.

This allow completion to be automatically triggered after member
accesses (obj.|, obj->|, ...).

This may be useful to company < `0.8.4', newer version of company
include these commands by default.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "company-mode/company" "company-mode/company.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company.el

(autoload 'company-mode "company-mode/company" "\
\"complete anything\"; is an in-buffer completion framework.
Completion starts automatically, depending on the values
`company-idle-delay' and `company-minimum-prefix-length'.

Completion can be controlled with the commands:
`company-complete-common', `company-complete-selection', `company-complete',
`company-select-next', `company-select-previous'.  If these commands are
called before `company-idle-delay', completion will also start.

Completions can be searched with `company-search-candidates' or
`company-filter-candidates'.  These can be used while completion is
inactive, as well.

The completion data is retrieved using `company-backends' and displayed
using `company-frontends'.  If you want to start a specific backend, call
it interactively or use `company-begin-backend'.

By default, the completions list is sorted alphabetically, unless the
backend chooses otherwise, or `company-transformers' changes it later.

regular keymap (`company-mode-map'):

\\{company-mode-map}
keymap during active completions (`company-active-map'):

\\{company-active-map}

\(fn &optional ARG)" t nil)

(defvar global-company-mode nil "\
Non-nil if Global Company mode is enabled.
See the `global-company-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-company-mode'.")

(custom-autoload 'global-company-mode "company-mode/company" nil)

(autoload 'global-company-mode "company-mode/company" "\
Toggle Company mode in all buffers.
With prefix ARG, enable Global Company mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Company mode is enabled in all buffers where
`company-mode-on' would do it.
See `company-mode' for more information on Company mode.

\(fn &optional ARG)" t nil)

(autoload 'company-manual-begin "company-mode/company" "\


\(fn)" t nil)

(autoload 'company-complete "company-mode/company" "\
Insert the common part of all candidates or the current selection.
The first time this is called, the common part is inserted, the second
time, or when the selection has been changed, the selected candidate is
inserted.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-abbrev" "company-mode/company-abbrev.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-abbrev.el

(autoload 'company-abbrev "company-mode/company-abbrev" "\
`company-mode' completion backend for abbrev.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-bbdb" "company-mode/company-bbdb.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-bbdb.el

(autoload 'company-bbdb "company-mode/company-bbdb" "\
`company-mode' completion backend for BBDB.

\(fn COMMAND &optional ARG &rest IGNORE)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-css" "company-mode/company-css.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-css.el

(autoload 'company-css "company-mode/company-css" "\
`company-mode' completion backend for `css-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-dabbrev" "company-mode/company-dabbrev.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-dabbrev.el

(autoload 'company-dabbrev "company-mode/company-dabbrev" "\
dabbrev-like `company-mode' completion backend.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-dabbrev-code" "company-mode/company-dabbrev-code.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-dabbrev-code.el

(autoload 'company-dabbrev-code "company-mode/company-dabbrev-code" "\
dabbrev-like `company-mode' backend for code.
The backend looks for all symbols in the current buffer that aren't in
comments or strings.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-elisp" "company-mode/company-elisp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-elisp.el

(autoload 'company-elisp "company-mode/company-elisp" "\
`company-mode' completion backend for Emacs Lisp.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-etags" "company-mode/company-etags.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-etags.el

(autoload 'company-etags "company-mode/company-etags" "\
`company-mode' completion backend for etags.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-files" "company-mode/company-files.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-files.el

(autoload 'company-files "company-mode/company-files" "\
`company-mode' completion backend existing file names.
Completions works for proper absolute and relative files paths.
File paths with spaces are only supported inside strings.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-gtags" "company-mode/company-gtags.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-gtags.el

(autoload 'company-gtags "company-mode/company-gtags" "\
`company-mode' completion backend for GNU Global.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-ispell" "company-mode/company-ispell.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-ispell.el

(autoload 'company-ispell "company-mode/company-ispell" "\
`company-mode' completion backend using Ispell.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-keywords" "company-mode/company-keywords.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-keywords.el

(autoload 'company-keywords "company-mode/company-keywords" "\
`company-mode' backend for programming language keywords.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-nxml" "company-mode/company-nxml.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-nxml.el

(autoload 'company-nxml "company-mode/company-nxml" "\
`company-mode' completion backend for `nxml-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-oddmuse" "company-mode/company-oddmuse.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-oddmuse.el

(autoload 'company-oddmuse "company-mode/company-oddmuse" "\
`company-mode' completion backend for `oddmuse-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-semantic" "company-mode/company-semantic.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-semantic.el

(autoload 'company-semantic "company-mode/company-semantic" "\
`company-mode' completion backend using CEDET Semantic.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-tempo" "company-mode/company-tempo.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-tempo.el

(autoload 'company-tempo "company-mode/company-tempo" "\
`company-mode' completion backend for tempo.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-xcode" "company-mode/company-xcode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-xcode.el

(autoload 'company-xcode "company-mode/company-xcode" "\
`company-mode' completion backend for Xcode projects.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-yasnippet" "company-mode/company-yasnippet.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-mode/company-yasnippet.el

(autoload 'company-yasnippet "company-mode/company-yasnippet" "\
`company-mode' backend for `yasnippet'.

This backend should be used with care, because as long as there are
snippets defined for the current major mode, this backend will always
shadow backends that come after it.  Recommended usages:

* In a buffer-local value of `company-backends', grouped with a backend or
  several that provide actual text completions.

  (add-hook 'js-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   '((company-dabbrev-code company-yasnippet)))))

* After keyword `:with', grouped with other backends.

  (push '(company-semantic :with company-yasnippet) company-backends)

* Not in `company-backends', just bound to a key.

  (global-set-key (kbd \"C-c y\") 'company-yasnippet)

\(fn COMMAND &optional ARG &rest IGNORE)" t nil)

;;;***

;;;### (autoloads nil "contrast-color-picker/contrast-color-picker"
;;;;;;  "contrast-color-picker/contrast-color-picker.el" (0 0 0 0))
;;; Generated autoloads from contrast-color-picker/contrast-color-picker.el

(autoload 'contrast-color-picker "contrast-color-picker/contrast-color-picker" "\
Return most contrasted color against COLOR.
The return color picked from ‘contrast-color-picker-color-candidates’.
The algorithm is used CIEDE2000. See also ‘color-cie-de2000’ function.

\(fn COLOR)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "contrast-color-picker/contrast-color-picker" '("contrast-color-picker-")))

;;;***

;;;### (autoloads nil "direx/direx" "direx/direx.el" (0 0 0 0))
;;; Generated autoloads from direx/direx.el

(autoload 'direx:jump-to-directory "direx/direx" "\


\(fn)" t nil)

(autoload 'direx:jump-to-directory-other-window "direx/direx" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "direx/direx-project" "direx/direx-project.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from direx/direx-project.el

(autoload 'direx-project:jump-to-project-root "direx/direx-project" "\


\(fn)" t nil)

(autoload 'direx-project:jump-to-project-root-other-window "direx/direx-project" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "dockerfile-mode/dockerfile-mode" "dockerfile-mode/dockerfile-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dockerfile-mode/dockerfile-mode.el

(autoload 'dockerfile-build-buffer "dockerfile-mode/dockerfile-mode" "\
Build an image based upon the buffer

\(fn IMAGE-NAME)" t nil)

(autoload 'dockerfile-build-no-cache-buffer "dockerfile-mode/dockerfile-mode" "\
Build an image based upon the buffer without cache

\(fn IMAGE-NAME)" t nil)

(autoload 'dockerfile-mode "dockerfile-mode/dockerfile-mode" "\
A major mode to edit Dockerfiles.
\\{dockerfile-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("Dockerfile.*\\'" . dockerfile-mode))

;;;***

;;;### (autoloads nil "el-get/el-get" "el-get/el-get.el" (0 0 0 0))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-install "el-get/el-get" "\
Cause the named PACKAGE to be installed after all of its
dependencies (if any).

PACKAGE may be either a string or the corresponding symbol.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update "el-get/el-get" "\
Update PACKAGE.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-update-packages-of-type "el-get/el-get" "\
Update all installed packages of type TYPE.

\(fn TYPE)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-remove "el-get/el-get" "\
Remove any PACKAGE that is know to be installed or required.

\(fn PACKAGE)" t nil)

(autoload 'el-get-reinstall "el-get/el-get" "\
Remove PACKAGE and then install it again.

\(fn PACKAGE)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE)" t nil)

(autoload 'el-get-self-checksum "el-get/el-get" "\
Compute the checksum of the running version of el-get itself.

Also put the checksum in the kill-ring.

\(fn)" t nil)

(autoload 'el-get "el-get/el-get" "\
Ensure that packages have been downloaded once and init them as needed.

This will not update the sources by using `apt-get install' or
`git pull', but it will ensure that:

* the packages have been installed
* load-path is set so their elisp files can be found
* Info-directory-list is set so their info files can be found
* Autoloads have been prepared and evaluated for each package
* Any post-installation setup (e.g. `(require 'feature)') happens

When SYNC is nil (the default), all installations run
concurrently, in the background.

When SYNC is 'sync, each package will be installed synchronously,
and any error will stop it all.

Please note that the `el-get-init' part of `el-get' is always
done synchronously. There's `byte-compile' support though, and
the packages you use are welcome to use `autoload' too.

PACKAGES is expected to be a list of packages you want to install
or init.  When PACKAGES is omited (the default), the list of
already installed packages is considered.

\(fn &optional SYNC &rest PACKAGES)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get" '(#("el-get-" 0 7 (fontified nil face font-lock-function-name-face)))))

;;;***

;;;### (autoloads nil "el-get/el-get-bundle" "el-get/el-get-bundle.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-bundle.el

(autoload 'el-get-bundle-el-get "el-get/el-get-bundle" "\


\(fn SRC)" nil nil)

(autoload 'el-get-bundle "el-get/el-get-bundle" "\
Install PACKAGE and run initialization FORM.

PACKAGE can be either a simple package name or a package name
with a modifier before the name to specify local recipe source
information:

* `<owner>/' : specifies a Github owner name
* `gist:<id>' : specifies a Gist ID
* `<type>:' : specifies a type of the package source

If `FEATURE in PACKAGE' form is used instead of PACKAGE, then
that FEATURE is `require'd after installing PACKAGE.  You can
also use `el-get-bundle!' macro if FEATURE and PACKAGE are the
same.  If you wish to `require' more than one feature, then use
`:features' property in FORM.

The initialization FORM may start with a property list that
describes a local recipe.  The FORM after the property list is
treated as initialization code, which is actually an `:after'
property of the local recipe.

A copy of the initialization code is stored in a directory
specified by `el-get-bundle-init-directory' and its byte-compiled
version is used if `el-get-bundle-byte-compile' is non-nil.

\(fn PACKAGE &rest FORM)" nil t)

(function-put 'el-get-bundle 'lisp-indent-function 'defun)

(autoload 'el-get-bundle! "el-get/el-get-bundle" "\
Install PACKAGE and run initialization form.
It is the same as `el-get-bundle' except that PACKAGE is explicitly
required.

\(fn PACKAGE &rest ARGS)" nil t)

(function-put 'el-get-bundle! 'lisp-indent-function 'defun)

;;;***

;;;### (autoloads nil "el-get/el-get-check" "el-get/el-get-check.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-check.el

(autoload 'el-get-check-recipe "el-get/el-get-check" "\
Check the format of the recipe.
Please run this command before sending a pull request.
Usage: M-x el-get-check-recipe RET

You can run this function from checker script like this:
    test/check-recipe.el PATH/TO/RECIPE.rcp

When used as a lisp function, FILE-OR-BUFFER must be a buffer
object or a file path.

\(fn FILE-OR-BUFFER)" t nil)

;;;***

;;;### (autoloads nil "el-get/el-get-list-packages" "el-get/el-get-list-packages.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "evil-numbers/evil-numbers" "evil-numbers/evil-numbers.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from evil-numbers/evil-numbers.el

(autoload 'evil-numbers/inc-at-pt "evil-numbers/evil-numbers" "\
Increment the number at point or after point before end-of-line by `amount'.
When region is selected, increment all numbers in the region by `amount'

NO-REGION is internal flag that allows
`evil-numbers/inc-at-point' to be called recursively when
applying the regional features of `evil-numbers/inc-at-point'.

\(fn AMOUNT &optional NO-REGION)" t nil)

(autoload 'evil-numbers/dec-at-pt "evil-numbers/evil-numbers" "\
Decrement the number at point or after point before end-of-line by `amount'.

If a region is active, decrement all the numbers at a point by `amount'.

This function uses `evil-numbers/inc-at-pt'

\(fn AMOUNT)" t nil)

;;;***

;;;### (autoloads nil "fcitx/fcitx" "fcitx/fcitx.el" (0 0 0 0))
;;; Generated autoloads from fcitx/fcitx.el

(autoload 'fcitx-prefix-keys-add "fcitx/fcitx" "\


\(fn &rest PREFIX-KEYS)" t nil)

(autoload 'fcitx-prefix-keys-turn-on "fcitx/fcitx" "\
Turn on `fcixt-disable-prefix-keys'.

\(fn)" t nil)

(autoload 'fcitx-prefix-keys-turn-off "fcitx/fcitx" "\
Turn off `fcixt-disable-prefix-keys'.

\(fn)" t nil)

(autoload 'fcitx-prefix-keys-setup "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-evil-turn-on "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-evil-turn-off "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-M-x-turn-on "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-M-x-turn-off "fcitx/fcitx" "\


\(fn)" t nil)
 (autoload 'fcitx-shell-command-turn-on "fcitx" "Enable `shell-command' support" t)
 (autoload 'fcitx-shell-command-turn-off "fcitx" "Disable `shell-command' support" t)
 (autoload 'fcitx-eval-expression-turn-on "fcitx" "Enable `shell-command' support" t)
 (autoload 'fcitx-eval-expression-turn-off "fcitx" "Disable `eval-expression' support" t)

(autoload 'fcitx-read-funcs-turn-on "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-read-funcs-turn-off "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-aggressive-minibuffer-turn-on "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-aggressive-minibuffer-turn-off "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-isearch-turn-on "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-isearch-turn-off "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-org-speed-command-turn-on "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-org-speed-command-turn-off "fcitx/fcitx" "\


\(fn)" t nil)

(autoload 'fcitx-default-setup "fcitx/fcitx" "\
Default setup for `fcitx'.

\(fn)" t nil)

(autoload 'fcitx-aggressive-setup "fcitx/fcitx" "\
Aggressive setup for `fcitx'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "flycheck-irony/flycheck-irony" "flycheck-irony/flycheck-irony.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck-irony/flycheck-irony.el

(autoload 'flycheck-irony-setup "flycheck-irony/flycheck-irony" "\
Setup Flycheck Irony.

Add `irony' to `flycheck-checkers'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "flycheck-package/flycheck-package" "flycheck-package/flycheck-package.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck-package/flycheck-package.el

(autoload 'flycheck-package-setup "flycheck-package/flycheck-package" "\
Setup flycheck-package.
Add `flycheck-emacs-lisp-package' to `flycheck-checkers'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck-package/flycheck-package" '("flycheck-package--")))

;;;***

;;;### (autoloads nil "flycheck-tip/eclim-tip" "flycheck-tip/eclim-tip.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck-tip/eclim-tip.el

(autoload 'eclim-tip-cycle "flycheck-tip/eclim-tip" "\


\(fn &optional REVERSE)" t nil)

(autoload 'eclim-tip-cycle-reverse "flycheck-tip/eclim-tip" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "flycheck-tip/error-tip" "flycheck-tip/error-tip.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck-tip/error-tip.el

(autoload 'error-tip-error-p "flycheck-tip/error-tip" "\
Return non-nil if error is occurred in current buffer.
This function can catch error against flycheck, flymake and emcas-eclim.

\(fn)" nil nil)

(autoload 'error-tip-cycle-dwim "flycheck-tip/error-tip" "\
Showing error function.
This function switches proper error showing function by context.
 (whether flycheck or flymake) The REVERSE option jumps by inverse if
the value is non-nil.

\(fn &optional REVERSE)" t nil)

(autoload 'error-tip-cycle-dwim-reverse "flycheck-tip/error-tip" "\
Same as ‘error-tip-cycle-dwim’, but it jumps to inverse direction.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck-tip/error-tip" '(#("error-tip-" 0 10 (fontified nil face font-lock-function-name-face)))))

;;;***

;;;### (autoloads nil "flycheck-tip/flycheck-tip" "flycheck-tip/flycheck-tip.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck-tip/flycheck-tip.el

(autoload 'flycheck-tip-cycle "flycheck-tip/flycheck-tip" "\
Move to next error if it's exists.
If it wasn't exists then move to previous error.
Move to previous error if REVERSE is non-nil.

\(fn &optional REVERSE)" t nil)

(autoload 'flycheck-tip-cycle-reverse "flycheck-tip/flycheck-tip" "\
Do `flycheck-tip-cycle by reverse order.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck-tip/flycheck-tip" '("flycheck-tip-")))

;;;***

;;;### (autoloads nil "flycheck-tip/flymake-tip" "flycheck-tip/flymake-tip.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck-tip/flymake-tip.el

(autoload 'flymake-tip-cycle "flycheck-tip/flymake-tip" "\


\(fn REVERSE)" t nil)

(autoload 'flymake-tip-cycle-reverse "flycheck-tip/flymake-tip" "\


\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck-tip/flymake-tip" '("flymake-tip-collect-current-line-errors")))

;;;***

;;;### (autoloads nil "flycheck/flycheck" "flycheck/flycheck.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck/flycheck.el

(autoload 'flycheck-manual "flycheck/flycheck" "\
Open the Flycheck manual.

\(fn)" t nil)

(autoload 'flycheck-mode "flycheck/flycheck" "\
Minor mode for on-the-fly syntax checking.

When called interactively, toggle `flycheck-mode'.  With prefix
ARG, enable `flycheck-mode' if ARG is positive, otherwise disable
it.

When called from Lisp, enable `flycheck-mode' if ARG is omitted,
nil or positive.  If ARG is `toggle', toggle `flycheck-mode'.
Otherwise behave as if called interactively.

In `flycheck-mode' the buffer is automatically syntax-checked
using the first suitable syntax checker from `flycheck-checkers'.
Use `flycheck-select-checker' to select a checker for the current
buffer manually.

\\{flycheck-mode-map}

\(fn &optional ARG)" t nil)

(defvar global-flycheck-mode nil "\
Non-nil if Global Flycheck mode is enabled.
See the `global-flycheck-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-flycheck-mode'.")

(custom-autoload 'global-flycheck-mode "flycheck/flycheck" nil)

(autoload 'global-flycheck-mode "flycheck/flycheck" "\
Toggle Flycheck mode in all buffers.
With prefix ARG, enable Global Flycheck mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Flycheck mode is enabled in all buffers where
`flycheck-mode-on-safe' would do it.
See `flycheck-mode' for more information on Flycheck mode.

\(fn &optional ARG)" t nil)

(autoload 'flycheck-define-error-level "flycheck/flycheck" "\
Define a new error LEVEL with PROPERTIES.

The following PROPERTIES constitute an error level:

`:severity SEVERITY'
     A number denoting the severity of this level.  The higher
     the number, the more severe is this level compared to other
     levels.  Defaults to 0.

     The severity is used by `flycheck-error-level-<' to
     determine the ordering of errors according to their levels.

`:compilation-level LEVEL'

     A number indicating the broad class of messages that errors
     at this level belong to: one of 0 (info), 1 (warning), or
     2 or nil (error).  Defaults to nil.

     This is used by `flycheck-checker-pattern-to-error-regexp'
     to map error levels into `compilation-mode''s hierarchy and
     to get proper highlighting of errors in `compilation-mode'.

`:overlay-category CATEGORY'
     A symbol denoting the overlay category to use for error
     highlight overlays for this level.  See Info
     node `(elisp)Overlay Properties' for more information about
     overlay categories.

     A category for an error level overlay should at least define
     the `face' property, for error highlighting.  Another useful
     property for error level categories is `priority', to
     influence the stacking of multiple error level overlays.

`:fringe-bitmap BITMAP'
     A fringe bitmap symbol denoting the bitmap to use for fringe
     indicators for this level.  See Info node `(elisp)Fringe
     Bitmaps' for more information about fringe bitmaps,
     including a list of built-in fringe bitmaps.

`:fringe-face FACE'
     A face symbol denoting the face to use for fringe indicators
     for this level.

`:error-list-face FACE'
     A face symbol denoting the face to use for messages of this
     level in the error list.  See `flycheck-list-errors'.

\(fn LEVEL &rest PROPERTIES)" nil nil)

(function-put 'flycheck-define-error-level 'lisp-indent-function '1)

(autoload 'flycheck-define-command-checker "flycheck/flycheck" "\
Define SYMBOL as syntax checker to run a command.

Define SYMBOL as generic syntax checker via
`flycheck-define-generic-checker', which uses an external command
to check the buffer.  SYMBOL and DOCSTRING are the same as for
`flycheck-define-generic-checker'.

In addition to the properties understood by
`flycheck-define-generic-checker', the following PROPERTIES
constitute a command syntax checker.  Unless otherwise noted, all
properties are mandatory.  Note that the default `:error-filter'
of command checkers is `flycheck-sanitize-errors'.

`:command COMMAND'
     The command to run for syntax checking.

     COMMAND is a list of the form `(EXECUTABLE [ARG ...])'.

     EXECUTABLE is a string with the executable of this syntax
     checker.  It can be overridden with the variable
     `flycheck-SYMBOL-executable'.  Note that this variable is
     NOT implicitly defined by this function.  Use
     `flycheck-def-executable-var' to define this variable.

     Each ARG is an argument to the executable, either as string,
     or as special symbol or form for
     `flycheck-substitute-argument', which see.

`:error-patterns PATTERNS'
     A list of patterns to parse the output of the `:command'.

     Each ITEM in PATTERNS is a list `(LEVEL SEXP ...)', where
     LEVEL is a Flycheck error level (see
     `flycheck-define-error-level'), followed by one or more RX
     `SEXP's which parse an error of that level and extract line,
     column, file name and the message.

     See `rx' for general information about RX, and
     `flycheck-rx-to-string' for some special RX forms provided
     by Flycheck.

     All patterns are applied in the order of declaration to the
     whole output of the syntax checker.  Output already matched
     by a pattern will not be matched by subsequent patterns.  In
     other words, the first pattern wins.

     This property is optional.  If omitted, however, an
     `:error-parser' is mandatory.

`:error-parser FUNCTION'
     A function to parse errors with.

     The function shall accept three arguments OUTPUT CHECKER
     BUFFER.  OUTPUT is the syntax checker output as string,
     CHECKER the syntax checker that was used, and BUFFER a
     buffer object representing the checked buffer.  The function
     must return a list of `flycheck-error' objects parsed from
     OUTPUT.

     This property is optional.  If omitted, it defaults to
     `flycheck-parse-with-patterns'.  In this case,
     `:error-patterns' is mandatory.

`:standard-input t'
     Whether to send the buffer contents on standard input.

     If this property is given and has a non-nil value, send the
     contents of the buffer on standard input.

     Defaults to nil.

Note that you may not give `:start', `:interrupt', and
`:print-doc' for a command checker.  You can give a custom
`:verify' function, though, whose results will be appended to the
default `:verify' function of command checkers.

\(fn SYMBOL DOCSTRING &rest PROPERTIES)" nil nil)

(function-put 'flycheck-define-command-checker 'lisp-indent-function '1)

(function-put 'flycheck-define-command-checker 'doc-string-elt '2)

(autoload 'flycheck-def-config-file-var "flycheck/flycheck" "\
Define SYMBOL as config file variable for CHECKER, with default FILE-NAME.

SYMBOL is declared as customizable variable using `defcustom', to
provide a configuration file for the given syntax CHECKER.
CUSTOM-ARGS are forwarded to `defcustom'.

FILE-NAME is the initial value of the new variable.  If omitted,
the default value is nil.

Use this together with the `config-file' form in the `:command'
argument to `flycheck-define-checker'.

\(fn SYMBOL CHECKER &optional FILE-NAME &rest CUSTOM-ARGS)" nil t)

(function-put 'flycheck-def-config-file-var 'lisp-indent-function '3)

(autoload 'flycheck-def-option-var "flycheck/flycheck" "\
Define SYMBOL as option variable with INIT-VALUE for CHECKER.

SYMBOL is declared as customizable variable using `defcustom', to
provide an option for the given syntax CHECKERS (a checker or a
list of checkers).  INIT-VALUE is the initial value of the
variable, and DOCSTRING is its docstring.  CUSTOM-ARGS are
forwarded to `defcustom'.

Use this together with the `option', `option-list' and
`option-flag' forms in the `:command' argument to
`flycheck-define-checker'.

\(fn SYMBOL INIT-VALUE CHECKERS DOCSTRING &rest CUSTOM-ARGS)" nil t)

(function-put 'flycheck-def-option-var 'lisp-indent-function '3)

(function-put 'flycheck-def-option-var 'doc-string-elt '4)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck/flycheck" '("flycheck-" "list-flycheck-errors" "help-flycheck-checker-d" "read-flycheck-")))

;;;***

;;;### (autoloads nil "flycheck/flycheck-buttercup" "flycheck/flycheck-buttercup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck/flycheck-buttercup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck/flycheck-buttercup" '("flycheck-buttercup-format-error-list")))

;;;***

;;;### (autoloads nil "flycheck/flycheck-ert" "flycheck/flycheck-ert.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck/flycheck-ert.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck/flycheck-ert" '("flycheck-ert-")))

;;;***

;;;### (autoloads nil "ggtags/ggtags" "ggtags/ggtags.el" (0 0 0 0))
;;; Generated autoloads from ggtags/ggtags.el

(autoload 'ggtags-find-project "ggtags/ggtags" "\


\(fn)" nil nil)

(autoload 'ggtags-find-tag-dwim "ggtags/ggtags" "\
Find NAME by context.
If point is at a definition tag, find references, and vice versa.
If point is at a line that matches `ggtags-include-pattern', find
the include file instead.

When called interactively with a prefix arg, always find
definition tags.

\(fn NAME &optional WHAT)" t nil)

(autoload 'ggtags-mode "ggtags/ggtags" "\
Toggle Ggtags mode on or off.
With a prefix argument ARG, enable Ggtags mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{ggtags-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'ggtags-build-imenu-index "ggtags/ggtags" "\
A function suitable for `imenu-create-index-function'.

\(fn)" nil nil)

(autoload 'ggtags-try-complete-tag "ggtags/ggtags" "\
A function suitable for `hippie-expand-try-functions-list'.

\(fn OLD)" nil nil)

;;;***

;;;### (autoloads nil "ginger-api/ginger-api" "ginger-api/ginger-api.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ginger-api/ginger-api.el

(autoload 'ginger-region "ginger-api/ginger-api" "\


\(fn BEG END)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ginger-api/ginger-api" '(#("ginger-end-point" 0 16 (face font-lock-variable-name-face fontified nil)))))

;;;***

;;;### (autoloads nil "git-gutter/git-gutter" "git-gutter/git-gutter.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from git-gutter/git-gutter.el

(autoload 'git-gutter:linum-setup "git-gutter/git-gutter" "\
Setup for linum-mode.

\(fn)" nil nil)

(autoload 'git-gutter-mode "git-gutter/git-gutter" "\
Git-Gutter mode

\(fn &optional ARG)" t nil)

(defvar global-git-gutter-mode nil "\
Non-nil if Global Git-Gutter mode is enabled.
See the `global-git-gutter-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-git-gutter-mode'.")

(custom-autoload 'global-git-gutter-mode "git-gutter/git-gutter" nil)

(autoload 'global-git-gutter-mode "git-gutter/git-gutter" "\
Toggle Git-Gutter mode in all buffers.
With prefix ARG, enable Global Git-Gutter mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Git-Gutter mode is enabled in all buffers where
`git-gutter--turn-on' would do it.
See `git-gutter-mode' for more information on Git-Gutter mode.

\(fn &optional ARG)" t nil)

(autoload 'git-gutter "git-gutter/git-gutter" "\
Show diff information in gutter

\(fn)" t nil)

(autoload 'git-gutter:toggle "git-gutter/git-gutter" "\
Toggle to show diff information.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "git-messenger/git-messenger" "git-messenger/git-messenger.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from git-messenger/git-messenger.el

(autoload 'git-messenger:popup-message "git-messenger/git-messenger" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "go-eldoc/go-eldoc" "go-eldoc/go-eldoc.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from go-eldoc/go-eldoc.el

(autoload 'go-eldoc-setup "go-eldoc/go-eldoc" "\
Set up eldoc function and enable eldoc-mode.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "go-mode/go-mode" "go-mode/go-mode.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from go-mode/go-mode.el

(autoload 'go-mode "go-mode/go-mode" "\
Major mode for editing Go source text.

This mode provides (not just) basic editing capabilities for
working with Go code. It offers almost complete syntax
highlighting, indentation that is almost identical to gofmt and
proper parsing of the buffer content to allow features such as
navigation by function, manipulation of comments or detection of
strings.

In addition to these core features, it offers various features to
help with writing Go code. You can directly run buffer content
through gofmt, read godoc documentation from within Emacs, modify
and clean up the list of package imports or interact with the
Playground (uploading and downloading pastes).

The following extra functions are defined:

- `gofmt'
- `godoc' and `godoc-at-point'
- `go-import-add'
- `go-remove-unused-imports'
- `go-goto-arguments'
- `go-goto-docstring'
- `go-goto-function'
- `go-goto-function-name'
- `go-goto-imports'
- `go-goto-return-values'
- `go-goto-method-receiver'
- `go-play-buffer' and `go-play-region'
- `go-download-play'
- `godef-describe' and `godef-jump'
- `go-coverage'
- `go-set-project'
- `go-reset-gopath'

If you want to automatically run `gofmt' before saving a file,
add the following hook to your emacs configuration:

\(add-hook 'before-save-hook #'gofmt-before-save)

If you want to use `godef-jump' instead of etags (or similar),
consider binding godef-jump to `M-.', which is the default key
for `find-tag':

\(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd \"M-.\") #'godef-jump)))

Please note that godef is an external dependency. You can install
it with

go get github.com/rogpeppe/godef


If you're looking for even more integration with Go, namely
on-the-fly syntax checking, auto-completion and snippets, it is
recommended that you look at flycheck
\(see URL `https://github.com/flycheck/flycheck') or flymake in combination
with goflymake (see URL `https://github.com/dougm/goflymake'), gocode
\(see URL `https://github.com/nsf/gocode'), go-eldoc
\(see URL `github.com/syohex/emacs-go-eldoc') and yasnippet-go
\(see URL `https://github.com/dominikh/yasnippet-go')

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons "\\.go\\'" 'go-mode))

(autoload 'gofmt-before-save "go-mode/go-mode" "\
Add this to .emacs to run gofmt on the current buffer when saving:
 (add-hook 'before-save-hook 'gofmt-before-save).

Note that this will cause go-mode to get loaded the first time
you save any file, kind of defeating the point of autoloading.

\(fn)" t nil)

(autoload 'godoc "go-mode/go-mode" "\
Show Go documentation for QUERY, much like M-x man.

\(fn QUERY)" t nil)

(autoload 'go-download-play "go-mode/go-mode" "\
Download a paste from the playground and insert it in a Go buffer.
Tries to look for a URL at point.

\(fn URL)" t nil)

;;;***

;;;### (autoloads nil "grep-a-lot/grep-a-lot" "grep-a-lot/grep-a-lot.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from grep-a-lot/grep-a-lot.el

(autoload 'grep-a-lot-advise "grep-a-lot/grep-a-lot" "\
Advise a grep-like function FUNC with an around-type advice,
so as to enable multiple search results buffers.

\(fn FUNC)" nil t)

(autoload 'grep-a-lot-setup-keys "grep-a-lot/grep-a-lot" "\
Define some key bindings for navigating multiple
grep search results buffers.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/ghc-core" "haskell-mode/ghc-core.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/ghc-core.el

(let ((loads (get 'ghc-core 'custom-loads))) (if (member '"haskell-mode/ghc-core" loads) nil (put 'ghc-core 'custom-loads (cons '"haskell-mode/ghc-core" loads))))

(autoload 'ghc-core-create-core "haskell-mode/ghc-core" "\
Compile and load the current buffer as tidy core.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.hcr\\'" . ghc-core-mode))

(add-to-list 'auto-mode-alist '("\\.dump-simpl\\'" . ghc-core-mode))

(autoload 'ghc-core-mode "haskell-mode/ghc-core" "\
Major mode for GHC Core files.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/ghc-core" '("ghc-core-")))

;;;***

;;;### (autoloads nil "haskell-mode/ghci-script-mode" "haskell-mode/ghci-script-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/ghci-script-mode.el

(autoload 'ghci-script-mode "haskell-mode/ghci-script-mode" "\
Major mode for working with .ghci files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.ghci\\'" . ghci-script-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/ghci-script-mode" '("ghci-script-mode-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell" "haskell-mode/haskell.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell.el

(autoload 'interactive-haskell-mode "haskell-mode/haskell" "\
Minor mode for enabling haskell-process interaction.

\(fn &optional ARG)" t nil)

(autoload 'haskell-interactive-mode-return "haskell-mode/haskell" "\
Handle the return key.

\(fn)" t nil)

(autoload 'haskell-session-kill "haskell-mode/haskell" "\
Kill the session process and buffer, delete the session.
0. Prompt to kill all associated buffers.
1. Kill the process.
2. Kill the interactive buffer unless LEAVE-INTERACTIVE-BUFFER is not given.
3. Walk through all the related buffers and set their haskell-session to nil.
4. Remove the session from the sessions list.

\(fn &optional LEAVE-INTERACTIVE-BUFFER)" t nil)

(autoload 'haskell-interactive-kill "haskell-mode/haskell" "\
Kill the buffer and (maybe) the session.

\(fn)" t nil)

(autoload 'haskell-session "haskell-mode/haskell" "\
Get the Haskell session, prompt if there isn't one or fail.

\(fn)" nil nil)

(autoload 'haskell-interactive-switch "haskell-mode/haskell" "\
Switch to the interactive mode for this session.

\(fn)" t nil)

(autoload 'haskell-session-change "haskell-mode/haskell" "\
Change the session for the current buffer.

\(fn)" t nil)

(autoload 'haskell-kill-session-process "haskell-mode/haskell" "\
Kill the process.

\(fn &optional SESSION)" t nil)

(autoload 'haskell-interactive-mode-visit-error "haskell-mode/haskell" "\
Visit the buffer of the current (or last) error message.

\(fn)" t nil)

(autoload 'haskell-mode-jump-to-tag "haskell-mode/haskell" "\
Jump to the tag of the given identifier.

Give optional NEXT-P parameter to override value of
`xref-prompt-for-identifier' during definition search.

\(fn &optional NEXT-P)" t nil)

(autoload 'haskell-mode-after-save-handler "haskell-mode/haskell" "\
Function that will be called after buffer's saving.

\(fn)" nil nil)

(autoload 'haskell-mode-tag-find "haskell-mode/haskell" "\
The tag find function, specific for the particular session.

\(fn &optional NEXT-P)" t nil)

(autoload 'haskell-interactive-bring "haskell-mode/haskell" "\
Bring up the interactive mode for this session.

\(fn)" t nil)

(autoload 'haskell-process-load-file "haskell-mode/haskell" "\
Load the current buffer file.

\(fn)" t nil)

(autoload 'haskell-process-reload "haskell-mode/haskell" "\
Re-load the current buffer file.

\(fn)" t nil)

(autoload 'haskell-process-reload-file "haskell-mode/haskell" "\


\(fn)" nil nil)

(autoload 'haskell-process-load-or-reload "haskell-mode/haskell" "\
Load or reload. Universal argument toggles which.

\(fn &optional TOGGLE)" t nil)

(autoload 'haskell-process-cabal-build "haskell-mode/haskell" "\
Build the Cabal project.

\(fn)" t nil)

(autoload 'haskell-process-cabal "haskell-mode/haskell" "\
Prompts for a Cabal command to run.

\(fn P)" t nil)

(autoload 'haskell-process-minimal-imports "haskell-mode/haskell" "\
Dump minimal imports.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell" '("haskell-" "xref-prompt-for-identifier" "interactive-haskell-mode-map")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-align-imports" "haskell-mode/haskell-align-imports.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-align-imports.el

(autoload 'haskell-align-imports "haskell-mode/haskell-align-imports" "\
Align all the imports in the buffer.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-align-imports" '("haskell-align-imports-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-c2hs" "haskell-mode/haskell-c2hs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-c2hs.el

(add-to-list 'auto-mode-alist '("\\.chs\\'" . haskell-c2hs-mode))

(autoload 'haskell-c2hs-mode "haskell-mode/haskell-c2hs" "\
Mode for editing *.chs files of the c2hs haskell tool.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-c2hs" '("haskell-c2hs-font-lock-keywords")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-cabal" "haskell-mode/haskell-cabal.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-cabal.el

(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(autoload 'haskell-cabal-mode "haskell-mode/haskell-cabal" "\
Major mode for Cabal package description files.

\(fn)" t nil)

(autoload 'haskell-cabal-get-field "haskell-mode/haskell-cabal" "\
Read the value of field with NAME from project's cabal file.
If there is no valid .cabal file to get the setting from (or
there is no corresponding setting with that name in the .cabal
file), then this function returns nil.

\(fn NAME)" t nil)

(autoload 'haskell-cabal-get-dir "haskell-mode/haskell-cabal" "\
Get the Cabal dir for a new project. Various ways of figuring this out,
   and indeed just prompting the user. Do them all.

\(fn &optional USE-DEFAULTS)" nil nil)

(autoload 'haskell-cabal-visit-file "haskell-mode/haskell-cabal" "\
Locate and visit package description file for file visited by current buffer.
This uses `haskell-cabal-find-file' to locate the closest
\".cabal\" file and open it.  This command assumes a common Cabal
project structure where the \".cabal\" file is in the top-folder
of the project, and all files related to the project are in or
below the top-folder.  If called with non-nil prefix argument
OTHER-WINDOW use `find-file-other-window'.

\(fn OTHER-WINDOW)" t nil)

(let ((loads (get 'haskell-cabal 'custom-loads))) (if (member '"haskell-mode/haskell-cabal" loads) nil (put 'haskell-cabal 'custom-loads (cons '"haskell-mode/haskell-cabal" loads))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-cabal" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-checkers" "haskell-mode/haskell-checkers.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-checkers.el

(let ((loads (get 'haskell-checkers 'custom-loads))) (if (member '"haskell-mode/haskell-checkers" loads) nil (put 'haskell-checkers 'custom-loads (cons '"haskell-mode/haskell-checkers" loads))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-checkers" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-collapse" "haskell-mode/haskell-collapse.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-collapse.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-collapse" '("haskell-collapse")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-commands" "haskell-mode/haskell-commands.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-commands.el

(autoload 'haskell-process-restart "haskell-mode/haskell-commands" "\
Restart the inferior Haskell process.

\(fn)" t nil)

(autoload 'haskell-process-clear "haskell-mode/haskell-commands" "\
Clear the current process.

\(fn)" t nil)

(autoload 'haskell-process-interrupt "haskell-mode/haskell-commands" "\
Interrupt the process (SIGINT).

\(fn)" t nil)

(autoload 'haskell-describe "haskell-mode/haskell-commands" "\
Describe the given identifier IDENT.

\(fn IDENT)" t nil)

(autoload 'haskell-rgrep "haskell-mode/haskell-commands" "\
Grep the effective project for the symbol at point.
Very useful for codebase navigation.

Prompts for an arbitrary regexp given a prefix arg PROMPT.

\(fn &optional PROMPT)" t nil)

(autoload 'haskell-process-do-info "haskell-mode/haskell-commands" "\
Print info on the identifier at point.
If PROMPT-VALUE is non-nil, request identifier via mini-buffer.

\(fn &optional PROMPT-VALUE)" t nil)

(autoload 'haskell-process-do-type "haskell-mode/haskell-commands" "\
Print the type of the given expression.

Given INSERT-VALUE prefix indicates that result type signature
should be inserted.

\(fn &optional INSERT-VALUE)" t nil)

(autoload 'haskell-mode-jump-to-def-or-tag "haskell-mode/haskell-commands" "\
Jump to the definition.
Jump to definition of identifier at point by consulting GHCi, or
tag table as fallback.

Remember: If GHCi is busy doing something, this will delay, but
it will always be accurate, in contrast to tags, which always
work but are not always accurate.
If the definition or tag is found, the location from which you jumped
will be pushed onto `xref--marker-ring', so you can return to that
position with `xref-pop-marker-stack'.

\(fn &optional NEXT-P)" t nil)

(autoload 'haskell-mode-goto-loc "haskell-mode/haskell-commands" "\
Go to the location of the thing at point.
Requires the :loc-at command from GHCi.

\(fn)" t nil)

(autoload 'haskell-mode-jump-to-def "haskell-mode/haskell-commands" "\
Jump to definition of identifier IDENT at point.

\(fn IDENT)" t nil)

(autoload 'haskell-process-cd "haskell-mode/haskell-commands" "\
Change directory.

\(fn &optional NOT-INTERACTIVE)" t nil)

(autoload 'haskell-process-cabal-macros "haskell-mode/haskell-commands" "\
Send the cabal macros string.

\(fn)" t nil)

(autoload 'haskell-mode-show-type-at "haskell-mode/haskell-commands" "\
Show type of the thing at point or within active region asynchronously.
This function requires GHCi 8+ or GHCi-ng.

\\<haskell-interactive-mode-map>
To make this function works sometimes you need to load the file in REPL
first using command `haskell-process-load-file' bound to
\\[haskell-process-load-file].

Optional argument INSERT-VALUE indicates that
recieved type signature should be inserted (but only if nothing
happened since function invocation).

\(fn &optional INSERT-VALUE)" t nil)

(autoload 'haskell-process-unignore "haskell-mode/haskell-commands" "\
Unignore any ignored files.
Do not ignore files that were specified as being ignored by the
inferior GHCi process.

\(fn)" t nil)

(autoload 'haskell-session-change-target "haskell-mode/haskell-commands" "\
Set the build TARGET for cabal REPL.

\(fn TARGET)" t nil)

(autoload 'haskell-mode-stylish-buffer "haskell-mode/haskell-commands" "\
Apply stylish-haskell to the current buffer.

\(fn)" t nil)

(autoload 'haskell-mode-find-uses "haskell-mode/haskell-commands" "\
Find use cases of the identifier at point and highlight them all.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-commands" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-compile" "haskell-mode/haskell-compile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-compile.el

(let ((loads (get 'haskell-compile 'custom-loads))) (if (member '"haskell-mode/haskell-compile" loads) nil (put 'haskell-compile 'custom-loads (cons '"haskell-mode/haskell-compile" loads))))

(autoload 'haskell-compile "haskell-mode/haskell-compile" "\
Compile the Haskell program including the current buffer.
Tries to locate the next cabal description in current or parent
folders via `haskell-cabal-find-dir' and if found, invoke
`haskell-compile-cabal-build-command' from the cabal package root
folder. If no cabal package could be detected,
`haskell-compile-command' is used instead.

If prefix argument EDIT-COMMAND is non-nil (and not a negative
prefix `-'), `haskell-compile' prompts for custom compile
command.

If EDIT-COMMAND contains the negative prefix argument `-',
`haskell-compile' calls the alternative command defined in
`haskell-compile-cabal-build-alt-command' if a cabal package was
detected.

`haskell-compile' uses `haskell-compilation-mode' which is
derived from `compilation-mode'. See Info
node `(haskell-mode)compilation' for more details.

\(fn &optional EDIT-COMMAND)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-compile" '("haskell-compil")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-complete-module" "haskell-mode/haskell-complete-module.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-complete-module.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-complete-module" '("haskell-complete-module")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-completions" "haskell-mode/haskell-completions.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-completions.el

(let ((loads (get 'haskell-completions 'custom-loads))) (if (member '"haskell-mode/haskell-completions" loads) nil (put 'haskell-completions 'custom-loads (cons '"haskell-mode/haskell-completions" loads))))

(autoload 'haskell-completions-completion-at-point "haskell-mode/haskell-completions" "\
Provide completion list for thing at point.
This function is used in non-interactive `haskell-mode'.  It
provides completions for haskell keywords, language pragmas,
GHC's options, and language extensions, but not identifiers.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-completions" '("haskell-completions-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-customize" "haskell-mode/haskell-customize.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-customize.el

(let ((loads (get 'haskell 'custom-loads))) (if (member '"haskell-mode/haskell-customize" loads) nil (put 'haskell 'custom-loads (cons '"haskell-mode/haskell-customize" loads))))

(let ((loads (get 'haskell-interactive 'custom-loads))) (if (member '"haskell-mode/haskell-customize" loads) nil (put 'haskell-interactive 'custom-loads (cons '"haskell-mode/haskell-customize" loads))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-customize" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-debug" "haskell-mode/haskell-debug.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-debug.el

(let ((loads (get 'haskell-debug 'custom-loads))) (if (member '"haskell-mode/haskell-debug" loads) nil (put 'haskell-debug 'custom-loads (cons '"haskell-mode/haskell-debug" loads))))

(defface haskell-debug-warning-face '((t :inherit 'compilation-warning)) "\
Face for warnings." :group (quote haskell-debug))

(defface haskell-debug-trace-number-face '((t :weight bold :background "#f5f5f5")) "\
Face for numbers in backtrace." :group (quote haskell-debug))

(defface haskell-debug-newline-face '((t :weight bold :background "#f0f0f0")) "\
Face for newlines in trace steps." :group (quote haskell-debug))

(defface haskell-debug-keybinding-face '((t :inherit 'font-lock-type-face :weight bold)) "\
Face for keybindings." :group (quote haskell-debug))

(defface haskell-debug-heading-face '((t :inherit 'font-lock-keyword-face)) "\
Face for headings." :group (quote haskell-debug))

(defface haskell-debug-muted-face '((t :foreground "#999")) "\
Face for muteds." :group (quote haskell-debug))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-debug" '("haskell-debug")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-decl-scan" "haskell-mode/haskell-decl-scan.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-decl-scan.el

(let ((loads (get 'haskell-decl-scan 'custom-loads))) (if (member '"haskell-mode/haskell-decl-scan" loads) nil (put 'haskell-decl-scan 'custom-loads (cons '"haskell-mode/haskell-decl-scan" loads))))

(autoload 'haskell-ds-create-imenu-index "haskell-mode/haskell-decl-scan" "\
Function for finding `imenu' declarations in Haskell mode.
Finds all declarations (classes, variables, imports, instances and
datatypes) in a Haskell file for the `imenu' package.

\(fn)" nil nil)

(autoload 'turn-on-haskell-decl-scan "haskell-mode/haskell-decl-scan" "\
Unconditionally activate `haskell-decl-scan-mode'.

\(fn)" t nil)

(autoload 'haskell-decl-scan-mode "haskell-mode/haskell-decl-scan" "\
Toggle Haskell declaration scanning minor mode on or off.
With a prefix argument ARG, enable minor mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.

See also info node `(haskell-mode)haskell-decl-scan-mode' for
more details about this minor mode.

Top-level declarations are scanned and listed in the menu item
\"Declarations\" (if enabled via option
`haskell-decl-scan-add-to-menubar').  Selecting an item from this
menu will take point to the start of the declaration.

\\[beginning-of-defun] and \\[end-of-defun] move forward and backward to the start of a declaration.

This may link with `haskell-doc-mode'.

For non-literate and LaTeX-style literate scripts, we assume the
common convention that top-level declarations start at the first
column.  For Bird-style literate scripts, we assume the common
convention that top-level declarations start at the third column,
ie. after \"> \".

Anything in `font-lock-comment-face' is not considered for a
declaration.  Therefore, using Haskell font locking with comments
coloured in `font-lock-comment-face' improves declaration scanning.

Literate Haskell scripts are supported: If the value of
`haskell-literate' (set automatically by `literate-haskell-mode')
is `bird', a Bird-style literate script is assumed.  If it is nil
or `tex', a non-literate or LaTeX-style literate script is
assumed, respectively.

Invokes `haskell-decl-scan-mode-hook' on activation.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-decl-scan" '("haskell-d" "literate-haskell-ds-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-doc" "haskell-mode/haskell-doc.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-doc.el

(let ((loads (get 'haskell-doc 'custom-loads))) (if (member '"haskell-mode/haskell-doc" loads) nil (put 'haskell-doc 'custom-loads (cons '"haskell-mode/haskell-doc" loads))))

(autoload 'haskell-doc-mode "haskell-mode/haskell-doc" "\
Enter `haskell-doc-mode' for showing fct types in the echo area.
See variable docstring.

\(fn &optional ARG)" t nil)

(defalias 'turn-on-haskell-doc-mode 'haskell-doc-mode)

(defalias 'turn-on-haskell-doc 'haskell-doc-mode)

(autoload 'haskell-doc-current-info "haskell-mode/haskell-doc" "\
Return the info about symbol at point.
Meant for `eldoc-documentation-function'.

\(fn)" nil nil)

(autoload 'haskell-doc-show-type "haskell-mode/haskell-doc" "\
Show the type of the function near point or given symbol SYM.
For the function under point, show the type in the echo area.
This information is extracted from the `haskell-doc-prelude-types' alist
of prelude functions and their types, or from the local functions in the
current buffer.

\(fn &optional SYM)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-doc" '("haskell-" "turn-off-haskell-doc")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-font-lock" "haskell-mode/haskell-font-lock.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-font-lock.el

(let ((loads (get 'haskell-appearance 'custom-loads))) (if (member '"haskell-mode/haskell-font-lock" loads) nil (put 'haskell-appearance 'custom-loads (cons '"haskell-mode/haskell-font-lock" loads))))

(defface haskell-keyword-face '((t :inherit font-lock-keyword-face)) "\
Face used to highlight Haskell keywords." :group (quote haskell-appearance))

(defface haskell-type-face '((t :inherit font-lock-type-face)) "\
Face used to highlight Haskell types" :group (quote haskell-appearance))

(defface haskell-constructor-face '((t :inherit font-lock-type-face)) "\
Face used to highlight Haskell constructors." :group (quote haskell-appearance))

(defface haskell-operator-face '((t :inherit font-lock-variable-name-face)) "\
Face used to highlight Haskell operators." :group (quote haskell-appearance))

(defface haskell-pragma-face '((t :inherit font-lock-preprocessor-face)) "\
Face used to highlight Haskell pragmas ({-# ... #-})." :group (quote haskell-appearance))

(defface haskell-liquid-haskell-annotation-face '((t :inherit haskell-pragma-face)) "\
Face used to highlight LiquidHaskell annotations ({-@ ... @-})." :group (quote haskell-appearance))

(defface haskell-literate-comment-face '((t :inherit font-lock-doc-face)) "\
Face with which to fontify literate comments.
Inherit from `default' to avoid fontification of them." :group (quote haskell-appearance))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-font-lock" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-ghc-support" "haskell-mode/haskell-ghc-support.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-ghc-support.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-ghc-support" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-hoogle" "haskell-mode/haskell-hoogle.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-hoogle.el

(autoload 'haskell-hoogle "haskell-mode/haskell-hoogle" "\
Do a Hoogle search for QUERY.
When `haskell-hoogle-command' is non-nil, this command runs
that.  Otherwise, it opens a hoogle search result in the browser.

If prefix argument INFO is given, then `haskell-hoogle-command'
is asked to show extra info for the items matching QUERY..

\(fn QUERY &optional INFO)" t nil)

(defalias 'hoogle 'haskell-hoogle)

(autoload 'haskell-hoogle-lookup-from-local "haskell-mode/haskell-hoogle" "\
Lookup by local hoogle.

\(fn)" t nil)

(autoload 'haskell-hayoo "haskell-mode/haskell-hoogle" "\
Do a Hayoo search for QUERY.

\(fn QUERY)" t nil)

(defalias 'hayoo 'haskell-hayoo)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-hoogle" '("haskell-h")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-indent" "haskell-mode/haskell-indent.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-indent.el

(let ((loads (get 'haskell-indent 'custom-loads))) (if (member '"haskell-mode/haskell-indent" loads) nil (put 'haskell-indent 'custom-loads (cons '"haskell-mode/haskell-indent" loads))))

(autoload 'turn-on-haskell-indent "haskell-mode/haskell-indent" "\
Turn on ``intelligent'' Haskell indentation mode.

\(fn)" nil nil)

(autoload 'haskell-indent-mode "haskell-mode/haskell-indent" "\
``Intelligent'' Haskell indentation mode.
This deals with the layout rule of Haskell.
\\[haskell-indent-cycle] starts the cycle which proposes new
possibilities as long as the TAB key is pressed.  Any other key
or mouse click terminates the cycle and is interpreted except for
RET which merely exits the cycle.
Other special keys are:
    \\[haskell-indent-insert-equal]
      inserts an =
    \\[haskell-indent-insert-guard]
      inserts an |
    \\[haskell-indent-insert-otherwise]
      inserts an | otherwise =
these functions also align the guards and rhs of the current definition
    \\[haskell-indent-insert-where]
      inserts a where keyword
    \\[haskell-indent-align-guards-and-rhs]
      aligns the guards and rhs of the region
    \\[haskell-indent-put-region-in-literate]
      makes the region a piece of literate code in a literate script

If `ARG' is falsey, toggle `haskell-indent-mode'.  Else sets
`haskell-indent-mode' to whether `ARG' is greater than 0.

Invokes `haskell-indent-hook' if not nil.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-indent" '("turn-off-haskell-indent" "haskell-indent-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-indentation" "haskell-mode/haskell-indentation.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-indentation.el

(let ((loads (get 'haskell-indentation 'custom-loads))) (if (member '"haskell-mode/haskell-indentation" loads) nil (put 'haskell-indentation 'custom-loads (cons '"haskell-mode/haskell-indentation" loads))))

(autoload 'haskell-indentation-mode "haskell-mode/haskell-indentation" "\
Haskell indentation mode that deals with the layout rule.
It rebinds RET, DEL and BACKSPACE, so that indentations can be
set and deleted as if they were real tabs.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-haskell-indentation "haskell-mode/haskell-indentation" "\
Turn on the haskell-indentation minor mode.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-indentation" '("haskell-indentation-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-interactive-mode" "haskell-mode/haskell-interactive-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-interactive-mode.el

(defface haskell-interactive-face-prompt '((t :inherit font-lock-function-name-face)) "\
Face for the prompt." :group (quote haskell-interactive))

(defface haskell-interactive-face-prompt2 '((t :inherit font-lock-keyword-face)) "\
Face for the prompt2 in multi-line mode." :group (quote haskell-interactive))

(defface haskell-interactive-face-compile-error '((t :inherit compilation-error)) "\
Face for compile errors." :group (quote haskell-interactive))

(defface haskell-interactive-face-compile-warning '((t :inherit compilation-warning)) "\
Face for compiler warnings." :group (quote haskell-interactive))

(defface haskell-interactive-face-result '((t :inherit font-lock-string-face)) "\
Face for the result." :group (quote haskell-interactive))

(defface haskell-interactive-face-garbage '((t :inherit font-lock-string-face)) "\
Face for trailing garbage after a command has completed." :group (quote haskell-interactive))

(autoload 'haskell-interactive-mode-reset-error "haskell-mode/haskell-interactive-mode" "\
Reset the error cursor position.

\(fn SESSION)" t nil)

(autoload 'haskell-interactive-mode-echo "haskell-mode/haskell-interactive-mode" "\
Echo a read only piece of text before the prompt.

\(fn SESSION MESSAGE &optional MODE)" nil nil)

(autoload 'haskell-process-show-repl-response "haskell-mode/haskell-interactive-mode" "\
Send LINE to the GHCi process and echo the result in some fashion.
Result will be printed in the minibuffer or presented using
function `haskell-presentation-present', depending on variable
`haskell-process-use-presentation-mode'.

\(fn LINE)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-interactive-mode" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-lexeme" "haskell-mode/haskell-lexeme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-lexeme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-lexeme" '("haskell-lexeme-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-load" "haskell-mode/haskell-load.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-load.el

(defface haskell-error-face '((((supports :underline (:style wave))) :underline (:style wave :color "#dc322f")) (t :inherit error)) "\
Face used for marking error lines." :group (quote haskell-mode))

(defface haskell-warning-face '((((supports :underline (:style wave))) :underline (:style wave :color "#b58900")) (t :inherit warning)) "\
Face used for marking warning lines." :group (quote haskell-mode))

(defface haskell-hole-face '((((supports :underline (:style wave))) :underline (:style wave :color "#6c71c4")) (t :inherit warning)) "\
Face used for marking hole lines." :group (quote haskell-mode))

(autoload 'haskell-process-reload-devel-main "haskell-mode/haskell-load" "\
Reload the module `DevelMain' and then run `DevelMain.update'.

This is for doing live update of the code of servers or GUI
applications.  Put your development version of the program in
`DevelMain', and define `update' to auto-start the program on a
new thread, and use the `foreign-store' package to access the
running context across :load/:reloads in GHCi.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-load" '("haskell-" "last-overlay-in-if" "first-overlay-in-if" "overlay-start" "with-overlay-properties")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-menu" "haskell-mode/haskell-menu.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-menu.el

(autoload 'haskell-menu "haskell-mode/haskell-menu" "\
Launch the Haskell sessions menu.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-menu" '("haskell-menu-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-mode" "haskell-mode/haskell-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-mode.el

(autoload 'haskell-version "haskell-mode/haskell-mode" "\
Show the `haskell-mode` version in the echo area.
With prefix argument HERE, insert it at point.

\(fn &optional HERE)" t nil)

(autoload 'haskell-mode-view-news "haskell-mode/haskell-mode" "\
Display information on recent changes to haskell-mode.

\(fn)" t nil)

(autoload 'haskell-mode "haskell-mode/haskell-mode" "\
Major mode for editing Haskell programs.

For more information see also Info node `(haskell-mode)Getting Started'.

\\<haskell-mode-map>

Literate Haskell scripts are supported via `literate-haskell-mode'.
The variable `haskell-literate' indicates the style of the script in the
current buffer.  See the documentation on this variable for more details.

Use `haskell-version' to find out what version of Haskell mode you are
currently using.

Additional Haskell mode modules can be hooked in via `haskell-mode-hook'.

Indentation modes:

    `haskell-indentation-mode', Kristof Bastiaensen, Gergely Risko
      Intelligent semi-automatic indentation Mk2

    `haskell-indent-mode', Guy Lapalme
      Intelligent semi-automatic indentation.

Interaction modes:

    `interactive-haskell-mode'
      Interact with per-project GHCi processes through a REPL and
      directory-aware sessions.

    `inf-haskell-mode'
      Interact with a GHCi process using comint-mode. Deprecated.

Other modes:

    `haskell-decl-scan-mode', Graeme E Moss
      Scans top-level declarations, and places them in a menu.

    `haskell-doc-mode', Hans-Wolfgang Loidl
      Echoes types of functions or syntax of keywords when the cursor is idle.

To activate a minor-mode, simply run the interactive command. For
example, `M-x haskell-doc-mode'. Run it again to disable it.

To enable a mode for every haskell-mode buffer, add a hook in
your Emacs configuration. To do that you can customize
`haskell-mode-hook' or add lines to your .emacs file. For
example, to enable `interactive-haskell-mode', use the following:

    (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

For more details see Info node `(haskell-mode)haskell-mode-hook'.

Minor modes that work well with `haskell-mode':

- `smerge-mode': show and work with diff3 conflict markers used
  by git, svn and other version control systems.

\(fn)" t nil)

(autoload 'haskell-forward-sexp "haskell-mode/haskell-mode" "\
Haskell specific version of `forward-sexp'.

Move forward across one balanced expression (sexp).  With ARG, do
it that many times.  Negative arg -N means move backward across N
balanced expressions.  This command assumes point is not in a
string or comment.

If unable to move over a sexp, signal `scan-error' with three
arguments: a message, the start of the obstacle (a parenthesis or
list marker of some kind), and end of the obstacle.

\(fn &optional ARG)" t nil)

(autoload 'literate-haskell-mode "haskell-mode/haskell-mode" "\
As `haskell-mode' but for literate scripts.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.[gh]s\\'" . haskell-mode))

(add-to-list 'auto-mode-alist '("\\.l[gh]s\\'" . literate-haskell-mode))

(add-to-list 'auto-mode-alist '("\\.hsc\\'" . haskell-mode))

(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))

(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

(add-to-list 'completion-ignored-extensions ".hi")

(autoload 'haskell-mode-generate-tags "haskell-mode/haskell-mode" "\
Generate tags using Hasktags.  This is synchronous function.

If optional AND-THEN-FIND-THIS-TAG argument is present it is used
with function `xref-find-definitions' after new table was
generated.

\(fn &optional AND-THEN-FIND-THIS-TAG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-mode" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-modules" "haskell-mode/haskell-modules.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-modules.el

(autoload 'haskell-session-installed-modules "haskell-mode/haskell-modules" "\
Get the modules installed in the current package set.

\(fn SESSION &optional DONTCREATE)" nil nil)

(autoload 'haskell-session-all-modules "haskell-mode/haskell-modules" "\
Get all modules -- installed or in the current project.
If DONTCREATE is non-nil don't create a new session.

\(fn SESSION &optional DONTCREATE)" nil nil)

(autoload 'haskell-session-project-modules "haskell-mode/haskell-modules" "\
Get the modules of the current project.
If DONTCREATE is non-nil don't create a new session.

\(fn SESSION &optional DONTCREATE)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-modules" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-move-nested" "haskell-mode/haskell-move-nested.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-move-nested.el

(autoload 'haskell-move-nested "haskell-mode/haskell-move-nested" "\
Shift the nested off-side-rule block adjacent to point by COLS columns to the right.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" nil nil)

(autoload 'haskell-move-nested-right "haskell-mode/haskell-move-nested" "\
Increase indentation of the following off-side-rule block adjacent to point.

Use a numeric prefix argument to indicate amount of indentation to apply.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" t nil)

(autoload 'haskell-move-nested-left "haskell-mode/haskell-move-nested" "\
Decrease indentation of the following off-side-rule block adjacent to point.

Use a numeric prefix argument to indicate amount of indentation to apply.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-move-nested" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-navigate-imports" "haskell-mode/haskell-navigate-imports.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-navigate-imports.el

(autoload 'haskell-navigate-imports "haskell-mode/haskell-navigate-imports" "\
Cycle the Haskell import lines or return to point (with prefix arg).

\(fn &optional RETURN)" t nil)

(autoload 'haskell-navigate-imports-go "haskell-mode/haskell-navigate-imports" "\
Go to the first line of a list of consecutive import lines. Cycles.

\(fn)" t nil)

(autoload 'haskell-navigate-imports-return "haskell-mode/haskell-navigate-imports" "\
Return to the non-import point we were at before going to the module list.
   If we were originally at an import list, we can just cycle through easily.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-navigate-imports" '("haskell-navigate-imports-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-presentation-mode" "haskell-mode/haskell-presentation-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-presentation-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-presentation-mode" '("haskell-presentation-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-process" "haskell-mode/haskell-process.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-process.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-process" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-repl" "haskell-mode/haskell-repl.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-repl.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-repl" '("haskell-interactive-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-sandbox" "haskell-mode/haskell-sandbox.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-sandbox.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-sandbox" '("haskell-sandbox-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-session" "haskell-mode/haskell-session.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-session.el

(autoload 'haskell-session-maybe "haskell-mode/haskell-session" "\
Maybe get the Haskell session, return nil if there isn't one.

\(fn)" nil nil)

(autoload 'haskell-session-process "haskell-mode/haskell-session" "\
Get the session process.

\(fn S)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-session" '("haskell-session")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-sort-imports" "haskell-mode/haskell-sort-imports.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-sort-imports.el

(autoload 'haskell-sort-imports "haskell-mode/haskell-sort-imports" "\
Sort the import list at point. It sorts the current group
i.e. an import list separated by blank lines on either side.

If the region is active, it will restrict the imports to sort
within that region.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-sort-imports" '("haskell-sort-imports-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-string" "haskell-mode/haskell-string.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-string.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-string" '("haskell-string-")))

;;;***

;;;### (autoloads nil "haskell-mode/haskell-unicode-input-method"
;;;;;;  "haskell-mode/haskell-unicode-input-method.el" (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-unicode-input-method.el

(autoload 'turn-on-haskell-unicode-input-method "haskell-mode/haskell-unicode-input-method" "\
Set input method `haskell-unicode'.
See Info node `Unicode(haskell-mode)' for more details.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-utils" "haskell-mode/haskell-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/haskell-utils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/haskell-utils" '("haskell-")))

;;;***

;;;### (autoloads nil "haskell-mode/highlight-uses-mode" "haskell-mode/highlight-uses-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/highlight-uses-mode.el

(autoload 'highlight-uses-mode "haskell-mode/highlight-uses-mode" "\
Minor mode for highlighting and jumping between uses.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/highlight-uses-mode" '("highlight-uses-mode-")))

;;;***

;;;### (autoloads nil "haskell-mode/inf-haskell" "haskell-mode/inf-haskell.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/inf-haskell.el

(let ((loads (get 'inferior-haskell 'custom-loads))) (if (member '"haskell-mode/inf-haskell" loads) nil (put 'inferior-haskell 'custom-loads (cons '"haskell-mode/inf-haskell" loads))))

(defalias 'run-haskell 'switch-to-haskell)

(autoload 'switch-to-haskell "haskell-mode/inf-haskell" "\
Show the inferior-haskell buffer.  Start the process if needed.

\(fn &optional ARG)" t nil)

(autoload 'inferior-haskell-load-file "haskell-mode/inf-haskell" "\
Pass the current buffer's file to the inferior haskell process.
If prefix arg \\[universal-argument] is given, just reload the previous file.

\(fn &optional RELOAD)" t nil)

(autoload 'inferior-haskell-load-and-run "haskell-mode/inf-haskell" "\
Pass the current buffer's file to haskell and then run a COMMAND.

\(fn COMMAND)" t nil)

(autoload 'inferior-haskell-send-decl "haskell-mode/inf-haskell" "\
Send current declaration to inferior-haskell process.

\(fn)" t nil)

(autoload 'inferior-haskell-type "haskell-mode/inf-haskell" "\
Query the haskell process for the type of the given expression.
If optional argument `insert-value' is non-nil, insert the type above point
in the buffer.  This can be done interactively with the \\[universal-argument] prefix.
The returned info is cached for reuse by `haskell-doc-mode'.

\(fn EXPR &optional INSERT-VALUE)" t nil)

(autoload 'inferior-haskell-kind "haskell-mode/inf-haskell" "\
Query the haskell process for the kind of the given expression.

\(fn TYPE)" t nil)

(autoload 'inferior-haskell-info "haskell-mode/inf-haskell" "\
Query the haskell process for the info of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-definition "haskell-mode/inf-haskell" "\
Attempt to locate and jump to the definition of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-haddock "haskell-mode/inf-haskell" "\
Find and open the Haddock documentation of SYM.
Make sure to load the file into GHCi or Hugs first by using C-c C-l.
Only works for functions in a package installed with ghc-pkg, or
whatever the value of `haskell-package-manager-name' is.

This function needs to find which package a given module belongs
to.  In order to do this, it computes a module-to-package lookup
alist, which is expensive to compute (it takes upwards of five
seconds with more than about thirty installed packages).  As a
result, we cache it across sessions using the cache file
referenced by `inferior-haskell-module-alist-file'. We test to
see if this is newer than `haskell-package-conf-file' every time
we load it.

\(fn SYM)" t nil)

(autoload 'inf-haskell-mode "haskell-mode/inf-haskell" "\
Minor mode for enabling inf-haskell process interaction.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/inf-haskell" '("inf" "haskell-p")))

;;;***

;;;### (autoloads nil "haskell-mode/w3m-haddock" "haskell-mode/w3m-haddock.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-mode/w3m-haddock.el

(defface w3m-haddock-heading-face '((((class color)) :inherit highlight)) "\
Face for quarantines." :group (quote haskell))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-mode/w3m-haddock" '("w3m-haddock-" "haskell-w3m-")))

;;;***

;;;### (autoloads nil "helm-ag-r/helm-ag-r" "helm-ag-r/helm-ag-r.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from helm-ag-r/helm-ag-r.el

(autoload 'helm-ag-r-shell-history "helm-ag-r/helm-ag-r" "\
Search shell history(I don't make sure without zsh).

\(fn)" t nil)

(autoload 'helm-ag-r-git-logs "helm-ag-r/helm-ag-r" "\
Search git's commit log.
This function use OPTIONS to git log command if you are specified

\(fn &optional OPTIONS)" t nil)

(autoload 'helm-ag-r "helm-ag-r/helm-ag-r" "\
The helm-ag-r find something by ag program.
Default is `default-directory variable
 (i.e. current directory).  the FILE-OR-DIRECTORY is passed to ag's [PATH].
If you set the SOURCE argument, override helm-ag-r-source variable by
 your specified source.(but not delete original source)

\(fn &optional FILE-OR-DIRECTORY SOURCE BUFFER)" t nil)

(autoload 'helm-ag-r-current-file "helm-ag-r/helm-ag-r" "\
Search from current-file.

\(fn)" t nil)

(autoload 'helm-ag-r-from-git-repo "helm-ag-r/helm-ag-r" "\
Search from git repository.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-c-yasnippet/helm-c-yasnippet" "helm-c-yasnippet/helm-c-yasnippet.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from helm-c-yasnippet/helm-c-yasnippet.el

(autoload 'helm-yas-complete "helm-c-yasnippet/helm-c-yasnippet" "\
List of yasnippet snippets using `helm' interface.

\(fn)" t nil)

(autoload 'helm-yas-visit-snippet-file "helm-c-yasnippet/helm-c-yasnippet" "\
List of yasnippet snippet files

\(fn)" t nil)

(autoload 'helm-yas-create-snippet-on-region "helm-c-yasnippet/helm-c-yasnippet" "\
Create a snippet from region.

\(fn &optional START END FILE-NAME)" t nil)

;;;***

;;;### (autoloads nil "helm-descbinds/helm-descbinds" "helm-descbinds/helm-descbinds.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from helm-descbinds/helm-descbinds.el

(defvar helm-descbinds-mode nil "\
Non-nil if Helm-Descbinds mode is enabled.
See the `helm-descbinds-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-descbinds-mode'.")

(custom-autoload 'helm-descbinds-mode "helm-descbinds/helm-descbinds" nil)

(autoload 'helm-descbinds-mode "helm-descbinds/helm-descbinds" "\
Use `helm' for `describe-bindings'.

\(fn &optional ARG)" t nil)

(autoload 'helm-descbinds-install "helm-descbinds/helm-descbinds" "\
Use `helm-descbinds' as a replacement of `describe-bindings'.

\(fn)" t nil)

(autoload 'helm-descbinds-uninstall "helm-descbinds/helm-descbinds" "\
Restore original `describe-bindings'.

\(fn)" t nil)

(autoload 'helm-descbinds "helm-descbinds/helm-descbinds" "\
A convenient helm version of `describe-bindings'.

Turning on `helm-descbinds-mode' is the recommended way to
install this command to replace `describe-bindings'.

You complete against a list of keys + command pairs presented in
a similar way as `describe-bindings' does, split into sections
defined by the types of the key bindings (minor and major modes,
global bindings, etc).

The default action executes a command as if the binding had been
entered, or narrows the commands according to a prefix key,
respectively.

The persistent action pops up a help buffer for the selected
command without quitting.

For key translation maps, the default actions are not very
useful, yet they are listed for completeness.

\(fn &optional PREFIX BUFFER)" t nil)

;;;***

;;;### (autoloads nil "helm-ghq/helm-ghq" "helm-ghq/helm-ghq.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from helm-ghq/helm-ghq.el

(autoload 'helm-ghq "helm-ghq/helm-ghq" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-gtags/helm-gtags" "helm-gtags/helm-gtags.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from helm-gtags/helm-gtags.el

(autoload 'helm-gtags-clear-all-cache "helm-gtags/helm-gtags" "\


\(fn)" t nil)

(autoload 'helm-gtags-clear-cache "helm-gtags/helm-gtags" "\


\(fn)" t nil)

(autoload 'helm-gtags-next-history "helm-gtags/helm-gtags" "\
Jump to next position on context stack

\(fn)" t nil)

(autoload 'helm-gtags-previous-history "helm-gtags/helm-gtags" "\
Jump to previous position on context stack

\(fn)" t nil)

(autoload 'helm-gtags-select "helm-gtags/helm-gtags" "\


\(fn)" t nil)

(autoload 'helm-gtags-select-path "helm-gtags/helm-gtags" "\


\(fn)" t nil)

(autoload 'helm-gtags-tags-in-this-function "helm-gtags/helm-gtags" "\
Show tagnames which are referenced in this function and jump to it.

\(fn)" t nil)

(autoload 'helm-gtags-create-tags "helm-gtags/helm-gtags" "\


\(fn DIR LABEL)" t nil)

(autoload 'helm-gtags-find-tag "helm-gtags/helm-gtags" "\
Jump to definition

\(fn TAG)" t nil)

(autoload 'helm-gtags-find-tag-other-window "helm-gtags/helm-gtags" "\
Jump to definition in other window.

\(fn TAG)" t nil)

(autoload 'helm-gtags-find-rtag "helm-gtags/helm-gtags" "\
Jump to referenced point

\(fn TAG)" t nil)

(autoload 'helm-gtags-find-symbol "helm-gtags/helm-gtags" "\
Jump to the symbol location

\(fn TAG)" t nil)

(autoload 'helm-gtags-find-pattern "helm-gtags/helm-gtags" "\
Grep and jump by gtags tag files.

\(fn PATTERN)" t nil)

(autoload 'helm-gtags-find-files "helm-gtags/helm-gtags" "\
Find file from tagged with gnu global.

\(fn FILE)" t nil)

(autoload 'helm-gtags-find-tag-from-here "helm-gtags/helm-gtags" "\
Jump point by current point information.
Jump to definition point if cursor is on its reference.
Jump to reference point if curosr is on its definition

\(fn)" t nil)

(autoload 'helm-gtags-dwim "helm-gtags/helm-gtags" "\
Find by context. Here is
- on include statement then jump to included file
- on symbol definition then jump to its references
- on reference point then jump to its definition.

\(fn)" t nil)

(autoload 'helm-gtags-parse-file "helm-gtags/helm-gtags" "\
Parse current file with gnu global. This is similar to `imenu'.
You can jump definitions of functions, symbols in this file.

\(fn)" t nil)

(autoload 'helm-gtags-pop-stack "helm-gtags/helm-gtags" "\
Jump to previous point on the context stack and pop it from stack.

\(fn)" t nil)

(autoload 'helm-gtags-show-stack "helm-gtags/helm-gtags" "\
Show current context stack.

\(fn)" t nil)

(autoload 'helm-gtags-clear-stack "helm-gtags/helm-gtags" "\
Clear current context stack.

\(fn)" t nil)

(autoload 'helm-gtags-clear-all-stacks "helm-gtags/helm-gtags" "\
Clear all context stacks.

\(fn)" t nil)

(autoload 'helm-gtags-update-tags "helm-gtags/helm-gtags" "\
Update TAG file. Update All files with `C-u' prefix.
Generate new TAG file in selected directory with `C-u C-u'

\(fn)" t nil)

(autoload 'helm-gtags-resume "helm-gtags/helm-gtags" "\
Resurrect previously invoked `helm-gtags` command.

\(fn)" t nil)

(autoload 'helm-gtags-mode "helm-gtags/helm-gtags" "\
Toggle Helm-Gtags mode on or off.
With a prefix argument ARG, enable Helm-Gtags mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{helm-gtags-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-swoop/helm-swoop" "helm-swoop/helm-swoop.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from helm-swoop/helm-swoop.el

(autoload 'helm-swoop-back-to-last-point "helm-swoop/helm-swoop" "\
Go back to last position where `helm-swoop' was called

\(fn &optional $CANCEL)" t nil)

(autoload 'helm-swoop "helm-swoop/helm-swoop" "\
List the all lines to another buffer, which is able to squeeze by
 any words you input. At the same time, the original buffer's cursor
 is jumping line to line according to moving up and down the list.

\(fn &key $QUERY $SOURCE ($MULTILINE current-prefix-arg))" t nil)

(autoload 'helm-swoop-from-isearch "helm-swoop/helm-swoop" "\
Invoke `helm-swoop' from isearch.

\(fn)" t nil)

(autoload 'helm-multi-swoop "helm-swoop/helm-swoop" "\
Usage:
M-x helm-multi-swoop
1. Select any buffers by [C-SPC] or [M-SPC]
2. Press [RET] to start helm-multi-swoop

C-u M-x helm-multi-swoop
If you have done helm-multi-swoop before, you can skip select buffers step.
Last selected buffers will be applied to helm-multi-swoop.

\(fn &optional $QUERY $BUFLIST)" t nil)

(autoload 'helm-multi-swoop-all "helm-swoop/helm-swoop" "\
Apply all buffers to helm-multi-swoop

\(fn &optional $QUERY)" t nil)

(autoload 'helm-multi-swoop-org "helm-swoop/helm-swoop" "\
Applies all org-mode buffers to helm-multi-swoop

\(fn &optional $QUERY)" t nil)

(autoload 'helm-multi-swoop-current-mode "helm-swoop/helm-swoop" "\
Applies all buffers of the same mode as the current buffer to helm-multi-swoop

\(fn &optional $QUERY)" t nil)

(autoload 'helm-multi-swoop-projectile "helm-swoop/helm-swoop" "\
Apply all opened buffers of the current project to helm-multi-swoop

\(fn &optional $QUERY)" t nil)

(autoload 'helm-swoop-without-pre-input "helm-swoop/helm-swoop" "\
Start helm-swoop without pre input query.

\(fn)" t nil)

(autoload 'helm-swoop-symble-pre-input "helm-swoop/helm-swoop" "\
Start helm-swoop without pre input query.

\(fn)" t nil)

(autoload 'helm-multi-swoop-edit "helm-swoop/helm-swoop" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "hi2/hi2" "hi2/hi2.el" (0 0 0 0))
;;; Generated autoloads from hi2/hi2.el

(autoload 'hi2-mode "hi2/hi2" "\
Haskell indentation mode that deals with the layout rule.
It rebinds RET, DEL and BACKSPACE, so that indentations can be
set and deleted as if they were real tabs.  It supports
autofill-mode.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-hi2 "hi2/hi2" "\
Turn on the hi2 minor mode.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "hl-line+/hl-line+" "hl-line+/hl-line+.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from hl-line+/hl-line+.el

(defface hl-line '((t (:background "SlateGray3"))) "\
*Face to use for `hl-line-face'." :group (quote hl-line))

(defvar hl-line-flash-show-period 1 "\
*Number of seconds for `hl-line-flash' to highlight the line.")

(custom-autoload 'hl-line-flash-show-period "hl-line+/hl-line+" t)

(defvar hl-line-inhibit-highlighting-for-modes nil "\
*Modes where highlighting is inhibited for `hl-line-highlight-now'.
A list of `major-mode' values (symbols).")

(custom-autoload 'hl-line-inhibit-highlighting-for-modes "hl-line+/hl-line+" t)

(defvar hl-line-overlay-priority -50 "\
*Priority to use for `hl-line-overlay' and `global-hl-line-overlay'.
A higher priority can make the hl-line highlighting appear on top of
other overlays that might exist.")

(custom-autoload 'hl-line-overlay-priority "hl-line+/hl-line+" t)

(defalias 'toggle-hl-line-when-idle 'hl-line-toggle-when-idle)

(autoload 'hl-line-toggle-when-idle "hl-line+/hl-line+" "\
Turn on or off using `global-hl-line-mode' when Emacs is idle.
When on, use `global-hl-line-mode' whenever Emacs is idle.
With prefix argument, turn on if ARG > 0; else turn off.

In Lisp code, non-nil optional second arg MSGP means display a message
showing the new value.

\(fn &optional ARG MSGP)" t nil)

(autoload 'hl-line-when-idle-interval "hl-line+/hl-line+" "\
Set wait until using `global-hl-line-mode' when Emacs is idle.
Whenever Emacs is idle for this many seconds, `global-hl-line-mode'
will be turned on.

To turn on or off using `global-hl-line-mode' when idle,
use `\\[toggle-hl-line-when-idle].

\(fn SECS)" t nil)

(defalias 'flash-line-highlight 'hl-line-flash)

(autoload 'hl-line-flash "hl-line+/hl-line+" "\
Highlight the current line for `hl-line-flash-show-period' seconds.
With a prefix argument, highlight for that many seconds.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "htmlize/htmlize" "htmlize/htmlize.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from htmlize/htmlize.el

(autoload 'htmlize-buffer "htmlize/htmlize" "\
Convert BUFFER to HTML, preserving colors and decorations.

The generated HTML is available in a new buffer, which is returned.
When invoked interactively, the new buffer is selected in the current
window.  The title of the generated document will be set to the buffer's
file name or, if that's not available, to the buffer's name.

Note that htmlize doesn't fontify your buffers, it only uses the
decorations that are already present.  If you don't set up font-lock or
something else to fontify your buffers, the resulting HTML will be
plain.  Likewise, if you don't like the choice of colors, fix the mode
that created them, or simply alter the faces it uses.

\(fn &optional BUFFER)" t nil)

(autoload 'htmlize-region "htmlize/htmlize" "\
Convert the region to HTML, preserving colors and decorations.
See `htmlize-buffer' for details.

\(fn BEG END)" t nil)

(autoload 'htmlize-file "htmlize/htmlize" "\
Load FILE, fontify it, convert it to HTML, and save the result.

Contents of FILE are inserted into a temporary buffer, whose major mode
is set with `normal-mode' as appropriate for the file type.  The buffer
is subsequently fontified with `font-lock' and converted to HTML.  Note
that, unlike `htmlize-buffer', this function explicitly turns on
font-lock.  If a form of highlighting other than font-lock is desired,
please use `htmlize-buffer' directly on buffers so highlighted.

Buffers currently visiting FILE are unaffected by this function.  The
function does not change current buffer or move the point.

If TARGET is specified and names a directory, the resulting file will be
saved there instead of to FILE's directory.  If TARGET is specified and
does not name a directory, it will be used as output file name.

\(fn FILE &optional TARGET)" t nil)

(autoload 'htmlize-many-files "htmlize/htmlize" "\
Convert FILES to HTML and save the corresponding HTML versions.

FILES should be a list of file names to convert.  This function calls
`htmlize-file' on each file; see that function for details.  When
invoked interactively, you are prompted for a list of files to convert,
terminated with RET.

If TARGET-DIRECTORY is specified, the HTML files will be saved to that
directory.  Normally, each HTML file is saved to the directory of the
corresponding source file.

\(fn FILES &optional TARGET-DIRECTORY)" t nil)

(autoload 'htmlize-many-files-dired "htmlize/htmlize" "\
HTMLize dired-marked files.

\(fn ARG &optional TARGET-DIRECTORY)" t nil)

;;;***

;;;### (autoloads nil "idle-require/idle-require" "idle-require/idle-require.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from idle-require/idle-require.el

(autoload 'idle-require "idle-require/idle-require" "\
Add FEATURE to `idle-require-symbols'.
FILENAME and NOERROR are provided for compatibility to `require'.  If FILENAME
is non-nil, it is added instead of FEATURE.  NOERROR has no effect as that is
the default.

\(fn FEATURE &optional FILENAME NOERROR)" nil nil)

(autoload 'idle-require-mode "idle-require/idle-require" "\
Load unloaded autoload functions when Emacs becomes idle.
If `idle-require-symbols' is a list of files, those will be loaded.
Otherwise all autoload functions will be loaded.

Loading all autoload functions can easily triple Emacs' memory footprint.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "image-dired+/image-dired+" "image-dired+/image-dired+.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from image-dired+/image-dired+.el

(autoload 'imagex-dired-show-image-thumbnails "image-dired+/image-dired+" "\
Utility to insert thumbnail of FILES to BUFFER.
That thumbnails are not associated to any dired buffer although.

\(fn BUFFER FILES &optional APPEND)" nil nil)

(autoload 'image-diredx-setup "image-dired+/image-dired+" "\
Setup image-dired extensions.

\(fn)" nil nil)

(defvar image-diredx-adjust-mode nil "\
Non-nil if Image-Diredx-Adjust mode is enabled.
See the `image-diredx-adjust-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `image-diredx-adjust-mode'.")

(custom-autoload 'image-diredx-adjust-mode "image-dired+/image-dired+" nil)

(autoload 'image-diredx-adjust-mode "image-dired+/image-dired+" "\
Extension for `image-dired' show image as long as adjusting to frame.

\(fn &optional ARG)" t nil)

(defvar image-diredx-async-mode nil "\
Non-nil if Image-Diredx-Async mode is enabled.
See the `image-diredx-async-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `image-diredx-async-mode'.")

(custom-autoload 'image-diredx-async-mode "image-dired+/image-dired+" nil)

(autoload 'image-diredx-async-mode "image-dired+/image-dired+" "\
Extension for `image-dired' asynchrounous image thumbnail.

\(fn &optional ARG)" t nil)
(add-hook 'image-dired-thumbnail-mode-hook 'image-diredx-setup)
(image-diredx-async-mode 1)

;;;***

;;;### (autoloads nil "indent-guide/indent-guide" "indent-guide/indent-guide.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from indent-guide/indent-guide.el

(autoload 'indent-guide-mode "indent-guide/indent-guide" "\
show vertical lines to guide indentation

\(fn &optional ARG)" t nil)

(defvar indent-guide-global-mode nil "\
Non-nil if Indent-Guide-Global mode is enabled.
See the `indent-guide-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `indent-guide-global-mode'.")

(custom-autoload 'indent-guide-global-mode "indent-guide/indent-guide" nil)

(autoload 'indent-guide-global-mode "indent-guide/indent-guide" "\
Toggle Indent-Guide mode in all buffers.
With prefix ARG, enable Indent-Guide-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Indent-Guide mode is enabled in all buffers where
`(lambda nil (unless (cl-some (quote derived-mode-p) indent-guide-inhibit-modes) (indent-guide-mode 1)))' would do it.
See `indent-guide-mode' for more information on Indent-Guide mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "inf-ruby/inf-ruby" "inf-ruby/inf-ruby.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from inf-ruby/inf-ruby.el

(defvar ruby-source-modes '(ruby-mode enh-ruby-mode) "\
Used to determine if a buffer contains Ruby source code.
If it's loaded into a buffer that is in one of these major modes, it's
considered a ruby source file by `ruby-load-file'.
Used by these commands to determine defaults.")

(autoload 'inf-ruby-setup-keybindings "inf-ruby/inf-ruby" "\
Hook up `inf-ruby-minor-mode' to each of `ruby-source-modes'.

\(fn)" nil nil)

(autoload 'inf-ruby-minor-mode "inf-ruby/inf-ruby" "\
Minor mode for interacting with the inferior process buffer.

The following commands are available:

\\{inf-ruby-minor-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'inf-ruby "inf-ruby/inf-ruby" "\
Run an inferior Ruby process in a buffer.
With prefix argument, prompts for which Ruby implementation
\(from the list `inf-ruby-implementations') to use.  Runs the
hooks `inf-ruby-mode-hook' (after the `comint-mode-hook' is
run).

\(fn &optional IMPL)" t nil)

(autoload 'run-ruby "inf-ruby/inf-ruby" "\
Run an inferior Ruby process, input and output via buffer `*NAME*'.
If there is a process already running in `*NAME*', switch to that buffer.

NAME defaults to \"ruby\". COMMAND defaults to the default entry
in `inf-ruby-implementations'.

\(Type \\[describe-mode] in the process buffer for the list of commands.)

\(fn &optional COMMAND NAME)" t nil)

(autoload 'inf-ruby-switch-setup "inf-ruby/inf-ruby" "\
Modify `rspec-compilation-mode' and `ruby-compilation-mode'
keymaps to bind `inf-ruby-switch-from-compilation' to `С-x C-q'.

\(fn)" nil nil)

(autoload 'inf-ruby-console-auto "inf-ruby/inf-ruby" "\
Run the appropriate Ruby console command.
The command and and the directory to run it from are detected
automatically.

\(fn)" t nil)

(autoload 'inf-ruby-console-rails "inf-ruby/inf-ruby" "\
Run Rails console in DIR.

\(fn DIR)" t nil)

(autoload 'inf-ruby-console-gem "inf-ruby/inf-ruby" "\
Run IRB console for the gem in DIR.
The main module should be loaded automatically.  If DIR contains a
Gemfile, it should use the `gemspec' instruction.

\(fn DIR)" t nil)

(autoload 'inf-ruby-auto-enter "inf-ruby/inf-ruby" "\
Switch to `inf-ruby-mode' if the breakpoint pattern matches the current line.

\(fn)" nil nil)

(autoload 'inf-ruby-auto-exit "inf-ruby/inf-ruby" "\
Return to the previous compilation mode if INPUT is a debugger exit command.

\(fn INPUT)" nil nil)

(autoload 'inf-ruby-console-default "inf-ruby/inf-ruby" "\
Run custom console.rb, Pry, or bundle console, in DIR.

\(fn DIR)" t nil)

(autoload 'inf-ruby-file-contents-match "inf-ruby/inf-ruby" "\


\(fn FILE REGEXP &optional MATCH-GROUP)" nil nil)
 (dolist (mode ruby-source-modes) (add-hook (intern (format "%s-hook" mode)) 'inf-ruby-minor-mode))

;;;***

;;;### (autoloads nil "irony-eldoc/irony-eldoc" "irony-eldoc/irony-eldoc.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from irony-eldoc/irony-eldoc.el

(autoload 'irony-eldoc "irony-eldoc/irony-eldoc" "\
Eldoc support in irony-mode.

eldoc is a built-in Emacs mode for displaying documentation about
a symbol or function call at point in the message buffer (see
`eldoc-mode').

To use:

- Enable the minor mode `irony-eldoc', as well as
  `eldoc-mode'. For an example, place point on top of a symbol,
  or inside a function call.

- It is easiest to add `irony-eldoc' to `irony-mode-hook', if you
  already have `irony-mode' set up.

Notes:

- Sometimes the information `irony-eldoc' uses can go out of
  date. In that case, try calling `irony-eldoc-reset'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "irony-mode/irony" "irony-mode/irony.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from irony-mode/irony.el

(defvar irony-additional-clang-options nil "\
Additional command line options to pass down to libclang.

Please, do NOT use this variable to add header search paths, only
additional warnings or compiler options.

These compiler options will be prepended to the command line, in
order to not override the value coming from a compilation
database.")

(custom-autoload 'irony-additional-clang-options "irony-mode/irony" t)

(autoload 'irony-mode "irony-mode/irony" "\
Minor mode for C, C++ and Objective-C, powered by libclang.

\(fn &optional ARG)" t nil)

(autoload 'irony-version "irony-mode/irony" "\
Return the version number of the file irony.el.

If called interactively display the version in the echo area.

\(fn &optional SHOW-VERSION)" t nil)

(autoload 'irony-server-kill "irony-mode/irony" "\
Kill the running irony-server process, if any.

\(fn)" t nil)

(autoload 'irony-get-type "irony-mode/irony" "\
Get the type of symbol under cursor.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "irony-mode/irony-cdb" "irony-mode/irony-cdb.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from irony-mode/irony-cdb.el

(autoload 'irony-cdb-autosetup-compile-options "irony-mode/irony-cdb" "\


\(fn)" t nil)

(autoload 'irony-cdb-menu "irony-mode/irony-cdb" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "irony-mode/irony-cdb-clang-complete" "irony-mode/irony-cdb-clang-complete.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from irony-mode/irony-cdb-clang-complete.el

(autoload 'irony-cdb-clang-complete "irony-mode/irony-cdb-clang-complete" "\


\(fn COMMAND &rest ARGS)" nil nil)

;;;***

;;;### (autoloads nil "irony-mode/irony-cdb-json" "irony-mode/irony-cdb-json.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from irony-mode/irony-cdb-json.el

(autoload 'irony-cdb-json "irony-mode/irony-cdb-json" "\


\(fn COMMAND &rest ARGS)" nil nil)

(autoload 'irony-cdb-json-add-compile-commands-path "irony-mode/irony-cdb-json" "\
Add an out-of-source compilation database.

Files below the PROJECT-ROOT directory will use the JSON
Compilation Database as specified by COMPILE-COMMANDS-PATH.

The JSON Compilation Database are often generated in the build
directory. This functions helps mapping out-of-source build
directories to project directory.

\(fn PROJECT-ROOT COMPILE-COMMANDS-PATH)" t nil)

(autoload 'irony-cdb-json-select "irony-mode/irony-cdb-json" "\
Select CDB to use with a prompt.

It is useful when you have several CDBs with the same project
root.

The completion function used internally is `completing-read' so
it could easily be used with other completion functions by
temporarily using a let-bind on `completing-read-function'. Or
even helm by enabling `helm-mode' before calling the function.

\(fn)" t nil)

(autoload 'irony-cdb-json-select-most-recent "irony-mode/irony-cdb-json" "\
Select CDB that is most recently modified.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "irony-mode/irony-cdb-libclang" "irony-mode/irony-cdb-libclang.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from irony-mode/irony-cdb-libclang.el

(autoload 'irony-cdb-libclang "irony-mode/irony-cdb-libclang" "\


\(fn COMMAND &rest ARGS)" nil nil)

;;;***

;;;### (autoloads nil "irony-mode/irony-completion" "irony-mode/irony-completion.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from irony-mode/irony-completion.el

(autoload 'irony-completion-at-point "irony-mode/irony-completion" "\


\(fn)" nil nil)

(autoload 'irony-completion-at-point-async "irony-mode/irony-completion" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "jedi/jedi" "jedi/jedi.el" (0 0 0 0))
;;; Generated autoloads from jedi/jedi.el

(autoload 'jedi:ac-setup "jedi/jedi" "\
Add Jedi AC sources to `ac-sources'.

If auto-completion is all you need, you can call this function instead
of `jedi:setup', like this::

   (add-hook 'python-mode-hook 'jedi:ac-setup)

Note that this function calls `auto-complete-mode' if it is not
already enabled, for people who don't call `global-auto-complete-mode'
in their Emacs configuration.

\(fn)" t nil)

(autoload 'jedi:complete "jedi/jedi" "\
Complete code at point.

\(fn &key (EXPAND ac-expand-on-auto-complete))" t nil)

(autoload 'jedi:auto-complete-mode "jedi/jedi" "\


\(fn)" nil nil)

(setq jedi:setup-function #'jedi:ac-setup jedi:mode-function #'jedi:auto-complete-mode)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jedi/jedi" '("jedi:")))

;;;***

;;;### (autoloads nil "jedi/jedi-core" "jedi/jedi-core.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from jedi/jedi-core.el

(autoload 'jedi:start-dedicated-server "jedi/jedi-core" "\
Start Jedi server dedicated to this buffer.
This is useful, for example, when you want to use different
`sys.path' for some buffer.  When invoked as an interactive
command, it asks you how to start the Jedi server.  You can edit
the command in minibuffer to specify the way Jedi server run.

If you want to setup how Jedi server is started programmatically
per-buffer/per-project basis, make `jedi:server-command' and
`jedi:server-args' buffer local and set it in `python-mode-hook'.
See also: `jedi:server-args'.

\(fn COMMAND)" t nil)

(autoload 'helm-jedi-related-names "jedi/jedi-core" "\
Find related names of the object at point using `helm' interface.

\(fn)" t nil)

(autoload 'anything-jedi-related-names "jedi/jedi-core" "\
Find related names of the object at point using `anything' interface.

\(fn)" t nil)

(autoload 'jedi:setup "jedi/jedi-core" "\
Fully setup jedi.el for current buffer.
It setups `ac-sources' or `company-backends' and turns
`jedi-mode' on.

This function is intended to be called from `python-mode-hook',
like this::

       (add-hook 'python-mode-hook 'jedi:setup)

You can also call this function as a command, to quickly test
what jedi can do.

\(fn)" t nil)

(autoload 'jedi:install-server "jedi/jedi-core" "\
This command installs Jedi server script jediepcserver.py in a
Python environment dedicated to Emacs.  By default, the
environment is at ``~/.emacs.d/.python-environments/default/``.
This environment is automatically created by ``virtualenv`` if it
does not exist.

Run this command (i.e., type ``M-x jedi:install-server RET``)
whenever Jedi.el shows a message to do so.  It is a good idea to
run this every time after you update Jedi.el to sync version of
Python modules used by Jedi.el and Jedi.el itself.

You can modify the location of the environment by changing
`jedi:environment-root' and/or `python-environment-directory'.  More
specifically, Jedi.el will install Python modules under the directory
``PYTHON-ENVIRONMENT-DIRECTORY/JEDI:ENVIRONMENT-ROOT``.  Note that you
need command line program ``virtualenv``.  If you have the command in
an unusual location, use `python-environment-virtualenv' to specify the
location.

.. NOTE:: jediepcserver.py is installed in a virtual environment but it
   does not mean Jedi.el cannot recognize the modules in virtual
   environment you are using for your Python development.  Jedi
   EPC server recognize the virtualenv it is in (i.e., the
   environment variable ``VIRTUAL_ENV`` in your Emacs) and then
   add modules in that environment to its ``sys.path``.  You can
   also add ``--virtual-env PATH/TO/ENV`` to `jedi:server-args'
   to include modules of virtual environment even you launch
   Emacs outside of the virtual environment.

.. NOTE:: It is highly recommended to use this command to install
   Python modules for Jedi.el.  You still can install Python
   modules used by Jedi.el manually.  However, you are then
   responsible for keeping Jedi.el and Python modules compatible.

See also:

- https://github.com/tkf/emacs-jedi/pull/72
- https://github.com/tkf/emacs-jedi/issues/140#issuecomment-37358527

\(fn)" t nil)

(autoload 'jedi:install-server-block "jedi/jedi-core" "\
Blocking version `jedi:install-server'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "js2-mode/js2-imenu-extras" "js2-mode/js2-imenu-extras.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from js2-mode/js2-imenu-extras.el

(autoload 'js2-imenu-extras-setup "js2-mode/js2-imenu-extras" "\


\(fn)" nil nil)

(autoload 'js2-imenu-extras-mode "js2-mode/js2-imenu-extras" "\
Toggle Imenu support for frameworks and structural patterns.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "js2-mode/js2-mode" "js2-mode/js2-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from js2-mode/js2-mode.el

(autoload 'js2-highlight-unused-variables-mode "js2-mode/js2-mode" "\
Toggle highlight of unused variables.

\(fn &optional ARG)" t nil)

(autoload 'js2-minor-mode "js2-mode/js2-mode" "\
Minor mode for running js2 as a background linter.
This allows you to use a different major mode for JavaScript editing,
such as `js-mode', while retaining the asynchronous error/warning
highlighting features of `js2-mode'.

\(fn &optional ARG)" t nil)

(autoload 'js2-mode "js2-mode/js2-mode" "\
Major mode for editing JavaScript code.

\(fn)" t nil)

(autoload 'js2-jsx-mode "js2-mode/js2-mode" "\
Major mode for editing JSX code.

To customize the indentation for this mode, set the SGML offset
variables (`sgml-basic-offset' et al) locally, like so:

  (defun set-jsx-indentation ()
    (setq-local sgml-basic-offset js2-basic-offset))
  (add-hook 'js2-jsx-mode-hook #'set-jsx-indentation)

\(fn)" t nil)

;;;***

;;;### (autoloads nil "json-mode/json-mode" "json-mode/json-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from json-mode/json-mode.el

(autoload 'json-mode "json-mode/json-mode" "\
Major mode for editing JSON files

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(autoload 'json-mode-show-path "json-mode/json-mode" "\


\(fn)" t nil)

(autoload 'json-mode-beautify "json-mode/json-mode" "\
Beautify / pretty-print the active region (or the entire buffer if no active region).

\(fn)" t nil)

;;;***

;;;### (autoloads nil "json-reformat/json-reformat" "json-reformat/json-reformat.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from json-reformat/json-reformat.el

(autoload 'json-reformat-region "json-reformat/json-reformat" "\
Reformat the JSON in the specified region.

If you want to customize the reformat style,
please see the documentation of `json-reformat:indent-width'
and `json-reformat:pretty-string?'.

\(fn BEGIN END)" t nil)

;;;***

;;;### (autoloads nil "json-snatcher/json-snatcher" "json-snatcher/json-snatcher.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from json-snatcher/json-snatcher.el

(autoload 'jsons-print-path "json-snatcher/json-snatcher" "\
Print the path to the JSON value under point, and save it in the kill ring.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "key-chord/key-chord" "key-chord/key-chord.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from key-chord/key-chord.el

(autoload 'key-chord-mode "key-chord/key-chord" "\
Toggle key chord mode.
With positive ARG enable the mode. With zero or negative arg disable the mode.
A key chord is two keys that are pressed simultaneously, or one key quickly
pressed twice.

See functions `key-chord-define-global', `key-chord-define-local', and
`key-chord-define' and variables `key-chord-two-keys-delay' and
`key-chord-one-key-delay'.

\(fn ARG)" t nil)

(autoload 'key-chord-define-global "key-chord/key-chord" "\
Define a key-chord of the two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

Note that KEYS defined locally in the current buffer will have precedence.

\(fn KEYS COMMAND)" t nil)

(autoload 'key-chord-define-local "key-chord/key-chord" "\
Locally define a key-chord of the two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

The binding goes in the current buffer's local map,
which in most cases is shared with all other buffers in the same major mode.

\(fn KEYS COMMAND)" t nil)

(autoload 'key-chord-define "key-chord/key-chord" "\
Define in KEYMAP, a key-chord of the two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

\(fn KEYMAP KEYS COMMAND)" nil nil)

;;;***

;;;### (autoloads nil "less-css-mode/less-css-mode" "less-css-mode/less-css-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from less-css-mode/less-css-mode.el

(autoload 'less-css-compile "less-css-mode/less-css-mode" "\
Compiles the current buffer to css using `less-css-lessc-command'.

\(fn)" t nil)

(autoload 'less-css-mode "less-css-mode/less-css-mode" "\
Major mode for editing LESS files, http://lesscss.org/
Special commands:
\\{less-css-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "less-css-mode/less-css-mode" '("less-css-")))

;;;***

;;;### (autoloads nil "linum-relative/linum-relative" "linum-relative/linum-relative.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from linum-relative/linum-relative.el

(autoload 'linum-relative-toggle "linum-relative/linum-relative" "\
Toggle between linum-relative and linum.

\(fn)" t nil)

(autoload 'linum-relative-mode "linum-relative/linum-relative" "\
Display relative line numbers for current buffer.

\(fn &optional ARG)" t nil)

(defvar linum-relative-global-mode nil "\
Non-nil if Linum-Relative-Global mode is enabled.
See the `linum-relative-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `linum-relative-global-mode'.")

(custom-autoload 'linum-relative-global-mode "linum-relative/linum-relative" nil)

(autoload 'linum-relative-global-mode "linum-relative/linum-relative" "\
Toggle Linum-Relative mode in all buffers.
With prefix ARG, enable Linum-Relative-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Linum-Relative mode is enabled in all buffers where
`(lambda nil (unless (linum-relative-in-helm-p) (linum-relative-mode 1)))' would do it.
See `linum-relative-mode' for more information on Linum-Relative mode.

\(fn &optional ARG)" t nil)

(autoload 'helm-linum-relative-mode "linum-relative/linum-relative" "\
Turn on `linum-relative-mode' in helm.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "logalimacs/logalimacs" "logalimacs/logalimacs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from logalimacs/logalimacs.el

(autoload 'loga-interactive-command "logalimacs/logalimacs" "\
interactive-command for logaling-command, types following mini-buffer.

\(fn)" t nil)

(autoload 'loga-add "logalimacs/logalimacs" "\
this is command to adding word, first source word, second target word.

\(fn)" t nil)

(autoload 'loga-update "logalimacs/logalimacs" "\
update to registered word

\(fn)" t nil)

(autoload 'loga-lookup-at-manually "logalimacs/logalimacs" "\
Search word from logaling.
If not mark region, search word type on manual.
Otherwise passed character inside region.

\(fn)" t nil)

(autoload 'loga-lookup-in-popup "logalimacs/logalimacs" "\
Display the output of loga-lookup at tooltip.

\(fn)" t nil)

(autoload 'loga-lookup-in-buffer "logalimacs/logalimacs" "\


\(fn)" t nil)

(autoload 'loga-lookup-in-buffer-light "logalimacs/logalimacs" "\
Use async shell commad for lookup and output *logalimacs* buffer

\(fn)" t nil)

(autoload 'loga-fly-mode "logalimacs/logalimacs" "\
Toggle loga-fly-mode-on and loga-fly-mode-off.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "lua-mode/lua-mode" "lua-mode/lua-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from lua-mode/lua-mode.el

(autoload 'lua-mode "lua-mode/lua-mode" "\
Major mode for editing Lua code.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(defalias 'run-lua #'lua-start-process)

(autoload 'lua-start-process "lua-mode/lua-mode" "\
Start a lua process named NAME, running PROGRAM.
PROGRAM defaults to NAME, which defaults to `lua-default-application'.
When called interactively, switch to the process buffer.

\(fn &optional NAME PROGRAM STARTFILE &rest SWITCHES)" t nil)

;;;***

;;;### (autoloads nil "magit/lisp/git-commit" "magit/lisp/git-commit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/git-commit.el

(defvar global-git-commit-mode t "\
Non-nil if Global Git-Commit mode is enabled.
See the `global-git-commit-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-git-commit-mode'.")

(custom-autoload 'global-git-commit-mode "magit/lisp/git-commit" nil)

(autoload 'global-git-commit-mode "magit/lisp/git-commit" "\
Edit Git commit messages.
This global mode arranges for `git-commit-setup' to be called
when a Git commit message file is opened.  That usually happens
when Git uses the Emacsclient as $GIT_EDITOR to have the user
provide such a commit message.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/git-commit" '("git-commit-")))

;;;***

;;;### (autoloads nil "magit/lisp/git-rebase" "magit/lisp/git-rebase.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/git-rebase.el

(autoload 'git-rebase-mode "magit/lisp/git-rebase" "\
Major mode for editing of a Git rebase file.

Rebase files are generated when you run 'git rebase -i' or run
`magit-interactive-rebase'.  They describe how Git should perform
the rebase.  See the documentation for git-rebase (e.g., by
running 'man git-rebase' at the command line) for details.

\(fn)" t nil)

(defconst git-rebase-filename-regexp "/git-rebase-todo\\'")

(add-to-list 'auto-mode-alist (cons git-rebase-filename-regexp 'git-rebase-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/git-rebase" '("git-rebase-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit" "magit/lisp/magit.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from magit/lisp/magit.el

(autoload 'magit-status "magit/lisp/magit" "\
Show the status of the current Git repository in a buffer.
With a prefix argument prompt for a repository to be shown.
With two prefix arguments prompt for an arbitrary directory.
If that directory isn't the root of an existing repository
then offer to initialize it as a new repository.

\(fn &optional DIRECTORY)" t nil)

(autoload 'magit-status-internal "magit/lisp/magit" "\


\(fn DIRECTORY)" nil nil)
 (autoload 'magit-show-refs-popup "magit" nil t)

(autoload 'magit-show-refs-head "magit/lisp/magit" "\
List and compare references in a dedicated buffer.
Refs are compared with `HEAD'.

\(fn &optional ARGS)" t nil)

(autoload 'magit-show-refs-current "magit/lisp/magit" "\
List and compare references in a dedicated buffer.
Refs are compared with the current branch or `HEAD' if
it is detached.

\(fn &optional ARGS)" t nil)

(autoload 'magit-show-refs "magit/lisp/magit" "\
List and compare references in a dedicated buffer.
Refs are compared with a branch read form the user.

\(fn &optional REF ARGS)" t nil)

(autoload 'magit-find-file "magit/lisp/magit" "\
View FILE from REV.
Switch to a buffer visiting blob REV:FILE,
creating one if none already exists.

\(fn REV FILE)" t nil)

(autoload 'magit-find-file-other-window "magit/lisp/magit" "\
View FILE from REV, in another window.
Like `magit-find-file', but create a new window or reuse an
existing one.

\(fn REV FILE)" t nil)

(autoload 'magit-dired-jump "magit/lisp/magit" "\
Visit file at point using Dired.
With a prefix argument, visit in other window.  If there
is no file at point then instead visit `default-directory'.

\(fn &optional OTHER-WINDOW)" t nil)

(autoload 'magit-checkout-file "magit/lisp/magit" "\
Checkout FILE from REV.

\(fn REV FILE)" t nil)

(autoload 'magit-init "magit/lisp/magit" "\
Initialize a Git repository, then show its status.

If the directory is below an existing repository, then the user
has to confirm that a new one should be created inside.  If the
directory is the root of the existing repository, then the user
has to confirm that it should be reinitialized.

Non-interactively DIRECTORY is (re-)initialized unconditionally.

\(fn DIRECTORY)" t nil)
 (autoload 'magit-branch-popup "magit" nil t)

(autoload 'magit-checkout "magit/lisp/magit" "\
Checkout REVISION, updating the index and the working tree.
If REVISION is a local branch then that becomes the current
branch.  If it is something else then `HEAD' becomes detached.
Checkout fails if the working tree or the staging area contain
changes.

\(git checkout REVISION).

\(fn REVISION)" t nil)

(autoload 'magit-branch "magit/lisp/magit" "\
Create BRANCH at branch or revision START-POINT.

\(git branch [ARGS] BRANCH START-POINT).

\(fn BRANCH START-POINT &optional ARGS)" t nil)

(autoload 'magit-branch-and-checkout "magit/lisp/magit" "\
Create and checkout BRANCH at branch or revision START-POINT.

\(git checkout [ARGS] -b BRANCH START-POINT).

\(fn BRANCH START-POINT &optional ARGS)" t nil)

(autoload 'magit-branch-orphan "magit/lisp/magit" "\
Create and checkout an orphan BRANCH with contents from revision START-POINT.

\(git checkout --orphan [ARGS] BRANCH START-POINT).

\(fn BRANCH START-POINT &optional ARGS)" t nil)

(autoload 'magit-branch-spinoff "magit/lisp/magit" "\
Create new branch from the unpushed commits.

Create and checkout a new branch starting at and tracking the
current branch.  That branch in turn is reset to the last commit
it shares with its upstream.  If the current branch has no
upstream or no unpushed commits, then the new branch is created
anyway and the previously current branch is not touched.

This is useful to create a feature branch after work has already
began on the old branch (likely but not necessarily \"master\").

If the current branch is a member of the value of option
`magit-branch-prefer-remote-upstream' (which see), then the
current branch will be used as the starting point as usual, but
the upstream of the starting-point may be used as the upstream
of the new branch, instead of the starting-point itself.

\(fn BRANCH &rest ARGS)" t nil)

(autoload 'magit-branch-reset "magit/lisp/magit" "\
Reset a branch to the tip of another branch or any other commit.

When the branch being reset is the current branch, then do a
hard reset.  If there are any uncommitted changes, then the user
has to confirming the reset because those changes would be lost.

This is useful when you have started work on a feature branch but
realize it's all crap and want to start over.

When resetting to another branch and a prefix argument is used,
then also set the target branch as the upstream of the branch
that is being reset.

\(fn BRANCH TO &optional ARGS SET-UPSTREAM)" t nil)

(autoload 'magit-branch-delete "magit/lisp/magit" "\
Delete one or multiple branches.
If the region marks multiple branches, then offer to delete
those, otherwise prompt for a single branch to be deleted,
defaulting to the branch at point.

\(fn BRANCHES &optional FORCE)" t nil)

(autoload 'magit-branch-rename "magit/lisp/magit" "\
Rename branch OLD to NEW.
With prefix, forces the rename even if NEW already exists.

\(git branch -m|-M OLD NEW).

\(fn OLD NEW &optional FORCE)" t nil)

(autoload 'magit-branch-config-popup "magit/lisp/magit" "\
Popup console for setting branch variables.

\(fn BRANCH)" t nil)

(autoload 'magit-edit-branch*description "magit/lisp/magit" "\
Edit the description of the current branch.
With a prefix argument edit the description of another branch.

The description for the branch named NAME is stored in the Git
variable `branch.<name>.description'.

\(fn BRANCH)" t nil)

(autoload 'magit-set-branch*merge/remote "magit/lisp/magit" "\
Set or unset the upstream of the current branch.
With a prefix argument do so for another branch.

When the branch in question already has an upstream then simply
unsets it.  Invoke this command again to set another upstream.

Together the Git variables `branch.<name>.remote' and
`branch.<name>.merge' define the upstream branch of the local
branch named NAME.  The value of `branch.<name>.remote' is the
name of the upstream remote.  The value of `branch.<name>.merge'
is the full reference of the upstream branch, on the remote.

Non-interactively, when UPSTREAM is non-nil, then always set it
as the new upstream, regardless of whether another upstream was
already set.  When nil, then always unset.

\(fn BRANCH UPSTREAM)" t nil)

(autoload 'magit-cycle-branch*rebase "magit/lisp/magit" "\
Cycle the value of `branch.<name>.rebase' for the current branch.
With a prefix argument cycle the value for another branch.

The Git variables `branch.<name>.rebase' controls whether pulling
into the branch named NAME is done by rebasing that branch onto
the fetched branch or by merging that branch.

When `true' then pulling is done by rebasing.
When `false' then pulling is done by merging.

When that variable is undefined then the value of `pull.rebase'
is used instead.  It defaults to `false'.

\(fn BRANCH)" t nil)

(autoload 'magit-cycle-branch*pushRemote "magit/lisp/magit" "\
Cycle the value of `branch.<name>.pushRemote' for the current branch.
With a prefix argument cycle the value for another branch.

The Git variable `branch.<name>.pushRemote' specifies the remote
that the branch named NAME is usually pushed to.  The value has
to be the name of an existing remote.

If that variable is undefined, then the value of the Git variable
`remote.pushDefault' is used instead, provided that it is defined,
which by default it is not.

\(fn BRANCH)" t nil)

(autoload 'magit-cycle-pull\.rebase "magit/lisp/magit" "\
Cycle the repository-local value of `pull.rebase'.

The Git variable `pull.rebase' specifies whether pulling is done
by rebasing or by merging.  It can be overwritten using the Git
variable `branch.<name>.rebase'.

When `true' then pulling is done by rebasing.
When `false' (the default) then pulling is done by merging.

\(fn)" t nil)

(autoload 'magit-cycle-remote\.pushDefault "magit/lisp/magit" "\
Cycle the repository-local value of `remote.pushDefault'.

The Git variable `remote.pushDefault' specifies the remote that
local branches are usually pushed to.  It can be overwritten
using the Git variable `branch.<name>.pushRemote'.

\(fn)" t nil)

(autoload 'magit-cycle-branch*autoSetupMerge "magit/lisp/magit" "\
Cycle the repository-local value of `branch.autoSetupMerge'.

The Git variable `branch.autoSetupMerge' under what circumstances
creating a branch (named NAME) should result in the variables
`branch.<name>.merge' and `branch.<name>.remote' being set
according to the starting point used to create the branch.  If
the starting point isn't a branch, then these variables are never
set.

When `always' then the variables are set regardless of whether
the starting point is a local or a remote branch.

When `true' (the default) then the variable are set when the
starting point is a remote branch, but not when it is a local
branch.

When `false' then the variables are never set.

\(fn)" t nil)

(autoload 'magit-cycle-branch*autoSetupRebase "magit/lisp/magit" "\
Cycle the repository-local value of `branch.autoSetupRebase'.

The Git variable `branch.autoSetupRebase' specifies whether
creating a branch (named NAME) should result in the variable
`branch.<name>.rebase' being set to `true'.

When `always' then the variable is set regardless of whether the
starting point is a local or a remote branch.

When `local' then the variable are set when the starting point
is a local branch, but not when it is a remote branch.

When `remote' then the variable are set when the starting point
is a remote branch, but not when it is a local branch.

When `never' (the default) then the variable is never set.

\(fn)" t nil)
 (autoload 'magit-merge-popup "magit" nil t)

(autoload 'magit-merge "magit/lisp/magit" "\
Merge commit REV into the current branch; using default message.

Unless there are conflicts or a prefix argument is used create a
merge commit using a generic commit message and without letting
the user inspect the result.  With a prefix argument pretend the
merge failed to give the user the opportunity to inspect the
merge.

\(git merge --no-edit|--no-commit [ARGS] REV)

\(fn REV &optional ARGS NOCOMMIT)" t nil)

(autoload 'magit-merge-editmsg "magit/lisp/magit" "\
Merge commit REV into the current branch; and edit message.
Perform the merge and prepare a commit message but let the user
edit it.

\(git merge --edit --no-ff [ARGS] rev)

\(fn REV &optional ARGS)" t nil)

(autoload 'magit-merge-nocommit "magit/lisp/magit" "\
Merge commit REV into the current branch; pretending it failed.
Pretend the merge failed to give the user the opportunity to
inspect the merge and change the commit message.

\(git merge --no-commit --no-ff [ARGS] rev)

\(fn REV &optional ARGS)" t nil)

(autoload 'magit-merge-preview "magit/lisp/magit" "\
Preview result of merging REV into the current branch.

\(fn REV)" t nil)

(autoload 'magit-merge-abort "magit/lisp/magit" "\
Abort the current merge operation.

\(git merge --abort)

\(fn)" t nil)
 (autoload 'magit-reset-popup "magit" nil t)

(autoload 'magit-reset-index "magit/lisp/magit" "\
Reset the index to COMMIT.
Keep the head and working tree as-is, so if COMMIT refers to the
head this effectively unstages all changes.

\(git reset COMMIT .)

\(fn COMMIT)" t nil)

(autoload 'magit-reset "magit/lisp/magit" "\
Reset the head and index to COMMIT, but not the working tree.
With a prefix argument also reset the working tree.

\(git reset --mixed|--hard COMMIT)

\(fn COMMIT &optional HARD)" t nil)

(autoload 'magit-reset-head "magit/lisp/magit" "\
Reset the head and index to COMMIT, but not the working tree.

\(git reset --mixed COMMIT)

\(fn COMMIT)" t nil)

(autoload 'magit-reset-soft "magit/lisp/magit" "\
Reset the head to COMMIT, but not the index and working tree.

\(git reset --soft REVISION)

\(fn COMMIT)" t nil)

(autoload 'magit-reset-hard "magit/lisp/magit" "\
Reset the head, index, and working tree to COMMIT.

\(git reset --hard REVISION)

\(fn COMMIT)" t nil)

(autoload 'magit-worktree-checkout "magit/lisp/magit" "\


\(fn PATH BRANCH)" t nil)

(autoload 'magit-worktree-branch "magit/lisp/magit" "\
Create a new BRANCH and check it out in a new worktree at PATH.

\(fn PATH BRANCH START-POINT &optional FORCE)" t nil)
 (autoload 'magit-tag-popup "magit" nil t)

(autoload 'magit-tag "magit/lisp/magit" "\
Create a new tag with the given NAME at REV.
With a prefix argument annotate the tag.

\(git tag [--annotate] NAME REV)

\(fn NAME REV &optional ARGS)" t nil)

(autoload 'magit-tag-delete "magit/lisp/magit" "\
Delete one or more tags.
If the region marks multiple tags (and nothing else), then offer
to delete those, otherwise prompt for a single tag to be deleted,
defaulting to the tag at point.

\(git tag -d TAGS)

\(fn TAGS)" t nil)
 (autoload 'magit-notes-popup "magit" nil t)
 (autoload 'magit-file-popup "magit" nil t)

(defvar global-magit-file-mode nil "\
Non-nil if Global Magit-File mode is enabled.
See the `global-magit-file-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-magit-file-mode'.")

(custom-autoload 'global-magit-file-mode "magit/lisp/magit" nil)

(autoload 'global-magit-file-mode "magit/lisp/magit" "\
Toggle Magit-File mode in all buffers.
With prefix ARG, enable Global Magit-File mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Magit-File mode is enabled in all buffers where
`magit-file-mode-turn-on' would do it.
See `magit-file-mode' for more information on Magit-File mode.

\(fn &optional ARG)" t nil)
 (autoload 'magit-dispatch-popup "magit" nil t)
 (autoload 'magit-run-popup "magit" nil t)

(autoload 'magit-git-command "magit/lisp/magit" "\
Execute a Git subcommand asynchronously, displaying the output.
With a prefix argument run Git in the root of the current
repository, otherwise in `default-directory'.

\(fn ARGS DIRECTORY)" t nil)

(autoload 'magit-git-command-topdir "magit/lisp/magit" "\
Execute a Git subcommand asynchronously, displaying the output.
Run Git in the top-level directory of the current repository.

\(fn)" t nil)

(autoload 'magit-shell-command "magit/lisp/magit" "\
Execute a shell command asynchronously, displaying the output.
With a prefix argument run the command in the root of the current
repository, otherwise in `default-directory'.

\(fn ARGS DIRECTORY)" t nil)

(autoload 'magit-shell-command-topdir "magit/lisp/magit" "\
Execute a shell command asynchronously, displaying the output.
Run the command in the top-level directory of the current repository.

\(fn)" t nil)

(autoload 'magit-list-repositories "magit/lisp/magit" "\
Display a list of repositories.

Use the options `magit-repository-directories'
and `magit-repository-directories-depth' to
control which repositories are displayed.

\(fn)" t nil)

(autoload 'magit-version "magit/lisp/magit" "\
Return the version of Magit currently in use.
When called interactive also show the used versions of Magit,
Git, and Emacs in the echo area.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit" '("magit-" "ido-enter-magit-status")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-apply" "magit/lisp/magit-apply.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-apply.el

(autoload 'magit-stage-file "magit/lisp/magit-apply" "\
Stage all changes to FILE.
With a prefix argument or when there is no file at point ask for
the file to be staged.  Otherwise stage the file at point without
requiring confirmation.

\(fn FILE)" t nil)

(autoload 'magit-stage-modified "magit/lisp/magit-apply" "\
Stage all changes to files modified in the worktree.
Stage all new content of tracked files and remove tracked files
that no longer exist in the working tree from the index also.
With a prefix argument also stage previously untracked (but not
ignored) files.
\('git add --update|--all .').

\(fn &optional ALL)" t nil)

(autoload 'magit-unstage-file "magit/lisp/magit-apply" "\
Unstage all changes to FILE.
With a prefix argument or when there is no file at point ask for
the file to be unstaged.  Otherwise unstage the file at point
without requiring confirmation.

\(fn FILE)" t nil)

(autoload 'magit-unstage-all "magit/lisp/magit-apply" "\
Remove all changes from the staging area.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-apply" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-autorevert" "magit/lisp/magit-autorevert.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-autorevert.el

(defvar magit-revert-buffers t)

(defvar magit-auto-revert-mode (and magit-revert-buffers (not global-auto-revert-mode) (not noninteractive)) "\
Non-nil if Magit-Auto-Revert mode is enabled.
See the `magit-auto-revert-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `magit-auto-revert-mode'.")

(custom-autoload 'magit-auto-revert-mode "magit/lisp/magit-autorevert" nil)

(autoload 'magit-auto-revert-mode "magit/lisp/magit-autorevert" "\
Toggle Auto-Revert mode in all buffers.
With prefix ARG, enable Magit-Auto-Revert mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Revert mode is enabled in all buffers where
`magit-turn-on-auto-revert-mode-if-desired' would do it.
See `auto-revert-mode' for more information on Auto-Revert mode.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-autorevert" '("auto-revert-buffer" "magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-bisect" "magit/lisp/magit-bisect.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-bisect.el
 (autoload 'magit-bisect-popup "magit-bisect" nil t)

(autoload 'magit-bisect-start "magit/lisp/magit-bisect" "\
Start a bisect session.

Bisecting a bug means to find the commit that introduced it.
This command starts such a bisect session by asking for a know
good and a bad commit.  To move the session forward use the
other actions from the bisect popup (\\<magit-status-mode-map>\\[magit-bisect-popup]).

\(fn BAD GOOD)" t nil)

(autoload 'magit-bisect-reset "magit/lisp/magit-bisect" "\
After bisecting, cleanup bisection state and return to original `HEAD'.

\(fn)" t nil)

(autoload 'magit-bisect-good "magit/lisp/magit-bisect" "\
While bisecting, mark the current commit as good.
Use this after you have asserted that the commit does not contain
the bug in question.

\(fn)" t nil)

(autoload 'magit-bisect-bad "magit/lisp/magit-bisect" "\
While bisecting, mark the current commit as bad.
Use this after you have asserted that the commit does contain the
bug in question.

\(fn)" t nil)

(autoload 'magit-bisect-skip "magit/lisp/magit-bisect" "\
While bisecting, skip the current commit.
Use this if for some reason the current commit is not a good one
to test.  This command lets Git choose a different one.

\(fn)" t nil)

(autoload 'magit-bisect-run "magit/lisp/magit-bisect" "\
Bisect automatically by running commands after each step.

Unlike `git bisect run' this can be used before bisecting has
begun.  In that case it behaves like `git bisect start; git
bisect run'.

\(fn CMDLINE &optional BAD GOOD)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-bisect" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-blame" "magit/lisp/magit-blame.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-blame.el
 (autoload 'magit-blame-popup "magit-blame" nil t)

(autoload 'magit-blame "magit/lisp/magit-blame" "\
Display edit history of FILE up to REVISION.

Interactively blame the file being visited in the current buffer.
If the buffer visits a revision of that file, then blame up to
that revision, otherwise blame the file's full history, including
uncommitted changes.

If Magit-Blame mode is already turned on then blame recursively, by
visiting REVISION:FILE (using `magit-find-file'), where revision
is the revision before the revision that added the lines at
point.

ARGS is a list of additional arguments to pass to `git blame';
only arguments available from `magit-blame-popup' should be used.

\(fn REVISION FILE &optional ARGS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-blame" '("magit-blame-" "auto-revert-handler--unless-magit-blame-mode")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-commit" "magit/lisp/magit-commit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-commit.el

(autoload 'magit-commit "magit/lisp/magit-commit" "\
Create a new commit on HEAD.
With a prefix argument amend to the commit at HEAD instead.

\(git commit [--amend] ARGS)

\(fn &optional ARGS)" t nil)

(autoload 'magit-commit-amend "magit/lisp/magit-commit" "\
Amend the last commit.

\(git commit --amend ARGS)

\(fn &optional ARGS)" t nil)

(autoload 'magit-commit-extend "magit/lisp/magit-commit" "\
Amend the last commit, without editing the message.

With a prefix argument keep the committer date, otherwise change
it.  The option `magit-commit-extend-override-date' can be used
to inverse the meaning of the prefix argument.
\(git commit
--amend --no-edit)

\(fn &optional ARGS OVERRIDE-DATE)" t nil)

(autoload 'magit-commit-reword "magit/lisp/magit-commit" "\
Reword the last commit, ignoring staged changes.

With a prefix argument keep the committer date, otherwise change
it.  The option `magit-commit-reword-override-date' can be used
to inverse the meaning of the prefix argument.

Non-interactively respect the optional OVERRIDE-DATE argument
and ignore the option.

\(git commit --amend --only)

\(fn &optional ARGS OVERRIDE-DATE)" t nil)

(autoload 'magit-commit-fixup "magit/lisp/magit-commit" "\
Create a fixup commit.

With a prefix argument the target COMMIT has to be confirmed.
Otherwise the commit at point may be used without confirmation
depending on the value of option `magit-commit-squash-confirm'.

\(fn &optional COMMIT ARGS)" t nil)

(autoload 'magit-commit-squash "magit/lisp/magit-commit" "\
Create a squash commit, without editing the squash message.

With a prefix argument the target COMMIT has to be confirmed.
Otherwise the commit at point may be used without confirmation
depending on the value of option `magit-commit-squash-confirm'.

\(fn &optional COMMIT ARGS)" t nil)

(autoload 'magit-commit-augment "magit/lisp/magit-commit" "\
Create a squash commit, editing the squash message.

With a prefix argument the target COMMIT has to be confirmed.
Otherwise the commit at point may be used without confirmation
depending on the value of option `magit-commit-squash-confirm'.

\(fn &optional COMMIT ARGS)" t nil)

(autoload 'magit-commit-instant-fixup "magit/lisp/magit-commit" "\
Create a fixup commit targeting COMMIT and instantly rebase.

\(fn &optional COMMIT ARGS)" t nil)

(autoload 'magit-commit-instant-squash "magit/lisp/magit-commit" "\
Create a squash commit targeting COMMIT and instantly rebase.

\(fn &optional COMMIT ARGS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-commit" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-diff" "magit/lisp/magit-diff.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-diff.el

(autoload 'magit-diff-popup "magit/lisp/magit-diff" "\
Popup console for diff commands.

\(fn ARG)" t nil)

(autoload 'magit-diff-buffer-file-popup "magit/lisp/magit-diff" "\
Popup console for diff commands.

This is a variant of `magit-diff-popup' which shows the same popup
but which limits the diff to the file being visited in the current
buffer.

\(fn)" t nil)

(autoload 'magit-diff-dwim "magit/lisp/magit-diff" "\
Show changes for the thing at point.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-diff "magit/lisp/magit-diff" "\
Show differences between two commits.

REV-OR-RANGE should be a range or a single revision.  If it is a
revision, then show changes in the working tree relative to that
revision.  If it is a range, but one side is omitted, then show
changes relative to `HEAD'.

If the region is active, use the revisions on the first and last
line of the region as the two sides of the range.  With a prefix
argument, instead of diffing the revisions, choose a revision to
view changes along, starting at the common ancestor of both
revisions (i.e., use a \"...\" range).

\(fn REV-OR-RANGE &optional ARGS FILES)" t nil)

(autoload 'magit-diff-working-tree "magit/lisp/magit-diff" "\
Show changes between the current working tree and the `HEAD' commit.
With a prefix argument show changes between the working tree and
a commit read from the minibuffer.

\(fn &optional REV ARGS FILES)" t nil)

(autoload 'magit-diff-staged "magit/lisp/magit-diff" "\
Show changes between the index and the `HEAD' commit.
With a prefix argument show changes between the index and
a commit read from the minibuffer.

\(fn &optional REV ARGS FILES)" t nil)

(autoload 'magit-diff-unstaged "magit/lisp/magit-diff" "\
Show changes between the working tree and the index.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-diff-while-committing "magit/lisp/magit-diff" "\
While committing, show the changes that are about to be committed.
While amending, invoking the command again toggles between
showing just the new changes or all the changes that will
be committed.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-diff-buffer-file "magit/lisp/magit-diff" "\
Show diff for the blob or file visited in the current buffer.

\(fn)" t nil)

(autoload 'magit-diff-paths "magit/lisp/magit-diff" "\
Show changes between any two files on disk.

\(fn A B)" t nil)

(autoload 'magit-show-commit "magit/lisp/magit-diff" "\
Show the revision at point.
If there is no revision at point or with a prefix argument prompt
for a revision.

\(fn REV &optional ARGS FILES MODULE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-diff" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-ediff" "magit/lisp/magit-ediff.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-ediff.el
 (autoload 'magit-ediff-popup "magit-ediff" nil t)

(autoload 'magit-ediff-resolve "magit/lisp/magit-ediff" "\
Resolve outstanding conflicts in FILE using Ediff.
FILE has to be relative to the top directory of the repository.

In the rare event that you want to manually resolve all
conflicts, including those already resolved by Git, use
`ediff-merge-revisions-with-ancestor'.

\(fn FILE)" t nil)

(autoload 'magit-ediff-stage "magit/lisp/magit-ediff" "\
Stage and unstage changes to FILE using Ediff.
FILE has to be relative to the top directory of the repository.

\(fn FILE)" t nil)

(autoload 'magit-ediff-compare "magit/lisp/magit-ediff" "\
Compare REVA:FILEA with REVB:FILEB using Ediff.

FILEA and FILEB have to be relative to the top directory of the
repository.  If REVA or REVB is nil then this stands for the
working tree state.

If the region is active, use the revisions on the first and last
line of the region.  With a prefix argument, instead of diffing
the revisions, choose a revision to view changes along, starting
at the common ancestor of both revisions (i.e., use a \"...\"
range).

\(fn REVA REVB FILEA FILEB)" t nil)

(autoload 'magit-ediff-dwim "magit/lisp/magit-ediff" "\
Compare, stage, or resolve using Ediff.
This command tries to guess what file, and what commit or range
the user wants to compare, stage, or resolve using Ediff.  It
might only be able to guess either the file, or range or commit,
in which case the user is asked about the other.  It might not
always guess right, in which case the appropriate `magit-ediff-*'
command has to be used explicitly.  If it cannot read the user's
mind at all, then it asks the user for a command to run.

\(fn)" t nil)

(autoload 'magit-ediff-show-staged "magit/lisp/magit-ediff" "\
Show staged changes using Ediff.

This only allows looking at the changes; to stage, unstage,
and discard changes using Ediff, use `magit-ediff-stage'.

FILE must be relative to the top directory of the repository.

\(fn FILE)" t nil)

(autoload 'magit-ediff-show-unstaged "magit/lisp/magit-ediff" "\
Show unstaged changes using Ediff.

This only allows looking at the changes; to stage, unstage,
and discard changes using Ediff, use `magit-ediff-stage'.

FILE must be relative to the top directory of the repository.

\(fn FILE)" t nil)

(autoload 'magit-ediff-show-working-tree "magit/lisp/magit-ediff" "\
Show changes between HEAD and working tree using Ediff.
FILE must be relative to the top directory of the repository.

\(fn FILE)" t nil)

(autoload 'magit-ediff-show-commit "magit/lisp/magit-ediff" "\
Show changes introduced by COMMIT using Ediff.

\(fn COMMIT)" t nil)

(autoload 'magit-ediff-show-stash "magit/lisp/magit-ediff" "\
Show changes introduced by STASH using Ediff.
`magit-ediff-show-stash-with-index' controls whether a
three-buffer Ediff is used in order to distinguish changes in the
stash that were staged.

\(fn STASH)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-ediff" '("magit-ediff-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-extras" "magit/lisp/magit-extras.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-extras.el

(autoload 'magit-run-git-gui "magit/lisp/magit-extras" "\
Run `git gui' for the current git repository.

\(fn)" t nil)

(autoload 'magit-run-git-gui-blame "magit/lisp/magit-extras" "\
Run `git gui blame' on the given FILENAME and COMMIT.
Interactively run it for the current file and the HEAD, with a
prefix or when the current file cannot be determined let the user
choose.  When the current buffer is visiting FILENAME instruct
blame to center around the line point is on.

\(fn COMMIT FILENAME &optional LINENUM)" t nil)

(autoload 'magit-run-gitk "magit/lisp/magit-extras" "\
Run `gitk' in the current repository.

\(fn)" t nil)

(autoload 'magit-run-gitk-branches "magit/lisp/magit-extras" "\
Run `gitk --branches' in the current repository.

\(fn)" t nil)

(autoload 'magit-run-gitk-all "magit/lisp/magit-extras" "\
Run `gitk --all' in the current repository.

\(fn)" t nil)

(autoload 'magit-clean "magit/lisp/magit-extras" "\
Remove untracked files from the working tree.
With a prefix argument also remove ignored files,
with two prefix arguments remove ignored files only.

\(git clean -f -d [-x|-X])

\(fn &optional ARG)" t nil)

(autoload 'magit-gitignore "magit/lisp/magit-extras" "\
Instruct Git to ignore FILE-OR-PATTERN.
With a prefix argument only ignore locally.

\(fn FILE-OR-PATTERN &optional LOCAL)" t nil)

(autoload 'magit-gitignore-locally "magit/lisp/magit-extras" "\
Instruct Git to locally ignore FILE-OR-PATTERN.

\(fn FILE-OR-PATTERN)" t nil)

(autoload 'magit-add-change-log-entry "magit/lisp/magit-extras" "\
Find change log file and add date entry and item for current change.
This differs from `add-change-log-entry' (which see) in that
it acts on the current hunk in a Magit buffer instead of on
a position in a file-visiting buffer.

\(fn &optional WHOAMI FILE-NAME OTHER-WINDOW)" t nil)

(autoload 'magit-add-change-log-entry-other-window "magit/lisp/magit-extras" "\
Find change log file in other window and add entry and item.
This differs from `add-change-log-entry-other-window' (which see)
in that it acts on the current hunk in a Magit buffer instead of
on a position in a file-visiting buffer.

\(fn &optional WHOAMI FILE-NAME)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-extras" '("magit-git")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-git" "magit/lisp/magit-git.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-git.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-git" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-log" "magit/lisp/magit-log.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-log.el

(autoload 'magit-log-buffer-file-popup "magit/lisp/magit-log" "\
Popup console for log commands.

This is a variant of `magit-log-popup' which shows the same popup
but which limits the log to the file being visited in the current
buffer.

\(fn)" t nil)

(autoload 'magit-log-current "magit/lisp/magit-log" "\
Show log for the current branch.
When `HEAD' is detached or with a prefix argument show log for
one or more revs read from the minibuffer.

\(fn REVS &optional ARGS FILES)" t nil)

(autoload 'magit-log "magit/lisp/magit-log" "\
Show log for one or more revs read from the minibuffer.
The user can input any revision or revisions separated by a
space, or even ranges, but only branches and tags, and a
representation of the commit at point, are available as
completion candidates.

\(fn REVS &optional ARGS FILES)" t nil)

(autoload 'magit-log-head "magit/lisp/magit-log" "\
Show log for `HEAD'.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-log-branches "magit/lisp/magit-log" "\
Show log for all local branches and `HEAD'.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-log-all-branches "magit/lisp/magit-log" "\
Show log for all local and remote branches and `HEAD'.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-log-all "magit/lisp/magit-log" "\
Show log for all references and `HEAD'.

\(fn &optional ARGS FILES)" t nil)

(autoload 'magit-log-buffer-file "magit/lisp/magit-log" "\
Show log for the blob or file visited in the current buffer.
With a prefix argument or when `--follow' is part of
`magit-log-arguments', then follow renames.

\(fn &optional FOLLOW BEG END)" t nil)

(autoload 'magit-reflog-current "magit/lisp/magit-log" "\
Display the reflog of the current branch.

\(fn)" t nil)

(autoload 'magit-reflog "magit/lisp/magit-log" "\
Display the reflog of a branch.

\(fn REF)" t nil)

(autoload 'magit-reflog-head "magit/lisp/magit-log" "\
Display the `HEAD' reflog.

\(fn)" t nil)

(autoload 'magit-cherry "magit/lisp/magit-log" "\
Show commits in a branch that are not merged in the upstream branch.

\(fn HEAD UPSTREAM)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-log" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-mode" "magit/lisp/magit-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-mode" '("magit-" "disable-magit-save-buffers" "inhibit-magit-refresh")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-popup" "magit/lisp/magit-popup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-popup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-popup" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-process" "magit/lisp/magit-process.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-process.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-process" '("magit-" "tramp-sh-handle-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-remote" "magit/lisp/magit-remote.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-remote.el

(autoload 'magit-clone "magit/lisp/magit-remote" "\
Clone the REPOSITORY to DIRECTORY.
Then show the status buffer for the new repository.

\(fn REPOSITORY DIRECTORY)" t nil)
 (autoload 'magit-remote-popup "magit-remote" nil t)

(autoload 'magit-remote-add "magit/lisp/magit-remote" "\
Add a remote named REMOTE and fetch it.

\(fn REMOTE URL)" t nil)

(autoload 'magit-remote-rename "magit/lisp/magit-remote" "\
Rename the remote named OLD to NEW.

\(fn OLD NEW)" t nil)

(autoload 'magit-remote-set-url "magit/lisp/magit-remote" "\
Change the url of the remote named REMOTE to URL.

\(fn REMOTE URL)" t nil)

(autoload 'magit-remote-remove "magit/lisp/magit-remote" "\
Delete the remote named REMOTE.

\(fn REMOTE)" t nil)

(autoload 'magit-remote-set-head "magit/lisp/magit-remote" "\
Set the local representation of REMOTE's default branch.
Query REMOTE and set the symbolic-ref refs/remotes/<remote>/HEAD
accordingly.  With a prefix argument query for the branch to be
used, which allows you to select an incorrect value if you fancy
doing that.

\(fn REMOTE &optional BRANCH)" t nil)

(autoload 'magit-remote-unset-head "magit/lisp/magit-remote" "\
Unset the local representation of REMOTE's default branch.
Delete the symbolic-ref \"refs/remotes/<remote>/HEAD\".

\(fn REMOTE)" t nil)
 (autoload 'magit-fetch-popup "magit-remote" nil t)

(autoload 'magit-fetch-from-pushremote "magit/lisp/magit-remote" "\
Fetch from the push-remote of the current branch.

\(fn ARGS)" t nil)

(autoload 'magit-fetch-from-upstream "magit/lisp/magit-remote" "\
Fetch from the upstream repository of the current branch.

\(fn ARGS)" t nil)

(autoload 'magit-fetch "magit/lisp/magit-remote" "\
Fetch from another repository.

\(fn REMOTE ARGS)" t nil)

(autoload 'magit-fetch-branch "magit/lisp/magit-remote" "\
Fetch a BRANCH from a REMOTE.

\(fn REMOTE BRANCH ARGS)" t nil)

(autoload 'magit-fetch-refspec "magit/lisp/magit-remote" "\
Fetch a REFSPEC from a REMOTE.

\(fn REMOTE REFSPEC ARGS)" t nil)

(autoload 'magit-fetch-all "magit/lisp/magit-remote" "\
Fetch from all remotes.

\(fn ARGS)" t nil)

(autoload 'magit-fetch-all-prune "magit/lisp/magit-remote" "\
Fetch from all remotes, and prune.
Prune remote tracking branches for branches that have been
removed on the respective remote.

\(fn)" t nil)

(autoload 'magit-fetch-all-no-prune "magit/lisp/magit-remote" "\
Fetch from all remotes.

\(fn)" t nil)
 (autoload 'magit-pull-popup "magit-remote" nil t)
 (autoload 'magit-pull-and-fetch-popup "magit-remote" nil t)

(autoload 'magit-pull-from-pushremote "magit/lisp/magit-remote" "\
Pull from the push-remote of the current branch.

\(fn ARGS)" t nil)

(autoload 'magit-pull-from-upstream "magit/lisp/magit-remote" "\
Pull from the upstream of the current branch.

\(fn ARGS)" t nil)

(autoload 'magit-pull "magit/lisp/magit-remote" "\
Pull from a branch read in the minibuffer.

\(fn SOURCE ARGS)" t nil)
 (autoload 'magit-push-popup "magit-remote" nil t)

(autoload 'magit-push-current-to-pushremote "magit/lisp/magit-remote" "\
Push the current branch to `branch.<name>.pushRemote'.
If that variable is unset, then push to `remote.pushDefault'.

When `magit-push-current-set-remote-if-missing' is non-nil and
the push-remote is not configured, then read the push-remote from
the user, set it, and then push to it.  With a prefix argument
the push-remote can be changed before pushed to it.

\(fn ARGS &optional PUSH-REMOTE)" t nil)

(autoload 'magit-push-current-to-upstream "magit/lisp/magit-remote" "\
Push the current branch to its upstream branch.

When `magit-push-current-set-remote-if-missing' is non-nil and
the upstream is not configured, then read the upstream from the
user, set it, and then push to it.  With a prefix argument the
upstream can be changed before pushed to it.

\(fn ARGS &optional UPSTREAM)" t nil)

(autoload 'magit-push-current "magit/lisp/magit-remote" "\
Push the current branch to a branch read in the minibuffer.

\(fn TARGET ARGS)" t nil)

(autoload 'magit-push "magit/lisp/magit-remote" "\
Push an arbitrary branch or commit somewhere.
Both the source and the target are read in the minibuffer.

\(fn SOURCE TARGET ARGS)" t nil)

(autoload 'magit-push-refspecs "magit/lisp/magit-remote" "\
Push one or multiple REFSPECS to a REMOTE.
Both the REMOTE and the REFSPECS are read in the minibuffer.  To
use multiple REFSPECS, separate them with commas.  Completion is
only available for the part before the colon, or when no colon
is used.

\(fn REMOTE REFSPECS ARGS)" t nil)

(autoload 'magit-push-matching "magit/lisp/magit-remote" "\
Push all matching branches to another repository.
If multiple remotes exist, then read one from the user.
If just one exists, use that without requiring confirmation.

\(fn REMOTE &optional ARGS)" t nil)

(autoload 'magit-push-tags "magit/lisp/magit-remote" "\
Push all tags to another repository.
If only one remote exists, then push to that.  Otherwise prompt
for a remote, offering the remote configured for the current
branch as default.

\(fn REMOTE &optional ARGS)" t nil)

(autoload 'magit-push-tag "magit/lisp/magit-remote" "\
Push a tag to another repository.

\(fn TAG REMOTE &optional ARGS)" t nil)

(autoload 'magit-push-implicitly "magit/lisp/magit-remote" "\
Push somewhere without using an explicit refspec.

This command simply runs \"git push -v [ARGS]\".  ARGS are the
arguments specified in the popup buffer.  No explicit refspec
arguments are used.  Instead the behavior depends on at least
these Git variables: `push.default', `remote.pushDefault',
`branch.<branch>.pushRemote', `branch.<branch>.remote',
`branch.<branch>.merge', and `remote.<remote>.push'.

To add this command to the push popup add this to your init file:

  (with-eval-after-load \\='magit-remote
    (magit-define-popup-action \\='magit-push-popup ?P
      'magit-push-implicitly--desc
      'magit-push-implicitly ?p t))

The function `magit-push-implicitly--desc' attempts to predict
what this command will do, the value it returns is displayed in
the popup buffer.

\(fn ARGS)" t nil)

(autoload 'magit-push-to-remote "magit/lisp/magit-remote" "\
Push to REMOTE without using an explicit refspec.
The REMOTE is read in the minibuffer.

This command simply runs \"git push -v [ARGS] REMOTE\".  ARGS
are the arguments specified in the popup buffer.  No refspec
arguments are used.  Instead the behavior depends on at least
these Git variables: `push.default', `remote.pushDefault',
`branch.<branch>.pushRemote', `branch.<branch>.remote',
`branch.<branch>.merge', and `remote.<remote>.push'.

To add this command to the push popup add this to your init file:

  (with-eval-after-load \\='magit-remote
    (magit-define-popup-action \\='magit-push-popup ?r
      'magit-push-to-remote--desc
      'magit-push-to-remote ?p t))

\(fn REMOTE ARGS)" t nil)
 (autoload 'magit-patch-popup "magit-remote" nil t)

(autoload 'magit-format-patch "magit/lisp/magit-remote" "\
Create patches for the commits in RANGE.
When a single commit is given for RANGE, create a patch for the
changes introduced by that commit (unlike 'git format-patch'
which creates patches for all commits that are reachable from
HEAD but not from the specified commit).

\(fn RANGE ARGS)" t nil)

(autoload 'magit-request-pull "magit/lisp/magit-remote" "\
Request upstream to pull from you public repository.

URL is the url of your publically accessible repository.
START is a commit that already is in the upstream repository.
END is the last commit, usually a branch name, which upstream
is asked to pull.  START has to be reachable from that commit.

\(fn URL START END)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-remote" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-section" "magit/lisp/magit-section.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-section.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-section" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-sequence" "magit/lisp/magit-sequence.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-sequence.el

(autoload 'magit-sequencer-continue "magit/lisp/magit-sequence" "\
Resume the current cherry-pick or revert sequence.

\(fn)" t nil)

(autoload 'magit-sequencer-skip "magit/lisp/magit-sequence" "\
Skip the stopped at commit during a cherry-pick or revert sequence.

\(fn)" t nil)

(autoload 'magit-sequencer-abort "magit/lisp/magit-sequence" "\
Abort the current cherry-pick or revert sequence.
This discards all changes made since the sequence started.

\(fn)" t nil)
 (autoload 'magit-cherry-pick-popup "magit-sequence" nil t)

(autoload 'magit-cherry-pick "magit/lisp/magit-sequence" "\
Cherry-pick COMMIT.
Prompt for a commit, defaulting to the commit at point.  If
the region selects multiple commits, then pick all of them,
without prompting.

\(fn COMMIT &optional ARGS)" t nil)

(autoload 'magit-cherry-apply "magit/lisp/magit-sequence" "\
Apply the changes in COMMIT but do not commit them.
Prompt for a commit, defaulting to the commit at point.  If
the region selects multiple commits, then apply all of them,
without prompting.

\(fn COMMIT &optional ARGS)" t nil)
 (autoload 'magit-revert-popup "magit-sequence" nil t)

(autoload 'magit-revert "magit/lisp/magit-sequence" "\
Revert COMMIT by creating a new commit.
Prompt for a commit, defaulting to the commit at point.  If
the region selects multiple commits, then revert all of them,
without prompting.

\(fn COMMIT &optional ARGS)" t nil)

(autoload 'magit-revert-no-commit "magit/lisp/magit-sequence" "\
Revert COMMIT by applying it in reverse to the worktree.
Prompt for a commit, defaulting to the commit at point.  If
the region selects multiple commits, then revert all of them,
without prompting.

\(fn COMMIT &optional ARGS)" t nil)
 (autoload 'magit-am-popup "magit-sequence" nil t)

(autoload 'magit-am-apply-patches "magit/lisp/magit-sequence" "\
Apply the patches FILES.

\(fn &optional FILES ARGS)" t nil)

(autoload 'magit-am-apply-maildir "magit/lisp/magit-sequence" "\
Apply the patches from MAILDIR.

\(fn &optional MAILDIR ARGS)" t nil)

(autoload 'magit-am-continue "magit/lisp/magit-sequence" "\
Resume the current patch applying sequence.

\(fn)" t nil)

(autoload 'magit-am-skip "magit/lisp/magit-sequence" "\
Skip the stopped at patch during a patch applying sequence.

\(fn)" t nil)

(autoload 'magit-am-abort "magit/lisp/magit-sequence" "\
Abort the current patch applying sequence.
This discards all changes made since the sequence started.

\(fn)" t nil)
 (autoload 'magit-rebase-popup "magit-sequence" nil t)

(autoload 'magit-rebase-onto-pushremote "magit/lisp/magit-sequence" "\
Rebase the current branch onto `branch.<name>.pushRemote'.
If that variable is unset, then rebase onto `remote.pushDefault'.

\(fn ARGS)" t nil)

(autoload 'magit-rebase-onto-upstream "magit/lisp/magit-sequence" "\
Rebase the current branch onto its upstream branch.

\(fn ARGS)" t nil)

(autoload 'magit-rebase "magit/lisp/magit-sequence" "\
Rebase the current branch onto a branch read in the minibuffer.
All commits that are reachable from head but not from the
selected branch TARGET are being rebased.

\(fn TARGET ARGS)" t nil)

(autoload 'magit-rebase-subset "magit/lisp/magit-sequence" "\
Rebase a subset of the current branches history onto a new base.
Rebase commits from START to `HEAD' onto NEWBASE.
START has to be selected from a list of recent commits.

\(fn NEWBASE START ARGS)" t nil)

(autoload 'magit-rebase-interactive "magit/lisp/magit-sequence" "\
Start an interactive rebase sequence.

\(fn COMMIT ARGS)" t nil)

(autoload 'magit-rebase-autosquash "magit/lisp/magit-sequence" "\
Combine squash and fixup commits with their intended targets.

\(fn ARGS)" t nil)

(autoload 'magit-rebase-edit-commit "magit/lisp/magit-sequence" "\
Edit a single older commit using rebase.

\(fn COMMIT ARGS)" t nil)

(autoload 'magit-rebase-reword-commit "magit/lisp/magit-sequence" "\
Reword a single older commit using rebase.

\(fn COMMIT ARGS)" t nil)

(autoload 'magit-rebase-continue "magit/lisp/magit-sequence" "\
Restart the current rebasing operation.
In some cases this pops up a commit message buffer for you do
edit.  With a prefix argument the old message is reused as-is.

\(fn &optional NOEDIT)" t nil)

(autoload 'magit-rebase-skip "magit/lisp/magit-sequence" "\
Skip the current commit and restart the current rebase operation.

\(fn)" t nil)

(autoload 'magit-rebase-edit "magit/lisp/magit-sequence" "\
Edit the todo list of the current rebase operation.

\(fn)" t nil)

(autoload 'magit-rebase-abort "magit/lisp/magit-sequence" "\
Abort the current rebase operation, restoring the original branch.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-sequence" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-stash" "magit/lisp/magit-stash.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-stash.el
 (autoload 'magit-stash-popup "magit-stash" nil t)

(autoload 'magit-stash "magit/lisp/magit-stash" "\
Create a stash of the index and working tree.
Untracked files are included according to popup arguments.
One prefix argument is equivalent to `--include-untracked'
while two prefix arguments are equivalent to `--all'.

\(fn MESSAGE &optional INCLUDE-UNTRACKED)" t nil)

(autoload 'magit-stash-index "magit/lisp/magit-stash" "\
Create a stash of the index only.
Unstaged and untracked changes are not stashed.  The stashed
changes are applied in reverse to both the index and the
worktree.  This command can fail when the worktree is not clean.
Applying the resulting stash has the inverse effect.

\(fn MESSAGE)" t nil)

(autoload 'magit-stash-worktree "magit/lisp/magit-stash" "\
Create a stash of unstaged changes in the working tree.
Untracked files are included according to popup arguments.
One prefix argument is equivalent to `--include-untracked'
while two prefix arguments are equivalent to `--all'.

\(fn MESSAGE &optional INCLUDE-UNTRACKED)" t nil)

(autoload 'magit-stash-keep-index "magit/lisp/magit-stash" "\
Create a stash of the index and working tree, keeping index intact.
Untracked files are included according to popup arguments.
One prefix argument is equivalent to `--include-untracked'
while two prefix arguments are equivalent to `--all'.

\(fn MESSAGE &optional INCLUDE-UNTRACKED)" t nil)

(autoload 'magit-snapshot "magit/lisp/magit-stash" "\
Create a snapshot of the index and working tree.
Untracked files are included according to popup arguments.
One prefix argument is equivalent to `--include-untracked'
while two prefix arguments are equivalent to `--all'.

\(fn &optional INCLUDE-UNTRACKED)" t nil)

(autoload 'magit-snapshot-index "magit/lisp/magit-stash" "\
Create a snapshot of the index only.
Unstaged and untracked changes are not stashed.

\(fn)" t nil)

(autoload 'magit-snapshot-worktree "magit/lisp/magit-stash" "\
Create a snapshot of unstaged changes in the working tree.
Untracked files are included according to popup arguments.
One prefix argument is equivalent to `--include-untracked'
while two prefix arguments are equivalent to `--all'.

\(fn &optional INCLUDE-UNTRACKED)" t nil)

(autoload 'magit-stash-apply "magit/lisp/magit-stash" "\
Apply a stash to the working tree.
Try to preserve the stash index.  If that fails because there
are staged changes, apply without preserving the stash index.

\(fn STASH)" t nil)

(autoload 'magit-stash-drop "magit/lisp/magit-stash" "\
Remove a stash from the stash list.
When the region is active offer to drop all contained stashes.

\(fn STASH)" t nil)

(autoload 'magit-stash-clear "magit/lisp/magit-stash" "\
Remove all stashes saved in REF's reflog by deleting REF.

\(fn REF)" t nil)

(autoload 'magit-stash-branch "magit/lisp/magit-stash" "\
Create and checkout a new BRANCH from STASH.

\(fn STASH BRANCH)" t nil)

(autoload 'magit-stash-format-patch "magit/lisp/magit-stash" "\
Create a patch from STASH

\(fn STASH)" t nil)

(autoload 'magit-stash-list "magit/lisp/magit-stash" "\
List all stashes in a buffer.

\(fn)" t nil)

(autoload 'magit-stash-show "magit/lisp/magit-stash" "\
Show all diffs of a stash in a buffer.

\(fn STASH &optional ARGS FILES)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-stash" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-submodule" "magit/lisp/magit-submodule.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-submodule.el
 (autoload 'magit-submodule-popup "magit-submodule" nil t)

(autoload 'magit-submodule-add "magit/lisp/magit-submodule" "\
Add the repository at URL as a submodule.

Optional PATH is the path to the submodule relative to the root
of the superproject.  If it is nil, then the path is determined
based on the URL.

Optional NAME is the name of the submodule.  If it is nil, then
PATH also becomes the name.

\(fn URL &optional PATH NAME)" t nil)

(autoload 'magit-submodule-setup "magit/lisp/magit-submodule" "\
Clone and register missing submodules and checkout appropriate commits.

\(fn)" t nil)

(autoload 'magit-submodule-init "magit/lisp/magit-submodule" "\
Register submodules listed in \".gitmodules\" into \".git/config\".

\(fn)" t nil)

(autoload 'magit-submodule-update "magit/lisp/magit-submodule" "\
Clone missing submodules and checkout appropriate commits.
With a prefix argument also register submodules in \".git/config\".

\(fn &optional INIT)" t nil)

(autoload 'magit-submodule-sync "magit/lisp/magit-submodule" "\
Update each submodule's remote URL according to \".gitmodules\".

\(fn)" t nil)

(autoload 'magit-submodule-fetch "magit/lisp/magit-submodule" "\
Fetch all submodules.
With a prefix argument fetch all remotes.

\(fn &optional ALL)" t nil)

(autoload 'magit-submodule-deinit "magit/lisp/magit-submodule" "\
Unregister the submodule at PATH.

\(fn PATH)" t nil)

(autoload 'magit-insert-submodules "magit/lisp/magit-submodule" "\
Insert sections for all modules.
For each section insert the path and the output of `git describe --tags'.

\(fn)" nil nil)

(autoload 'magit-insert-modules-unpulled-from-upstream "magit/lisp/magit-submodule" "\
Insert sections for modules that haven't been pulled from the upstream.
These sections can be expanded to show the respective commits.

\(fn)" nil nil)

(autoload 'magit-insert-modules-unpulled-from-pushremote "magit/lisp/magit-submodule" "\
Insert sections for modules that haven't been pulled from the push-remote.
These sections can be expanded to show the respective commits.

\(fn)" nil nil)

(autoload 'magit-insert-modules-unpushed-to-upstream "magit/lisp/magit-submodule" "\
Insert sections for modules that haven't been pushed to the upstream.
These sections can be expanded to show the respective commits.

\(fn)" nil nil)

(autoload 'magit-insert-modules-unpushed-to-pushremote "magit/lisp/magit-submodule" "\
Insert sections for modules that haven't been pushed to the push-remote.
These sections can be expanded to show the respective commits.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-submodule" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-subtree" "magit/lisp/magit-subtree.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-subtree.el
 (autoload 'magit-subtree-popup "magit-subtree" nil t)

(autoload 'magit-subtree-add "magit/lisp/magit-subtree" "\
Add COMMIT from REPOSITORY as a new subtree at PREFIX.

\(fn PREFIX REPOSITORY COMMIT ARGS)" t nil)

(autoload 'magit-subtree-add-commit "magit/lisp/magit-subtree" "\
Add COMMIT as a new subtree at PREFIX.

\(fn PREFIX COMMIT ARGS)" t nil)

(autoload 'magit-subtree-merge "magit/lisp/magit-subtree" "\
Merge COMMIT into the PREFIX subtree.

\(fn PREFIX COMMIT ARGS)" t nil)

(autoload 'magit-subtree-pull "magit/lisp/magit-subtree" "\
Pull COMMIT from REPOSITORY into the PREFIX subtree.

\(fn PREFIX REPOSITORY COMMIT ARGS)" t nil)

(autoload 'magit-subtree-push "magit/lisp/magit-subtree" "\
Extract the history of the subtree PREFIX and push it to REF on REPOSITORY.

\(fn PREFIX REPOSITORY REF ARGS)" t nil)

(autoload 'magit-subtree-split "magit/lisp/magit-subtree" "\
Extract the history of the subtree PREFIX.

\(fn PREFIX COMMIT ARGS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-subtree" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-utils" "magit/lisp/magit-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-utils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-utils" '("magit-")))

;;;***

;;;### (autoloads nil "magit/lisp/magit-wip" "magit/lisp/magit-wip.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit/lisp/magit-wip.el

(defvar magit-wip-after-save-mode nil "\
Non-nil if Magit-Wip-After-Save mode is enabled.
See the `magit-wip-after-save-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `magit-wip-after-save-mode'.")

(custom-autoload 'magit-wip-after-save-mode "magit/lisp/magit-wip" nil)

(autoload 'magit-wip-after-save-mode "magit/lisp/magit-wip" "\
Toggle Magit-Wip-After-Save-Local mode in all buffers.
With prefix ARG, enable Magit-Wip-After-Save mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Magit-Wip-After-Save-Local mode is enabled in all buffers where
`magit-wip-after-save-local-mode-turn-on' would do it.
See `magit-wip-after-save-local-mode' for more information on Magit-Wip-After-Save-Local mode.

\(fn &optional ARG)" t nil)

(defvar magit-wip-after-apply-mode nil "\
Non-nil if Magit-Wip-After-Apply mode is enabled.
See the `magit-wip-after-apply-mode' command
for a description of this minor mode.")

(custom-autoload 'magit-wip-after-apply-mode "magit/lisp/magit-wip" nil)

(autoload 'magit-wip-after-apply-mode "magit/lisp/magit-wip" "\
Commit to work-in-progress refs.

After applying a change using any \"apply variant\"
command (apply, stage, unstage, discard, and reverse) commit the
affected files to the current wip refs.  For each branch there
may be two wip refs; one contains snapshots of the files as found
in the worktree and the other contains snapshots of the entries
in the index.

\(fn &optional ARG)" t nil)

(defvar magit-wip-before-change-mode nil "\
Non-nil if Magit-Wip-Before-Change mode is enabled.
See the `magit-wip-before-change-mode' command
for a description of this minor mode.")

(custom-autoload 'magit-wip-before-change-mode "magit/lisp/magit-wip" nil)

(autoload 'magit-wip-before-change-mode "magit/lisp/magit-wip" "\
Commit to work-in-progress refs before certain destructive changes.

Before invoking a revert command or an \"apply variant\"
command (apply, stage, unstage, discard, and reverse) commit the
affected tracked files to the current wip refs.  For each branch
there may be two wip refs; one contains snapshots of the files
as found in the worktree and the other contains snapshots of the
entries in the index.

Only changes to files which could potentially be affected by the
command which is about to be called are committed.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit/lisp/magit-wip" '("magit-wip-")))

;;;***

;;;### (autoloads nil "markdown-mode/markdown-mode" "markdown-mode/markdown-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from markdown-mode/markdown-mode.el

(autoload 'markdown-mode "markdown-mode/markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode/markdown-mode" "\
Major mode for editing GitHub Flavored Markdown files.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "mew/mew" "mew/mew.el" (0 0 0 0))
;;; Generated autoloads from mew/mew.el

(autoload 'mew "mew/mew" "\
Execute Mew first unless Mew is running. And retrieve arrived
messages or just visit to the default folder.

'proto' is determined by 'mew-proto' and 'mew-case'.

If 'proto' is '+' (ie a local folder), a mailbox is determined
according to 'mew-mailbox-type'. Otherwise (ie a remote folder), an
appropriate protocol to retrieve messages is chosen according to
'proto'.

If 'mew-auto-get' is 't', arrived messages are asynchronously fetched
and listed up in Summary mode.

'mew-auto-get' is 'nil', just visit to the folder determined by
'proto'.

When executed with '\\[universal-argument]', 'mew-auto-get' is
considered reversed.

\(fn &optional ARG)" t nil)

(autoload 'mew-send "mew/mew" "\
Execute Mew then prepare a draft. This may be used as library
function.

\(fn &optional TO CC SUBJECT)" t nil)

(autoload 'mew-user-agent-compose "mew/mew" "\
Set up message composition draft with Mew.
This is 'mail-user-agent' entry point to Mew.

The optional arguments TO and SUBJECT specify recipients and the
initial Subject field, respectively.

OTHER-HEADERS is an alist specifying additional
header fields.  Elements look like (HEADER . VALUE) where both
HEADER and VALUE are strings.

A Draft buffer is prepared according to SWITCH-FUNCTION.

CONTINUE, YANK-ACTION and SEND-ACTIONS are ignored.

\(fn &optional TO SUBJECT OTHER-HEADERS CONTINUE SWITCH-FUNCTION YANK-ACTION SEND-ACTIONS &rest DUMMY)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew" '(#("mew-" 0 4 (fontified nil)))))

;;;***

;;;### (autoloads nil "mew/mew-addrbook" "mew/mew-addrbook.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from mew/mew-addrbook.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-addrbook" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-attach" "mew/mew-attach.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-attach.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-attach" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-auth" "mew/mew-auth.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-auth.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-auth" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-blvs" "mew/mew-blvs.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-blvs.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-blvs" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-bq" "mew/mew-bq.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-bq.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-bq" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-cache" "mew/mew-cache.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-cache.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-cache" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-complete" "mew/mew-complete.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from mew/mew-complete.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-complete" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-config" "mew/mew-config.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-config.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-config" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-const" "mew/mew-const.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-const.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-const" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-darwin" "mew/mew-darwin.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-darwin.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-darwin" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-decode" "mew/mew-decode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-decode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-decode" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-demo" "mew/mew-demo.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-demo.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-demo" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-draft" "mew/mew-draft.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-draft.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-draft" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-edit" "mew/mew-edit.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-edit.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-edit" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-encode" "mew/mew-encode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-encode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-encode" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-env" "mew/mew-env.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-env.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-env" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-exec" "mew/mew-exec.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-exec.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-exec" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-ext" "mew/mew-ext.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-ext.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-ext" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-fib" "mew/mew-fib.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-fib.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-fib" '("mew-fib-")))

;;;***

;;;### (autoloads nil "mew/mew-func" "mew/mew-func.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-func.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-func" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-gemacs" "mew/mew-gemacs.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-gemacs.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-gemacs" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-header" "mew/mew-header.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-header.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-header" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-highlight" "mew/mew-highlight.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mew/mew-highlight.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-highlight" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-imap" "mew/mew-imap.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-imap.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-imap" '("mew-imap-")))

;;;***

;;;### (autoloads nil "mew/mew-imap2" "mew/mew-imap2.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-imap2.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-imap2" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-key" "mew/mew-key.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-key.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-key" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-lang-jp" "mew/mew-lang-jp.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from mew/mew-lang-jp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-lang-jp" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-lang-kr" "mew/mew-lang-kr.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from mew/mew-lang-kr.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-lang-kr" '("mew-thread-indent-strings")))

;;;***

;;;### (autoloads nil "mew/mew-lang-latin" "mew/mew-lang-latin.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mew/mew-lang-latin.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-lang-latin" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-local" "mew/mew-local.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-local.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-local" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-mark" "mew/mew-mark.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-mark.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-mark" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-message" "mew/mew-message.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from mew/mew-message.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-message" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-mime" "mew/mew-mime.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-mime.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-mime" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-minibuf" "mew/mew-minibuf.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from mew/mew-minibuf.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-minibuf" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-mule" "mew/mew-mule.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-mule.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-mule" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-mule3" "mew/mew-mule3.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-mule3.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-mule3" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-net" "mew/mew-net.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-net.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-net" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-nntp" "mew/mew-nntp.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-nntp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-nntp" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-nntp2" "mew/mew-nntp2.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-nntp2.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-nntp2" '("mew-nntp2-")))

;;;***

;;;### (autoloads nil "mew/mew-passwd" "mew/mew-passwd.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-passwd.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-passwd" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-pgp" "mew/mew-pgp.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-pgp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-pgp" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-pick" "mew/mew-pick.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-pick.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-pick" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-pop" "mew/mew-pop.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-pop.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-pop" '("mew-pop-")))

;;;***

;;;### (autoloads nil "mew/mew-refile" "mew/mew-refile.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-refile.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-refile" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-scan" "mew/mew-scan.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-scan.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-scan" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-search" "mew/mew-search.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-search.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-search" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-smime" "mew/mew-smime.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-smime.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-smime" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-smtp" "mew/mew-smtp.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-smtp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-smtp" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-sort" "mew/mew-sort.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-sort.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-sort" '("mew-s")))

;;;***

;;;### (autoloads nil "mew/mew-ssh" "mew/mew-ssh.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-ssh.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-ssh" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-ssl" "mew/mew-ssl.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-ssl.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-ssl" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-summary" "mew/mew-summary.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from mew/mew-summary.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-summary" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-summary2" "mew/mew-summary2.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from mew/mew-summary2.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-summary2" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-summary3" "mew/mew-summary3.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from mew/mew-summary3.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-summary3" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-summary4" "mew/mew-summary4.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from mew/mew-summary4.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-summary4" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-syntax" "mew/mew-syntax.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-syntax.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-syntax" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-thread" "mew/mew-thread.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mew/mew-thread.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-thread" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-unix" "mew/mew-unix.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-unix.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-unix" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-vars" "mew/mew-vars.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-vars.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-vars" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-vars2" "mew/mew-vars2.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-vars2.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-vars2" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-vars3" "mew/mew-vars3.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-vars3.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-vars3" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-varsx" "mew/mew-varsx.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-varsx.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-varsx" '("mew-defvar")))

;;;***

;;;### (autoloads nil "mew/mew-virtual" "mew/mew-virtual.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from mew/mew-virtual.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-virtual" '("mew-")))

;;;***

;;;### (autoloads nil "mew/mew-win32" "mew/mew-win32.el" (0 0 0 0))
;;; Generated autoloads from mew/mew-win32.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/mew-win32" '("mew-")))

;;;***

;;;### (autoloads nil "mew/temp" "mew/temp.el" (0 0 0 0))
;;; Generated autoloads from mew/temp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mew/temp" '("mew-compile")))

;;;***

;;;### (autoloads nil "minor-mode-hack/minor-mode-hack" "minor-mode-hack/minor-mode-hack.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from minor-mode-hack/minor-mode-hack.el

(autoload 'raise-minor-mode-map-alist "minor-mode-hack/minor-mode-hack" "\
Raise `minor-mode-map-alist' priority of MODE-SYMBOL.

\(fn MODE-SYMBOL)" nil nil)

(autoload 'lower-minor-mode-map-alist "minor-mode-hack/minor-mode-hack" "\
Lower `minor-mode-map-alist' priority of MODE-SYMBOL.

\(fn MODE-SYMBOL)" nil nil)

(autoload 'show-minor-mode-map-priority "minor-mode-hack/minor-mode-hack" "\
Show priority of `minor-mode-map-alist'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "multiple-cursors/mc-edit-lines" "multiple-cursors/mc-edit-lines.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from multiple-cursors/mc-edit-lines.el

(autoload 'mc/edit-lines "multiple-cursors/mc-edit-lines" "\
Add one cursor to each line of the active region.
Starts from mark and moves in straight down or up towards the
line point is on.

What is done with lines which are not long enough is governed by
`mc/edit-lines-empty-lines'.  The prefix argument ARG can be used
to override this.  If ARG is a symbol (when called from Lisp),
that symbol is used instead of `mc/edit-lines-empty-lines'.
Otherwise, if ARG negative, short lines will be ignored.  Any
other non-nil value will cause short lines to be padded.

\(fn &optional ARG)" t nil)

(autoload 'mc/edit-ends-of-lines "multiple-cursors/mc-edit-lines" "\
Add one cursor to the end of each line in the active region.

\(fn)" t nil)

(autoload 'mc/edit-beginnings-of-lines "multiple-cursors/mc-edit-lines" "\
Add one cursor to the beginning of each line in the active region.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "multiple-cursors/mc-hide-unmatched-lines-mode"
;;;;;;  "multiple-cursors/mc-hide-unmatched-lines-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from multiple-cursors/mc-hide-unmatched-lines-mode.el

(autoload 'mc-hide-unmatched-lines-mode "multiple-cursors/mc-hide-unmatched-lines-mode" "\
Minor mode when enabled hides all lines where no cursors (and
also hum/lines-to-expand below and above) To make use of this
mode press \"C-'\" while multiple-cursor-mode is active. You can
still edit lines while you are in mc-hide-unmatched-lines
mode. To leave this mode press <return> or \"C-g\"

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "multiple-cursors/mc-mark-more" "multiple-cursors/mc-mark-more.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from multiple-cursors/mc-mark-more.el

(autoload 'mc/mark-next-like-this "multiple-cursors/mc-mark-more" "\
Find and mark the next part of the buffer matching the currently active region
If no region is active add a cursor on the next line
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-next-like-this-word "multiple-cursors/mc-mark-more" "\
Find and mark the next part of the buffer matching the currently active region
If no region is active, mark the word at the point and find the next match
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-next-word-like-this "multiple-cursors/mc-mark-more" "\
Find and mark the next word of the buffer matching the currently active region
The matching region must be a whole word to be a match
If no region is active, mark the symbol at the point and find the next match
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-next-symbol-like-this "multiple-cursors/mc-mark-more" "\
Find and mark the next symbol of the buffer matching the currently active region
The matching region must be a whole symbol to be a match
If no region is active, mark the symbol at the point and find the next match
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-previous-like-this "multiple-cursors/mc-mark-more" "\
Find and mark the previous part of the buffer matching the currently active region
If no region is active add a cursor on the previous line
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-previous-word-like-this "multiple-cursors/mc-mark-more" "\
Find and mark the previous part of the buffer matching the currently active region
The matching region must be a whole word to be a match
If no region is active add a cursor on the previous line
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-previous-symbol-like-this "multiple-cursors/mc-mark-more" "\
Find and mark the previous part of the buffer matching the currently active region
The matching region must be a whole symbol to be a match
If no region is active add a cursor on the previous line
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-next-lines "multiple-cursors/mc-mark-more" "\


\(fn ARG)" t nil)

(autoload 'mc/mark-previous-lines "multiple-cursors/mc-mark-more" "\


\(fn ARG)" t nil)

(autoload 'mc/unmark-next-like-this "multiple-cursors/mc-mark-more" "\
Deselect next part of the buffer matching the currently active region.

\(fn)" t nil)

(autoload 'mc/unmark-previous-like-this "multiple-cursors/mc-mark-more" "\
Deselect prev part of the buffer matching the currently active region.

\(fn)" t nil)

(autoload 'mc/skip-to-next-like-this "multiple-cursors/mc-mark-more" "\
Skip the current one and select the next part of the buffer matching the currently active region.

\(fn)" t nil)

(autoload 'mc/skip-to-previous-like-this "multiple-cursors/mc-mark-more" "\
Skip the current one and select the prev part of the buffer matching the currently active region.

\(fn)" t nil)

(autoload 'mc/mark-all-like-this "multiple-cursors/mc-mark-more" "\
Find and mark all the parts of the buffer matching the currently active region

\(fn)" t nil)

(autoload 'mc/mark-all-words-like-this "multiple-cursors/mc-mark-more" "\


\(fn)" t nil)

(autoload 'mc/mark-all-symbols-like-this "multiple-cursors/mc-mark-more" "\


\(fn)" t nil)

(autoload 'mc/mark-all-in-region "multiple-cursors/mc-mark-more" "\
Find and mark all the parts in the region matching the given search

\(fn BEG END &optional SEARCH)" t nil)

(autoload 'mc/mark-all-in-region-regexp "multiple-cursors/mc-mark-more" "\
Find and mark all the parts in the region matching the given regexp.

\(fn BEG END)" t nil)

(autoload 'mc/mark-more-like-this-extended "multiple-cursors/mc-mark-more" "\
Like mark-more-like-this, but then lets you adjust with arrows key.
The adjustments work like this:

   <up>    Mark previous like this and set direction to 'up
   <down>  Mark next like this and set direction to 'down

If direction is 'up:

   <left>  Skip past the cursor furthest up
   <right> Remove the cursor furthest up

If direction is 'down:

   <left>  Remove the cursor furthest down
   <right> Skip past the cursor furthest down

The bindings for these commands can be changed. See `mc/mark-more-like-this-extended-keymap'.

\(fn)" t nil)

(autoload 'mc/mark-all-like-this-dwim "multiple-cursors/mc-mark-more" "\
Tries to guess what you want to mark all of.
Can be pressed multiple times to increase selection.

With prefix, it behaves the same as original `mc/mark-all-like-this'

\(fn ARG)" t nil)

(autoload 'mc/mark-all-dwim "multiple-cursors/mc-mark-more" "\
Tries even harder to guess what you want to mark all of.

If the region is active and spans multiple lines, it will behave
as if `mc/mark-all-in-region'. With the prefix ARG, it will call
`mc/edit-lines' instead.

If the region is inactive or on a single line, it will behave like
`mc/mark-all-like-this-dwim'.

\(fn ARG)" t nil)

(autoload 'mc/mark-all-like-this-in-defun "multiple-cursors/mc-mark-more" "\
Mark all like this in defun.

\(fn)" t nil)

(autoload 'mc/mark-all-words-like-this-in-defun "multiple-cursors/mc-mark-more" "\
Mark all words like this in defun.

\(fn)" t nil)

(autoload 'mc/mark-all-symbols-like-this-in-defun "multiple-cursors/mc-mark-more" "\
Mark all symbols like this in defun.

\(fn)" t nil)

(autoload 'mc/toggle-cursor-on-click "multiple-cursors/mc-mark-more" "\
Add a cursor where you click, or remove a fake cursor that is
already there.

\(fn EVENT)" t nil)

(defalias 'mc/add-cursor-on-click 'mc/toggle-cursor-on-click)

(autoload 'mc/mark-sgml-tag-pair "multiple-cursors/mc-mark-more" "\
Mark the tag we're in and its pair for renaming.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "multiple-cursors/mc-mark-pop" "multiple-cursors/mc-mark-pop.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from multiple-cursors/mc-mark-pop.el

(autoload 'mc/mark-pop "multiple-cursors/mc-mark-pop" "\
Add a cursor at the current point, pop off mark ring and jump
to the popped mark.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "multiple-cursors/mc-separate-operations" "multiple-cursors/mc-separate-operations.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from multiple-cursors/mc-separate-operations.el

(autoload 'mc/insert-numbers "multiple-cursors/mc-separate-operations" "\
Insert increasing numbers for each cursor, starting at
`mc/insert-numbers-default' or ARG.

\(fn ARG)" t nil)

(autoload 'mc/insert-letters "multiple-cursors/mc-separate-operations" "\
Insert increasing letters for each cursor, starting at 0 or ARG.
     Where letter[0]=a letter[2]=c letter[26]=aa

\(fn ARG)" t nil)

(autoload 'mc/reverse-regions "multiple-cursors/mc-separate-operations" "\


\(fn)" t nil)

(autoload 'mc/sort-regions "multiple-cursors/mc-separate-operations" "\


\(fn)" t nil)

(autoload 'mc/vertical-align "multiple-cursors/mc-separate-operations" "\
Aligns all cursors vertically with a given CHARACTER to the one with the
highest colum number (the rightest).
Might not behave as intended if more than one cursors are on the same line.

\(fn CHARACTER)" t nil)

(autoload 'mc/vertical-align-with-space "multiple-cursors/mc-separate-operations" "\
Aligns all cursors with whitespace like `mc/vertical-align' does

\(fn)" t nil)

;;;***

;;;### (autoloads nil "multiple-cursors/multiple-cursors-core" "multiple-cursors/multiple-cursors-core.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from multiple-cursors/multiple-cursors-core.el

(autoload 'multiple-cursors-mode "multiple-cursors/multiple-cursors-core" "\
Mode while multiple cursors are active.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "multiple-cursors/rectangular-region-mode"
;;;;;;  "multiple-cursors/rectangular-region-mode.el" (0 0 0 0))
;;; Generated autoloads from multiple-cursors/rectangular-region-mode.el

(autoload 'set-rectangular-region-anchor "multiple-cursors/rectangular-region-mode" "\
Anchors the rectangular region at point.

Think of this one as `set-mark' except you're marking a rectangular region. It is
an exceedingly quick way of adding multiple cursors to multiple lines.

\(fn)" t nil)

(autoload 'rectangular-region-mode "multiple-cursors/rectangular-region-mode" "\
A mode for creating a rectangular region to edit

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "nim-emacs-module/nim-emacs-module" "nim-emacs-module/nim-emacs-module.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-emacs-module/nim-emacs-module.el

(autoload 'nim-emacs-module-insert-template "nim-emacs-module/nim-emacs-module" "\
Insert template for nim-emacs-module.

\(fn)" t nil)

(autoload 'nim-emacs-module-init "nim-emacs-module/nim-emacs-module" "\
Prepare things for nim-emacs-module.

\(fn)" t nil)

(autoload 'nim-emacs-module-compile "nim-emacs-module/nim-emacs-module" "\
Compile current Nim file to a dylib file that can Emacs load.

\(fn)" t nil)

(autoload 'nim-compile-or-module-compile "nim-emacs-module/nim-emacs-module" "\
Work in progress.

\(fn &rest R)" t nil)

(autoload 'nim-emacs-module-setup-nim-mode "nim-emacs-module/nim-emacs-module" "\
Setup for nim-mode.

\(fn)" nil nil)

(with-eval-after-load "nim-mode" (add-hook 'nim-mode-hook 'nim-emacs-module-setup-nim-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-emacs-module/nim-emacs-module" '(#("nim-emacs-module-" 0 17 (fontified nil face font-lock-function-name-face)))))

;;;***

;;;### (autoloads nil "nim-mode/company-nim" "nim-mode/company-nim.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/company-nim.el

(autoload 'company-nim "nim-mode/company-nim" "\
`company-mode` backend for nimsuggest.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'company-nim-builtin "nim-mode/company-nim" "\
`company-mode` backend for Nim’s primitive functions.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/company-nim" '("company-nim" "nim-doc-buffer")))

;;;***

;;;### (autoloads nil "nim-mode/flycheck-nim-async" "nim-mode/flycheck-nim-async.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/flycheck-nim-async.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/flycheck-nim-async" '("flycheck-" "nimsuggest-check-output")))

;;;***

;;;### (autoloads nil "nim-mode/nim-compile" "nim-mode/nim-compile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nim-compile.el

(autoload 'nim-compile "nim-mode/nim-compile" "\


\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/nim-compile" '("nim-")))

;;;***

;;;### (autoloads nil "nim-mode/nim-eldoc" "nim-mode/nim-eldoc.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nim-eldoc.el

(autoload 'nim-eldoc-setup "nim-mode/nim-eldoc" "\
Setup eldoc configuration for nim-mode.

\(fn)" nil nil)

(add-hook 'nim-mode-hook 'nim-eldoc-setup)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/nim-eldoc" '("nim-eldoc-")))

;;;***

;;;### (autoloads nil "nim-mode/nim-fill" "nim-mode/nim-fill.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nim-fill.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/nim-fill" '("nim-fill-")))

;;;***

;;;### (autoloads nil "nim-mode/nim-helper" "nim-mode/nim-helper.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nim-helper.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/nim-helper" '("nim-")))

;;;***

;;;### (autoloads nil "nim-mode/nim-mode" "nim-mode/nim-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nim-mode.el

(autoload 'nim-mode "nim-mode/nim-mode" "\
A major mode for the Nim programming language.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.nim\\'" . nim-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/nim-mode" '("nim-")))

;;;***

;;;### (autoloads nil "nim-mode/nim-smie" "nim-mode/nim-smie.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nim-smie.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/nim-smie" '("nim-")))

;;;***

;;;### (autoloads nil "nim-mode/nim-suggest" "nim-mode/nim-suggest.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nim-suggest.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/nim-suggest" '("nim")))

;;;***

;;;### (autoloads nil "nim-mode/nim-syntax" "nim-mode/nim-syntax.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nim-syntax.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/nim-syntax" '("nim")))

;;;***

;;;### (autoloads nil "nim-mode/nim-thing-at-point" "nim-mode/nim-thing-at-point.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nim-thing-at-point.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/nim-thing-at-point" '("nim-")))

;;;***

;;;### (autoloads nil "nim-mode/nim-util" "nim-mode/nim-util.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nim-util.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/nim-util" '("nim-")))

;;;***

;;;### (autoloads nil "nim-mode/nim-vars" "nim-mode/nim-vars.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nim-vars.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/nim-vars" '("nim")))

;;;***

;;;### (autoloads nil "nim-mode/nimscript-mode" "nim-mode/nimscript-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from nim-mode/nimscript-mode.el

(autoload 'nimscript-mode "nim-mode/nimscript-mode" "\
A major-mode for NimScript files.
This major-mode is activated when you enter *.nims and *.nimble
suffixed files, but if it’s .nimble file, also another logic is
applied. See also ‘nimscript-mode-maybe’.

\(fn)" t nil)

(autoload 'nimscript-mode-maybe "nim-mode/nimscript-mode" "\
Most likely turn on ‘nimscript-mode’.
In *.nimble files, if the first line sentence matches
‘nim-nimble-ini-format-regex’, this function activates ‘conf-mode’
instead.  The default regex’s matching word is [Package].

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.nim\\(ble\\|s\\)\\'" . nimscript-mode-maybe))

;;;***

;;;### (autoloads nil "nim-mode/ob-nim" "nim-mode/ob-nim.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from nim-mode/ob-nim.el

(autoload 'org-babel-execute:nim "nim-mode/ob-nim" "\
Execute a block of nim code with org-babel.
This function is called by `org-babel-execute-src-block'.

\(fn BODY PARAMS)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nim-mode/ob-nim" '("org-babel-")))

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/htmlize" "org-mode/contrib/lisp/htmlize.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/htmlize.el

(autoload 'htmlize-buffer "org-mode/contrib/lisp/htmlize" "\
Convert BUFFER to HTML, preserving colors and decorations.

The generated HTML is available in a new buffer, which is returned.
When invoked interactively, the new buffer is selected in the current
window.  The title of the generated document will be set to the buffer's
file name or, if that's not available, to the buffer's name.

Note that htmlize doesn't fontify your buffers, it only uses the
decorations that are already present.  If you don't set up font-lock or
something else to fontify your buffers, the resulting HTML will be
plain.  Likewise, if you don't like the choice of colors, fix the mode
that created them, or simply alter the faces it uses.

\(fn &optional BUFFER)" t nil)

(autoload 'htmlize-region "org-mode/contrib/lisp/htmlize" "\
Convert the region to HTML, preserving colors and decorations.
See `htmlize-buffer' for details.

\(fn BEG END)" t nil)

(autoload 'htmlize-file "org-mode/contrib/lisp/htmlize" "\
Load FILE, fontify it, convert it to HTML, and save the result.

Contents of FILE are inserted into a temporary buffer, whose major mode
is set with `normal-mode' as appropriate for the file type.  The buffer
is subsequently fontified with `font-lock' and converted to HTML.  Note
that, unlike `htmlize-buffer', this function explicitly turns on
font-lock.  If a form of highlighting other than font-lock is desired,
please use `htmlize-buffer' directly on buffers so highlighted.

Buffers currently visiting FILE are unaffected by this function.  The
function does not change current buffer or move the point.

If TARGET is specified and names a directory, the resulting file will be
saved there instead of to FILE's directory.  If TARGET is specified and
does not name a directory, it will be used as output file name.

\(fn FILE &optional TARGET)" t nil)

(autoload 'htmlize-many-files "org-mode/contrib/lisp/htmlize" "\
Convert FILES to HTML and save the corresponding HTML versions.

FILES should be a list of file names to convert.  This function calls
`htmlize-file' on each file; see that function for details.  When
invoked interactively, you are prompted for a list of files to convert,
terminated with RET.

If TARGET-DIRECTORY is specified, the HTML files will be saved to that
directory.  Normally, each HTML file is saved to the directory of the
corresponding source file.

\(fn FILES &optional TARGET-DIRECTORY)" t nil)

(autoload 'htmlize-many-files-dired "org-mode/contrib/lisp/htmlize" "\
HTMLize dired-marked files.

\(fn ARG &optional TARGET-DIRECTORY)" t nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/org-annotate-file" "org-mode/contrib/lisp/org-annotate-file.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/org-annotate-file.el

(autoload 'org-annotate-file "org-mode/contrib/lisp/org-annotate-file" "\
Visit `org-annotate-file-storage-file` and add a new annotation section.
The annotation is opened at the new section which will be referencing
the point in the current file.

\(fn)" t nil)

(autoload 'org-annotate-file-show-section "org-mode/contrib/lisp/org-annotate-file" "\
Add or show annotation entry in STORAGE-FILE and return the buffer.
The annotation will link to ANNOTATED-BUFFER if specified,
  otherwise the current buffer is used.

\(fn STORAGE-FILE &optional ANNOTATED-BUFFER)" nil nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/org-bullets" "org-mode/contrib/lisp/org-bullets.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/org-bullets.el

(autoload 'org-bullets-mode "org-mode/contrib/lisp/org-bullets" "\
UTF-8 bullets for `org-mode'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/org-contacts" "org-mode/contrib/lisp/org-contacts.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/org-contacts.el

(autoload 'org-contacts "org-mode/contrib/lisp/org-contacts" "\
Create agenda view for contacts matching NAME.

\(fn NAME)" t nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/org-eldoc" "org-mode/contrib/lisp/org-eldoc.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/org-eldoc.el

(autoload 'org-eldoc-load "org-mode/contrib/lisp/org-eldoc" "\
Set up org-eldoc documentation function.

\(fn)" t nil)

(add-hook 'org-mode-hook #'org-eldoc-load)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/org-link-edit" "org-mode/contrib/lisp/org-link-edit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/org-link-edit.el

(autoload 'org-link-edit-forward-slurp "org-mode/contrib/lisp/org-link-edit" "\
Slurp N trailing blobs into link's description.

  The [[http://orgmode.org/][Org mode]] site

                        |
                        v

  The [[http://orgmode.org/][Org mode site]]

A blob is a block of non-whitespace characters.  When slurping
forward, trailing punctuation characters are not considered part
of a blob.

After slurping, return the slurped text and move point to the
beginning of the link.

If N is negative, slurp leading blobs instead of trailing blobs.

\(fn &optional N)" t nil)

(autoload 'org-link-edit-backward-slurp "org-mode/contrib/lisp/org-link-edit" "\
Slurp N leading blobs into link's description.

  The [[http://orgmode.org/][Org mode]] site

                        |
                        v

  [[http://orgmode.org/][The Org mode]] site

A blob is a block of non-whitespace characters.

After slurping, return the slurped text and move point to the
beginning of the link.

If N is negative, slurp trailing blobs instead of leading blobs.

\(fn &optional N)" t nil)

(autoload 'org-link-edit-forward-barf "org-mode/contrib/lisp/org-link-edit" "\
Barf N trailing blobs from link's description.

  The [[http://orgmode.org/][Org mode]] site

                        |
                        v

  The [[http://orgmode.org/][Org]] mode site

A blob is a block of non-whitespace characters.

After barfing, return the barfed text and move point to the
beginning of the link.

If N is negative, barf leading blobs instead of trailing blobs.

\(fn &optional N)" t nil)

(autoload 'org-link-edit-backward-barf "org-mode/contrib/lisp/org-link-edit" "\
Barf N leading blobs from link's description.

  The [[http://orgmode.org/][Org mode]] site

                        |
                        v

  The Org [[http://orgmode.org/][mode]] site

A blob is a block of non-whitespace characters.

After barfing, return the barfed text and move point to the
beginning of the link.

If N is negative, barf trailing blobs instead of leading blobs.

\(fn &optional N)" t nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/org-passwords" "org-mode/contrib/lisp/org-passwords.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/org-passwords.el

(autoload 'org-passwords-mode "org-mode/contrib/lisp/org-passwords" "\
Mode for storing passwords

\(fn)" t nil)

(autoload 'org-passwords "org-mode/contrib/lisp/org-passwords" "\
Open the password file. Open the password file defined by the
variable `org-password-file' in read-only mode and kill that
buffer later according to the value of the variable
`org-passwords-time-opened'. It also adds the `org-password-file'
to the auto-mode-alist so that it is opened with its mode being
`org-passwords-mode'.

With prefix arg ARG, the command does not set up a timer to kill the buffer.

With a double prefix arg \\[universal-argument] \\[universal-argument], open the file for editing.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/org-registry" "org-mode/contrib/lisp/org-registry.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/org-registry.el

(autoload 'org-registry-show "org-mode/contrib/lisp/org-registry" "\
Show Org files where there are links pointing to the current
buffer.

\(fn &optional VISIT)" t nil)

(autoload 'org-registry-visit "org-mode/contrib/lisp/org-registry" "\
If an Org file contains a link to the current location, visit
this file.

\(fn)" t nil)

(autoload 'org-registry-initialize "org-mode/contrib/lisp/org-registry" "\
Initialize `org-registry-alist'.
If FROM-SCRATCH is non-nil or the registry does not exist yet,
create a new registry from scratch and eval it. If the registry
exists, eval `org-registry-file' and make it the new value for
`org-registry-alist'.

\(fn &optional FROM-SCRATCH)" t nil)

(autoload 'org-registry-insinuate "org-mode/contrib/lisp/org-registry" "\
Call `org-registry-update' after saving in Org-mode.
Use with caution.  This could slow down things a bit.

\(fn)" t nil)

(autoload 'org-registry-update "org-mode/contrib/lisp/org-registry" "\
Update the registry for the current Org file.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/org-screenshot" "org-mode/contrib/lisp/org-screenshot.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/org-screenshot.el

(autoload 'org-screenshot-take "org-mode/contrib/lisp/org-screenshot" "\
Take a screenshot and insert link to it at point, if image
display is already on (see \\[org-toggle-inline-images])
screenshot will be displayed as an image

Screen area for the screenshot is selected with the mouse, left
click on a window screenshots that window, while left click and
drag selects a region. Pressing any key cancels the screen shot

With `C-u' universal argument waits one second after target is
selected before taking the screenshot. With double `C-u' wait two
seconds.

With triple `C-u' wait 3 seconds, and also rings the bell when
screenshot is done, any more `C-u' after that increases delay by
2 seconds

\(fn &optional DELAY)" t nil)

(autoload 'org-screenshot-rotate-prev "org-mode/contrib/lisp/org-screenshot" "\
Rotate last screenshot with one of the previously taken
screenshots from the same directory. If DIR is negative, rotate
in the other direction

\(fn DIR)" t nil)

(autoload 'org-screenshot-rotate-next "org-mode/contrib/lisp/org-screenshot" "\
Rotate last screenshot with one of the previously taken
screenshots from the same directory. If DIR is negative, rotate
in the other direction

\(fn DIR)" t nil)

(autoload 'org-screenshot-show-unused "org-mode/contrib/lisp/org-screenshot" "\
Open A Dired buffer with unused screenshots marked

\(fn)" t nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/org-toc" "org-mode/contrib/lisp/org-toc.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/org-toc.el

(autoload 'org-toc-show "org-mode/contrib/lisp/org-toc" "\
Show the table of contents of the current Org-mode buffer.

\(fn &optional DEPTH POSITION)" t nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/org-track" "org-mode/contrib/lisp/org-track.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/org-track.el

(autoload 'org-track-fetch-package "org-mode/contrib/lisp/org-track" "\
Fetch Org package depending on `org-track-fetch-package-extension'.
If DIRECTORY is defined, unpack the package there, i.e. add the
subdirectory org-mode/ to DIRECTORY.

\(fn &optional DIRECTORY)" t nil)

(autoload 'org-track-compile-org "org-mode/contrib/lisp/org-track" "\
Compile all *.el files that come with org-mode.
Generate the autoloads file `org-loaddefs.el'.

DIRECTORY is where the directory org-mode/ lives (i.e. the
          parent directory of your local repo.

\(fn &optional DIRECTORY)" t nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/ox-freemind" "org-mode/contrib/lisp/ox-freemind.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/ox-freemind.el

(autoload 'org-freemind-export-to-freemind "org-mode/contrib/lisp/ox-freemind" "\
Export current buffer to a Freemind Mindmap file.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting file should be accessible through
the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

When optional argument BODY-ONLY is non-nil, only write code
between \"<body>\" and \"</body>\" tags.

EXT-PLIST, when provided, is a property list with external
parameters overriding Org default settings, but still inferior to
file-local settings.

Return output file's name.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY BODY-ONLY EXT-PLIST)" t nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/ox-koma-letter" "org-mode/contrib/lisp/ox-koma-letter.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/ox-koma-letter.el

(autoload 'org-koma-letter-export-as-latex "org-mode/contrib/lisp/ox-koma-letter" "\
Export current buffer as a KOMA Scrlttr2 letter.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting buffer should be accessible
through the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

When optional argument BODY-ONLY is non-nil, only write code
between \"\\begin{letter}\" and \"\\end{letter}\".

EXT-PLIST, when provided, is a proeprty list with external
parameters overriding Org default settings, but still inferior to
file-local settings.

Export is done in a buffer named \"*Org KOMA-LETTER Export*\".  It
will be displayed if `org-export-show-temporary-export-buffer' is
non-nil.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY BODY-ONLY EXT-PLIST)" t nil)

(autoload 'org-koma-letter-export-to-latex "org-mode/contrib/lisp/ox-koma-letter" "\
Export current buffer as a KOMA Scrlttr2 letter (tex).

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting file should be accessible through
the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

When optional argument BODY-ONLY is non-nil, only write code
between \"\\begin{letter}\" and \"\\end{letter}\".

EXT-PLIST, when provided, is a property list with external
parameters overriding Org default settings, but still inferior to
file-local settings.

When optional argument PUB-DIR is set, use it as the publishing
directory.

Return output file's name.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY BODY-ONLY EXT-PLIST)" t nil)

(autoload 'org-koma-letter-export-to-pdf "org-mode/contrib/lisp/ox-koma-letter" "\
Export current buffer as a KOMA Scrlttr2 letter (pdf).

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting file should be accessible through
the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

When optional argument BODY-ONLY is non-nil, only write code
between \"\\begin{letter}\" and \"\\end{letter}\".

EXT-PLIST, when provided, is a property list with external
parameters overriding Org default settings, but still inferior to
file-local settings.

Return PDF file's name.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY BODY-ONLY EXT-PLIST)" t nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/ox-rss" "org-mode/contrib/lisp/ox-rss.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/ox-rss.el

(autoload 'org-rss-export-as-rss "org-mode/contrib/lisp/ox-rss" "\
Export current buffer to a RSS buffer.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting buffer should be accessible
through the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

Export is done in a buffer named \"*Org RSS Export*\", which will
be displayed when `org-export-show-temporary-export-buffer' is
non-nil.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY)" t nil)

(autoload 'org-rss-export-to-rss "org-mode/contrib/lisp/ox-rss" "\
Export current buffer to a RSS file.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting file should be accessible through
the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

Return output file's name.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY)" t nil)

(autoload 'org-rss-publish-to-rss "org-mode/contrib/lisp/ox-rss" "\
Publish an org file to RSS.

FILENAME is the filename of the Org file to be published.  PLIST
is the property list for the given project.  PUB-DIR is the
publishing directory.

Return output file name.

\(fn PLIST FILENAME PUB-DIR)" nil nil)

;;;***

;;;### (autoloads nil "org-mode/contrib/lisp/ox-taskjuggler" "org-mode/contrib/lisp/ox-taskjuggler.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/contrib/lisp/ox-taskjuggler.el

(autoload 'org-taskjuggler-export "org-mode/contrib/lisp/ox-taskjuggler" "\
Export current buffer to a TaskJuggler file.

The exporter looks for a tree with tag that matches
`org-taskjuggler-project-tag' and takes this as the tasks for
this project.  The first node of this tree defines the project
properties such as project name and project period.

If there is a tree with tag that matches
`org-taskjuggler-resource-tag' this tree is taken as resources
for the project.  If no resources are specified, a default
resource is created and allocated to the project.

Also the TaskJuggler project will be created with default reports
as defined in `org-taskjuggler-default-reports'.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting file should be accessible through
the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

Return output file's name.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY)" t nil)

(autoload 'org-taskjuggler-export-and-process "org-mode/contrib/lisp/ox-taskjuggler" "\
Export current buffer to a TaskJuggler file and process it.

The exporter looks for a tree with tag that matches
`org-taskjuggler-project-tag' and takes this as the tasks for
this project.  The first node of this tree defines the project
properties such as project name and project period.

If there is a tree with tag that matches
`org-taskjuggler-resource-tag' this tree is taken as resources
for the project.  If no resources are specified, a default
resource is created and allocated to the project.

Also the TaskJuggler project will be created with default reports
as defined in `org-taskjuggler-default-reports'.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

Return a list of reports.

\(fn &optional SUBTREEP VISIBLE-ONLY)" t nil)

(autoload 'org-taskjuggler-export-process-and-open "org-mode/contrib/lisp/ox-taskjuggler" "\
Export current buffer to a TaskJuggler file, process and open it.

Export and process the file using
`org-taskjuggler-export-and-process' and open the generated
reports with a browser.

If you are targeting TaskJuggler 2.4 (see
`org-taskjuggler-target-version') the processing and display of
the reports is done using the TaskJuggler GUI.

\(fn &optional SUBTREEP VISIBLE-ONLY)" t nil)

;;;***

;;;### (autoloads nil "org-mode/lisp/org" "org-mode/lisp/org.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/lisp/org.el

(autoload 'org-babel-do-load-languages "org-mode/lisp/org" "\
Load the languages defined in `org-babel-load-languages'.

\(fn SYM VALUE)" nil nil)

(autoload 'org-babel-load-file "org-mode/lisp/org" "\
Load Emacs Lisp source code blocks in the Org-mode FILE.
This function exports the source code using `org-babel-tangle'
and then loads the resulting file using `load-file'.  With prefix
arg (noninteractively: 2nd arg) COMPILE the tangled Emacs Lisp
file to byte-code before it is loaded.

\(fn FILE &optional COMPILE)" t nil)

(autoload 'org-version "org-mode/lisp/org" "\
Show the org-mode version.
Interactively, or when MESSAGE is non-nil, show it in echo area.
With prefix argument, or when HERE is non-nil, insert it at point.
In non-interactive uses, a reduced version string is output unless
FULL is given.

\(fn &optional HERE FULL MESSAGE)" t nil)

(autoload 'turn-on-orgtbl "org-mode/lisp/org" "\
Unconditionally turn on `orgtbl-mode'.

\(fn)" nil nil)

(autoload 'org-clock-persistence-insinuate "org-mode/lisp/org" "\
Set up hooks for clock persistence.

\(fn)" nil nil)

(autoload 'org-mode "org-mode/lisp/org" "\
Outline-based notes management and organizer, alias
\"Carsten's outline-mode for keeping track of everything.\"

Org-mode develops organizational tasks around a NOTES file which
contains information about projects as plain text.  Org-mode is
implemented on top of outline-mode, which is ideal to keep the content
of large files well structured.  It supports ToDo items, deadlines and
time stamps, which magically appear in the diary listing of the Emacs
calendar.  Tables are easily created with a built-in table editor.
Plain text URL-like links connect to websites, emails (VM), Usenet
messages (Gnus), BBDB entries, and any files related to the project.
For printing and sharing of notes, an Org-mode file (or a part of it)
can be exported as a structured ASCII or HTML file.

The following commands are available:

\\{org-mode-map}

\(fn)" t nil)

(autoload 'org-cycle "org-mode/lisp/org" "\
TAB-action and visibility cycling for Org-mode.

This is the command invoked in Org-mode by the TAB key.  Its main purpose
is outline visibility cycling, but it also invokes other actions
in special contexts.

- When this function is called with a prefix argument, rotate the entire
  buffer through 3 states (global cycling)
  1. OVERVIEW: Show only top-level headlines.
  2. CONTENTS: Show all headlines of all levels, but no body text.
  3. SHOW ALL: Show everything.
  With a double \\[universal-argument] prefix argument, switch to the startup visibility,
  determined by the variable `org-startup-folded', and by any VISIBILITY
  properties in the buffer.
  With a triple \\[universal-argument] prefix argument, show the entire buffer, including any drawers.

- When inside a table, re-align the table and move to the next field.

- When point is at the beginning of a headline, rotate the subtree started
  by this line through 3 different states (local cycling)
  1. FOLDED:   Only the main headline is shown.
  2. CHILDREN: The main headline and the direct children are shown.
               From this state, you can move to one of the children
               and zoom in further.
  3. SUBTREE:  Show the entire subtree, including body text.
  If there is no subtree, switch directly from CHILDREN to FOLDED.

- When point is at the beginning of an empty headline and the variable
  `org-cycle-level-after-item/entry-creation' is set, cycle the level
  of the headline by demoting and promoting it to likely levels.  This
  speeds up creation document structure by pressing TAB once or several
  times right after creating a new headline.

- When there is a numeric prefix, go up to a heading with level ARG, do
  a `show-subtree' and return to the previous cursor position.  If ARG
  is negative, go up that many levels.

- When point is not at the beginning of a headline, execute the global
  binding for TAB, which is re-indenting the line.  See the option
  `org-cycle-emulate-tab' for details.

- Special case: if point is at the beginning of the buffer and there is
  no headline in line 1, this function will act as if called with prefix arg
  (\\[universal-argument] TAB, same as S-TAB) also when called without prefix arg.
  But only if also the variable `org-cycle-global-at-bob' is t.

\(fn &optional ARG)" t nil)

(autoload 'org-global-cycle "org-mode/lisp/org" "\
Cycle the global visibility.  For details see `org-cycle'.
With \\[universal-argument] prefix arg, switch to startup visibility.
With a numeric prefix, show all headlines up to that level.

\(fn &optional ARG)" t nil)
(put 'orgstruct-heading-prefix-regexp 'safe-local-variable 'stringp)

(autoload 'orgstruct-mode "org-mode/lisp/org" "\
Toggle the minor mode `orgstruct-mode'.
This mode is for using Org-mode structure commands in other
modes.  The following keys behave as if Org-mode were active, if
the cursor is on a headline, or on a plain list item (both as
defined by Org-mode).

\(fn &optional ARG)" t nil)

(autoload 'turn-on-orgstruct "org-mode/lisp/org" "\
Unconditionally turn on `orgstruct-mode'.

\(fn)" nil nil)

(autoload 'turn-on-orgstruct++ "org-mode/lisp/org" "\
Unconditionally turn on `orgstruct++-mode'.

\(fn)" nil nil)

(autoload 'org-run-like-in-org-mode "org-mode/lisp/org" "\
Run a command, pretending that the current buffer is in Org-mode.
This will temporarily bind local variables that are typically bound in
Org-mode to the values they have in Org-mode, and then interactively
call CMD.

\(fn CMD)" nil nil)

(autoload 'org-store-link "org-mode/lisp/org" "\
\\<org-mode-map>Store an org-link to the current location.
This link is added to `org-stored-links' and can later be inserted
into an Org buffer with \\[org-insert-link].

For some link types, a prefix ARG is interpreted.
For links to Usenet articles, ARG negates `org-gnus-prefer-web-links'.
For file links, ARG negates `org-context-in-file-links'.

A double prefix ARG force skipping storing functions that are not
part of Org's core.

A triple prefix ARG force storing a link for each line in the
active region.

\(fn ARG)" t nil)

(autoload 'org-insert-link-global "org-mode/lisp/org" "\
Insert a link like Org-mode does.
This command can be called in any mode to insert a link in Org-mode syntax.

\(fn)" t nil)

(autoload 'org-open-at-point-global "org-mode/lisp/org" "\
Follow a link or time-stamp like Org mode does.
This command can be called in any mode to follow an external link
or a time-stamp that has Org mode syntax.  Its behavior is
undefined when called on internal links (e.g., fuzzy links).
Raise an error when there is nothing to follow.

\(fn)" t nil)

(autoload 'org-open-link-from-string "org-mode/lisp/org" "\
Open a link in the string S, as if it was in Org-mode.

\(fn S &optional ARG REFERENCE-BUFFER)" t nil)

(autoload 'org-switchb "org-mode/lisp/org" "\
Switch between Org buffers.

With \\[universal-argument] prefix, restrict available buffers to files.

With \\[universal-argument] \\[universal-argument] prefix, restrict available buffers to agenda files.

\(fn &optional ARG)" t nil)

(autoload 'org-cycle-agenda-files "org-mode/lisp/org" "\
Cycle through the files in `org-agenda-files'.
If the current buffer visits an agenda file, find the next one in the list.
If the current buffer does not, find the first agenda file.

\(fn)" t nil)

(autoload 'org-submit-bug-report "org-mode/lisp/org" "\
Submit a bug report on Org-mode via mail.

Don't hesitate to report any problems or inaccurate documentation.

If you don't have setup sending mail from (X)Emacs, please copy the
output buffer into your mail program, as it gives us important
information about your Org-mode version and configuration.

\(fn)" t nil)

(autoload 'org-reload "org-mode/lisp/org" "\
Reload all org lisp files.
With prefix arg UNCOMPILED, load the uncompiled versions.

\(fn &optional UNCOMPILED)" t nil)

(autoload 'org-customize "org-mode/lisp/org" "\
Call the customize function with org as argument.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "org-mode/lisp/org-agenda" "org-mode/lisp/org-agenda.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/lisp/org-agenda.el

(autoload 'org-toggle-sticky-agenda "org-mode/lisp/org-agenda" "\
Toggle `org-agenda-sticky'.

\(fn &optional ARG)" t nil)

(autoload 'org-agenda "org-mode/lisp/org-agenda" "\
Dispatch agenda commands to collect entries to the agenda buffer.
Prompts for a command to execute.  Any prefix arg will be passed
on to the selected command.  The default selections are:

a     Call `org-agenda-list' to display the agenda for current day or week.
t     Call `org-todo-list' to display the global todo list.
T     Call `org-todo-list' to display the global todo list, select only
      entries with a specific TODO keyword (the user gets a prompt).
m     Call `org-tags-view' to display headlines with tags matching
      a condition  (the user is prompted for the condition).
M     Like `m', but select only TODO entries, no ordinary headlines.
L     Create a timeline for the current buffer.
e     Export views to associated files.
s     Search entries for keywords.
S     Search entries for keywords, only with TODO keywords.
/     Multi occur across all agenda files and also files listed
      in `org-agenda-text-search-extra-files'.
<     Restrict agenda commands to buffer, subtree, or region.
      Press several times to get the desired effect.
>     Remove a previous restriction.
#     List \"stuck\" projects.
!     Configure what \"stuck\" means.
C     Configure custom agenda commands.

More commands can be added by configuring the variable
`org-agenda-custom-commands'.  In particular, specific tags and TODO keyword
searches can be pre-defined in this way.

If the current buffer is in Org-mode and visiting a file, you can also
first press `<' once to indicate that the agenda should be temporarily
\(until the next use of \\[org-agenda]) restricted to the current file.
Pressing `<' twice means to restrict to the current subtree or region
\(if active).

\(fn &optional ARG ORG-KEYS RESTRICTION)" t nil)

(autoload 'org-batch-agenda "org-mode/lisp/org-agenda" "\
Run an agenda command in batch mode and send the result to STDOUT.
If CMD-KEY is a string of length 1, it is used as a key in
`org-agenda-custom-commands' and triggers this command.  If it is a
longer string it is used as a tags/todo match string.
Parameters are alternating variable names and values that will be bound
before running the agenda command.

\(fn CMD-KEY &rest PARAMETERS)" nil t)

(autoload 'org-batch-agenda-csv "org-mode/lisp/org-agenda" "\
Run an agenda command in batch mode and send the result to STDOUT.
If CMD-KEY is a string of length 1, it is used as a key in
`org-agenda-custom-commands' and triggers this command.  If it is a
longer string it is used as a tags/todo match string.
Parameters are alternating variable names and values that will be bound
before running the agenda command.

The output gives a line for each selected agenda item.  Each
item is a list of comma-separated values, like this:

category,head,type,todo,tags,date,time,extra,priority-l,priority-n

category     The category of the item
head         The headline, without TODO kwd, TAGS and PRIORITY
type         The type of the agenda entry, can be
                todo               selected in TODO match
                tagsmatch          selected in tags match
                diary              imported from diary
                deadline           a deadline on given date
                scheduled          scheduled on given date
                timestamp          entry has timestamp on given date
                closed             entry was closed on given date
                upcoming-deadline  warning about deadline
                past-scheduled     forwarded scheduled item
                block              entry has date block including g. date
todo         The todo keyword, if any
tags         All tags including inherited ones, separated by colons
date         The relevant date, like 2007-2-14
time         The time, like 15:00-16:50
extra        Sting with extra planning info
priority-l   The priority letter if any was given
priority-n   The computed numerical priority
agenda-day   The day in the agenda where this is listed

\(fn CMD-KEY &rest PARAMETERS)" nil t)

(autoload 'org-store-agenda-views "org-mode/lisp/org-agenda" "\
Store agenda views.

\(fn &rest PARAMETERS)" t nil)

(autoload 'org-batch-store-agenda-views "org-mode/lisp/org-agenda" "\
Run all custom agenda commands that have a file argument.

\(fn &rest PARAMETERS)" nil t)

(autoload 'org-agenda-list "org-mode/lisp/org-agenda" "\
Produce a daily/weekly view from all files in variable `org-agenda-files'.
The view will be for the current day or week, but from the overview buffer
you will be able to go to other days/weeks.

With a numeric prefix argument in an interactive call, the agenda will
span ARG days.  Lisp programs should instead specify SPAN to change
the number of days.  SPAN defaults to `org-agenda-span'.

START-DAY defaults to TODAY, or to the most recent match for the weekday
given in `org-agenda-start-on-weekday'.

When WITH-HOUR is non-nil, only include scheduled and deadline
items if they have an hour specification like [h]h:mm.

\(fn &optional ARG START-DAY SPAN WITH-HOUR)" t nil)

(autoload 'org-search-view "org-mode/lisp/org-agenda" "\
Show all entries that contain a phrase or words or regular expressions.

With optional prefix argument TODO-ONLY, only consider entries that are
TODO entries.  The argument STRING can be used to pass a default search
string into this function.  If EDIT-AT is non-nil, it means that the
user should get a chance to edit this string, with cursor at position
EDIT-AT.

The search string can be viewed either as a phrase that should be found as
is, or it can be broken into a number of snippets, each of which must match
in a Boolean way to select an entry.  The default depends on the variable
`org-agenda-search-view-always-boolean'.
Even if this is turned off (the default) you can always switch to
Boolean search dynamically by preceding the first word with  \"+\" or \"-\".

The default is a direct search of the whole phrase, where each space in
the search string can expand to an arbitrary amount of whitespace,
including newlines.

If using a Boolean search, the search string is split on whitespace and
each snippet is searched separately, with logical AND to select an entry.
Words prefixed with a minus must *not* occur in the entry.  Words without
a prefix or prefixed with a plus must occur in the entry.  Matching is
case-insensitive.  Words are enclosed by word delimiters (i.e. they must
match whole words, not parts of a word) if
`org-agenda-search-view-force-full-words' is set (default is nil).

Boolean search snippets enclosed by curly braces are interpreted as
regular expressions that must or (when preceded with \"-\") must not
match in the entry.  Snippets enclosed into double quotes will be taken
as a whole, to include whitespace.

- If the search string starts with an asterisk, search only in headlines.
- If (possibly after the leading star) the search string starts with an
  exclamation mark, this also means to look at TODO entries only, an effect
  that can also be achieved with a prefix argument.
- If (possibly after star and exclamation mark) the search string starts
  with a colon, this will mean that the (non-regexp) snippets of the
  Boolean search must match as full words.

This command searches the agenda files, and in addition the files listed
in `org-agenda-text-search-extra-files'.

\(fn &optional TODO-ONLY STRING EDIT-AT)" t nil)

(autoload 'org-todo-list "org-mode/lisp/org-agenda" "\
Show all (not done) TODO entries from all agenda file in a single list.
The prefix arg can be used to select a specific TODO keyword and limit
the list to these.  When using \\[universal-argument], you will be prompted
for a keyword.  A numeric prefix directly selects the Nth keyword in
`org-todo-keywords-1'.

\(fn &optional ARG)" t nil)

(autoload 'org-tags-view "org-mode/lisp/org-agenda" "\
Show all headlines for all `org-agenda-files' matching a TAGS criterion.
The prefix arg TODO-ONLY limits the search to TODO entries.

\(fn &optional TODO-ONLY MATCH)" t nil)

(autoload 'org-agenda-list-stuck-projects "org-mode/lisp/org-agenda" "\
Create agenda view for projects that are stuck.
Stuck projects are project that have no next actions.  For the definitions
of what a project is and how to check if it stuck, customize the variable
`org-stuck-projects'.

\(fn &rest IGNORE)" t nil)

(autoload 'org-diary "org-mode/lisp/org-agenda" "\
Return diary information from org files.
This function can be used in a \"sexp\" diary entry in the Emacs calendar.
It accesses org files and extracts information from those files to be
listed in the diary.  The function accepts arguments specifying what
items should be listed.  For a list of arguments allowed here, see the
variable `org-agenda-entry-types'.

The call in the diary file should look like this:

   &%%(org-diary) ~/path/to/some/orgfile.org

Use a separate line for each org file to check.  Or, if you omit the file name,
all files listed in `org-agenda-files' will be checked automatically:

   &%%(org-diary)

If you don't give any arguments (as in the example above), the default value
of `org-agenda-entry-types' is used: (:deadline :scheduled :timestamp :sexp).
So the example above may also be written as

   &%%(org-diary :deadline :timestamp :sexp :scheduled)

The function expects the lisp variables `entry' and `date' to be provided
by the caller, because this is how the calendar works.  Don't use this
function from a program - use `org-agenda-get-day-entries' instead.

\(fn &rest ARGS)" nil nil)

(autoload 'org-agenda-check-for-timestamp-as-reason-to-ignore-todo-item "org-mode/lisp/org-agenda" "\
Do we have a reason to ignore this TODO entry because it has a time stamp?

\(fn &optional END)" nil nil)

(autoload 'org-agenda-set-restriction-lock "org-mode/lisp/org-agenda" "\
Set restriction lock for agenda, to current subtree or file.
Restriction will be the file if TYPE is `file', or if type is the
universal prefix \\='(4), or if the cursor is before the first headline
in the file.  Otherwise, restriction will be to the current subtree.

\(fn &optional TYPE)" t nil)

(autoload 'org-calendar-goto-agenda "org-mode/lisp/org-agenda" "\
Compute the Org-mode agenda for the calendar date displayed at the cursor.
This is a command that has to be installed in `calendar-mode-map'.

\(fn)" t nil)

(autoload 'org-agenda-to-appt "org-mode/lisp/org-agenda" "\
Activate appointments found in `org-agenda-files'.
With a \\[universal-argument] prefix, refresh the list of
appointments.

If FILTER is t, interactively prompt the user for a regular
expression, and filter out entries that don't match it.

If FILTER is a string, use this string as a regular expression
for filtering entries out.

If FILTER is a function, filter out entries against which
calling the function returns nil.  This function takes one
argument: an entry from `org-agenda-get-day-entries'.

FILTER can also be an alist with the car of each cell being
either `headline' or `category'.  For example:

  \\='((headline \"IMPORTANT\")
    (category \"Work\"))

will only add headlines containing IMPORTANT or headlines
belonging to the \"Work\" category.

ARGS are symbols indicating what kind of entries to consider.
By default `org-agenda-to-appt' will use :deadline*, :scheduled*
\(i.e., deadlines and scheduled items with a hh:mm specification)
and :timestamp entries.  See the docstring of `org-diary' for
details and examples.

If an entry has a APPT_WARNTIME property, its value will be used
to override `appt-message-warning-time'.

\(fn &optional REFRESH FILTER &rest ARGS)" t nil)

;;;***

;;;### (autoloads nil "org-mode/lisp/org-capture" "org-mode/lisp/org-capture.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/lisp/org-capture.el

(autoload 'org-capture-string "org-mode/lisp/org-capture" "\
Capture STRING with the template selected by KEYS.

\(fn STRING &optional KEYS)" t nil)

(autoload 'org-capture "org-mode/lisp/org-capture" "\
Capture something.
\\<org-capture-mode-map>
This will let you select a template from `org-capture-templates', and then
file the newly captured information.  The text is immediately inserted
at the target location, and an indirect buffer is shown where you can
edit it.  Pressing \\[org-capture-finalize] brings you back to the previous state
of Emacs, so that you can continue your work.

When called interactively with a \\[universal-argument] prefix argument GOTO, don't capture
anything, just go to the file/headline where the selected template
stores its notes.  With a double prefix argument \\[universal-argument] \\[universal-argument], go to the last note
stored.

When called with a `C-0' (zero) prefix, insert a template at point.

ELisp programs can set KEYS to a string associated with a template
in `org-capture-templates'.  In this case, interactive selection
will be bypassed.

If `org-capture-use-agenda-date' is non-nil, capturing from the
agenda will use the date at point as the default date.  Then, a
`C-1' prefix will tell the capture process to use the HH:MM time
of the day at point (if any) or the current HH:MM time.

\(fn &optional GOTO KEYS)" t nil)

(autoload 'org-capture-import-remember-templates "org-mode/lisp/org-capture" "\
Set `org-capture-templates' to be similar to `org-remember-templates'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "org-mode/lisp/org-colview" "org-mode/lisp/org-colview.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/lisp/org-colview.el

(autoload 'org-columns-remove-overlays "org-mode/lisp/org-colview" "\
Remove all currently active column overlays.

\(fn)" t nil)

(autoload 'org-columns-get-format-and-top-level "org-mode/lisp/org-colview" "\


\(fn)" nil nil)

(autoload 'org-columns "org-mode/lisp/org-colview" "\
Turn on column view on an Org mode file.

Column view applies to the whole buffer if point is before the
first headline.  Otherwise, it applies to the first ancestor
setting \"COLUMNS\" property.  If there is none, it defaults to
the current headline.  With a \\[universal-argument] prefix argument, turn on column
view for the whole buffer unconditionally.

When COLUMNS-FMT-STRING is non-nil, use it as the column format.

\(fn &optional GLOBAL COLUMNS-FMT-STRING)" t nil)

(autoload 'org-columns-compute "org-mode/lisp/org-colview" "\
Summarize the values of PROPERTY hierarchically.
Also update existing values for PROPERTY according to the first
column specification.

\(fn PROPERTY)" t nil)

(autoload 'org-dblock-write:columnview "org-mode/lisp/org-colview" "\
Write the column view table.
PARAMS is a property list of parameters:

:id       the :ID: property of the entry where the columns view
    should be built.  When the symbol `local', call locally.
    When `global' call column view with the cursor at the beginning
    of the buffer (usually this means that the whole buffer switches
    to column view).  When \"file:path/to/file.org\", invoke column
    view at the start of that file.  Otherwise, the ID is located
    using `org-id-find'.
:hlines   When t, insert a hline before each item.  When a number, insert
    a hline before each level <= that number.
:indent   When non-nil, indent each ITEM field according to its level.
:vlines   When t, make each column a colgroup to enforce vertical lines.
:maxlevel When set to a number, don't capture headlines below this level.
:skip-empty-rows
    When t, skip rows where all specifiers other than ITEM are empty.
:width    apply widths specified in columns format using <N> specifiers.
:format   When non-nil, specify the column view format to use.

\(fn PARAMS)" nil nil)

(autoload 'org-columns-insert-dblock "org-mode/lisp/org-colview" "\
Create a dynamic block capturing a column view table.

\(fn)" t nil)

(autoload 'org-agenda-columns "org-mode/lisp/org-colview" "\
Turn on or update column view in the agenda.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "org-mode/lisp/org-compat" "org-mode/lisp/org-compat.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/lisp/org-compat.el

(autoload 'org-check-version "org-mode/lisp/org-compat" "\
Try very hard to provide sensible version strings.

\(fn)" nil t)

;;;***

;;;### (autoloads nil "org-mode/lisp/org-lint" "org-mode/lisp/org-lint.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/lisp/org-lint.el

(autoload 'org-lint "org-mode/lisp/org-lint" "\
Check current Org buffer for syntax mistakes.

By default, run all checkers.  With a single prefix ARG \\[universal-argument],
select one category of checkers only.  With a double prefix
\\[universal-argument] \\[universal-argument], select one precise checker by its name.

ARG can also be a list of checker names, as symbols, to run.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "org-mode/lisp/org-macs" "org-mode/lisp/org-macs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/lisp/org-macs.el

(autoload 'org-load-noerror-mustsuffix "org-mode/lisp/org-macs" "\
Load FILE with optional arguments NOERROR and MUSTSUFFIX.

\(fn FILE)" nil t)

;;;***

;;;### (autoloads nil "org-mode/lisp/org-version" "org-mode/lisp/org-version.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-mode/lisp/org-version.el

(autoload 'org-release "org-mode/lisp/org-version" "\
The release version of org-mode.
  Inserted by installing org-mode or when a release is made.

\(fn)" nil nil)

(autoload 'org-git-version "org-mode/lisp/org-version" "\
The Git version of org-mode.
  Inserted by installing org-mode or when a release is made.

\(fn)" nil nil)

(defvar org-odt-data-dir "/usr/share/emacs/etc/org" "\
The location of ODT styles.")

;;;***

;;;### (autoloads nil "packed/packed" "packed/packed.el" (0 0 0 0))
;;; Generated autoloads from packed/packed.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "packed/packed" '("packed-")))

;;;***

;;;### (autoloads nil "pangu-spacing/pangu-spacing" "pangu-spacing/pangu-spacing.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pangu-spacing/pangu-spacing.el

(autoload 'pangu-spacing-mode "pangu-spacing/pangu-spacing" "\
Toggle pangu-spacing-mode

\(fn &optional ARG)" t nil)

(defvar global-pangu-spacing-mode nil "\
Non-nil if Global Pangu-Spacing mode is enabled.
See the `global-pangu-spacing-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-pangu-spacing-mode'.")

(custom-autoload 'global-pangu-spacing-mode "pangu-spacing/pangu-spacing" nil)

(autoload 'global-pangu-spacing-mode "pangu-spacing/pangu-spacing" "\
Toggle Pangu-Spacing mode in all buffers.
With prefix ARG, enable Global Pangu-Spacing mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Pangu-Spacing mode is enabled in all buffers where
`pangu-spacing-mode' would do it.
See `pangu-spacing-mode' for more information on Pangu-Spacing mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "paredit/paredit" "paredit/paredit.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from paredit/paredit.el

(autoload 'paredit-mode "paredit/paredit" "\
Minor mode for pseudo-structurally editing Lisp code.
With a prefix argument, enable Paredit Mode even if there are
  unbalanced parentheses in the buffer.
Paredit behaves badly if parentheses are unbalanced, so exercise
  caution when forcing Paredit Mode to be enabled, and consider
  fixing unbalanced parentheses instead.
\\<paredit-mode-map>

\(fn &optional ARG)" t nil)

(autoload 'enable-paredit-mode "paredit/paredit" "\
Turn on pseudo-structural editing of Lisp code.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-annot" "pdf-tools/lisp/pdf-annot.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-annot.el

(autoload 'pdf-annot-minor-mode "pdf-tools/lisp/pdf-annot" "\
Support for PDF Annotations.

\\{pdf-annot-minor-mode-map}

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-annot" '("pdf-annot-")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-cache" "pdf-tools/lisp/pdf-cache.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-cache.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-cache" '("page" "pdf-cache-" "textregions" "boundingbox" "define-pdf-cache-function")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-dev" "pdf-tools/lisp/pdf-dev.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-dev.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-dev" '("pdf-dev-")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-history" "pdf-tools/lisp/pdf-history.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-history.el

(autoload 'pdf-history-minor-mode "pdf-tools/lisp/pdf-history" "\
Keep a history of previously visited pages.

This is a simple stack-based history.  Turning the page or
following a link pushes the left-behind page on the stack, which
may be naviagted with the following keys.

\\{pdf-history-minor-mode-map}

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-history" '("pdf-history-")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-info" "pdf-tools/lisp/pdf-info.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-info.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-info" '("pdf-info-")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-isearch" "pdf-tools/lisp/pdf-isearch.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-isearch.el

(autoload 'pdf-isearch-minor-mode "pdf-tools/lisp/pdf-isearch" "\
Isearch mode for PDF buffer.

When this mode is enabled \\[isearch-forward], among other keys,
starts an incremental search in this PDF document.  Since this mode
uses external programs to highlight found matches via
image-processing, proceeding to the next match may be slow.

Therefore two isearch behaviours have been defined: Normal isearch and
batch mode.  The later one is a minor mode
\(`pdf-isearch-batch-mode'), which when activated inhibits isearch
from stopping at and highlighting every single match, but rather
display them batch-wise.  Here a batch means a number of matches
currently visible in the selected window.

The kind of highlighting is determined by three faces
`pdf-isearch-match' (for the current match), `pdf-isearch-lazy'
\(for all other matches) and `pdf-isearch-batch' (when in batch
mode), which see.

Colors may also be influenced by the minor-mode
`pdf-view-dark-minor-mode'.  If this is minor mode enabled, each face's
dark colors, are used (see e.g. `frame-background-mode'), instead
of the light ones.

\\{pdf-isearch-minor-mode-map}
While in `isearch-mode' the following keys are available. Note
that not every isearch command work as expected.

\\{pdf-isearch-active-mode-map}

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-isearch" '("pdf-isearch-")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-links" "pdf-tools/lisp/pdf-links.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-links.el

(autoload 'pdf-links-minor-mode "pdf-tools/lisp/pdf-links" "\
Handle links in PDF documents.\\<pdf-links-minor-mode-map>

If this mode is enabled, most links in the document may be
activated by clicking on them or by pressing \\[pdf-links-action-perform] and selecting
one of the displayed keys, or by using isearch limited to
links via \\[pdf-links-isearch-link].

\\{pdf-links-minor-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'pdf-links-action-perform "pdf-tools/lisp/pdf-links" "\
Follow LINK, depending on its type.

This may turn to another page, switch to another PDF buffer or
invoke `pdf-links-browse-uri-function'.

Interactively, link is read via `pdf-links-read-link-action'.
This function displays characters around the links in the current
page and starts reading characters (ignoring case).  After a
sufficient number of characters have been read, the corresponding
link's link is invoked.  Additionally, SPC may be used to
scroll the current page.

\(fn LINK)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-links" '("pdf-links-")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-misc" "pdf-tools/lisp/pdf-misc.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-misc.el

(autoload 'pdf-misc-minor-mode "pdf-tools/lisp/pdf-misc" "\
FIXME:  Not documented.

\(fn &optional ARG)" t nil)

(autoload 'pdf-misc-size-indication-minor-mode "pdf-tools/lisp/pdf-misc" "\
Provide a working size indication in the mode-line.

\(fn &optional ARG)" t nil)

(autoload 'pdf-misc-menu-bar-minor-mode "pdf-tools/lisp/pdf-misc" "\
Display a PDF Tools menu in the menu-bar.

\(fn &optional ARG)" t nil)

(autoload 'pdf-misc-context-menu-minor-mode "pdf-tools/lisp/pdf-misc" "\
Provide a right-click context menu in PDF buffers.

\\{pdf-misc-context-menu-minor-mode-map}

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-misc" '("pdf-misc-")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-occur" "pdf-tools/lisp/pdf-occur.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-occur.el

(autoload 'pdf-occur "pdf-tools/lisp/pdf-occur" "\
List lines matching STRING or PCRE.

Interactively search for a regexp. Unless a prefix arg was given,
in which case this functions performs a string search.

If `pdf-occur-prefer-string-search' is non-nil, the meaning of
the prefix-arg is inverted.

\(fn STRING &optional REGEXP-P)" t nil)

(autoload 'pdf-occur-multi-command "pdf-tools/lisp/pdf-occur" "\
Perform `pdf-occur' on multiple buffer.

For a programmatic search of multiple documents see
`pdf-occur-search'.

\(fn)" t nil)

(defvar pdf-occur-global-minor-mode nil "\
Non-nil if Pdf-Occur-Global minor mode is enabled.
See the `pdf-occur-global-minor-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pdf-occur-global-minor-mode'.")

(custom-autoload 'pdf-occur-global-minor-mode "pdf-tools/lisp/pdf-occur" nil)

(autoload 'pdf-occur-global-minor-mode "pdf-tools/lisp/pdf-occur" "\
Enable integration of Pdf Occur with other modes.

This global minor mode enables (or disables)
`pdf-occur-ibuffer-minor-mode' and `pdf-occur-dired-minor-mode'
in all current and future ibuffer/dired buffer.

\(fn &optional ARG)" t nil)

(autoload 'pdf-occur-ibuffer-minor-mode "pdf-tools/lisp/pdf-occur" "\
Hack into ibuffer's do-occur binding.

This mode remaps `ibuffer-do-occur' to
`pdf-occur-ibuffer-do-occur', which will start the PDF Tools
version of `occur', if all marked buffer's are in `pdf-view-mode'
and otherwise fallback to `ibuffer-do-occur'.

\(fn &optional ARG)" t nil)

(autoload 'pdf-occur-dired-minor-mode "pdf-tools/lisp/pdf-occur" "\
Hack into dired's `dired-do-search' binding.

This mode remaps `dired-do-search' to
`pdf-occur-dired-do-search', which will start the PDF Tools
version of `occur', if all marked buffer's are in `pdf-view-mode'
and otherwise fallback to `dired-do-search'.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-occur" '("pdf-occur-")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-outline" "pdf-tools/lisp/pdf-outline.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-outline.el

(autoload 'pdf-outline-minor-mode "pdf-tools/lisp/pdf-outline" "\
Display an outline of a PDF document.

This provides a PDF's outline on the menu bar via imenu.
Additionally the same outline may be viewed in a designated
buffer.

\\{pdf-outline-minor-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'pdf-outline "pdf-tools/lisp/pdf-outline" "\
Display an PDF outline of BUFFER.

BUFFER defaults to the current buffer.  Select the outline
buffer, unless NO-SELECT-WINDOW-P is non-nil.

\(fn &optional BUFFER NO-SELECT-WINDOW-P)" t nil)

(autoload 'pdf-outline-imenu-enable "pdf-tools/lisp/pdf-outline" "\
Enable imenu in the current PDF buffer.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-outline" '("pdf-outline")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-sync" "pdf-tools/lisp/pdf-sync.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-sync.el

(autoload 'pdf-sync-minor-mode "pdf-tools/lisp/pdf-sync" "\
Correlate a PDF position with the TeX file.
\\<pdf-sync-minor-mode-map>
This works via SyncTeX, which means the TeX sources need to have
been compiled with `--synctex=1'.  In AUCTeX this can be done by
setting `TeX-source-correlate-method' to 'synctex (before AUCTeX
is loaded) and enabling `TeX-source-correlate-mode'.

Then \\[pdf-sync-backward-search-mouse] in the PDF buffer will open the
corresponding TeX location.

If AUCTeX is your preferred tex-mode, this library arranges to
bind `pdf-sync-forward-display-pdf-key' (the default is `C-c C-g')
to `pdf-sync-forward-search' in `TeX-source-correlate-map'.  This
function displays the PDF page corresponding to the current
position in the TeX buffer.  This function only works together
with AUCTeX.

\(fn &optional ARG)" t nil)

(define-obsolete-variable-alias 'pdf-sync-tex-display-pdf-key 'pdf-sync-forward-display-pdf-key nil)

(define-obsolete-variable-alias 'pdf-sync-goto-tex-hook 'pdf-sync-backward-hook nil)

(define-obsolete-variable-alias 'pdf-sync-display-pdf-hook 'pdf-sync-forward-hook nil)

(define-obsolete-variable-alias 'pdf-sync-display-pdf-action 'pdf-sync-forward-display-action nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-sync" '("pdf-sync-")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-tools" "pdf-tools/lisp/pdf-tools.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-tools.el

(defvar pdf-tools-handle-upgrades t "\
Whether PDF Tools should handle upgrading itself.")

(custom-autoload 'pdf-tools-handle-upgrades "pdf-tools/lisp/pdf-tools" t)

(when (and pdf-tools-handle-upgrades (boundp 'pdf-info-epdfinfo-program) (stringp pdf-info-epdfinfo-program) (boundp 'package-user-dir) (stringp package-user-dir) (stringp load-file-name)) (let* ((package-dir (file-name-directory load-file-name)) (server-dir (file-name-directory pdf-info-epdfinfo-program)) (upgrading-p (and (not (file-equal-p package-dir server-dir)) (file-in-directory-p package-dir package-user-dir) (file-in-directory-p server-dir package-user-dir) (file-executable-p pdf-info-epdfinfo-program)))) (when upgrading-p (require 'cl-lib) (when (cl-some (lambda (buffer) (and (eq 'pdf-view-mode (buffer-local-value 'major-mode buffer)) (buffer-modified-p buffer))) (buffer-list)) (when (y-or-n-p (concat "Warning: Upgrading will abandon ALL pdf modifications," "save some of them ?")) (save-some-buffers nil (lambda nil (and (eq 'pdf-view-mode major-mode) (buffer-modified-p)))))) (dolist (buffer (buffer-list)) (with-current-buffer buffer (when (eq major-mode 'pdf-view-mode) (set-buffer-modified-p nil) (fundamental-mode) (let ((ov (make-overlay (point-min) (point-max)))) (overlay-put ov 'pdf-view t) (overlay-put ov 'display "Recompiling, stand by..."))))) (pdf-info-quit) (setq pdf-info-epdfinfo-program (expand-file-name "epdfinfo" package-dir)) (let ((build-hook (make-symbol "pdf-tools--upgrade"))) (fset build-hook `(lambda nil (remove-hook 'post-command-hook ',build-hook) (let ((load-path (cons ,package-dir load-path)) (elc (directory-files ,package-dir nil "\\.elc\\'"))) (let ((load-suffixes '(".el"))) (dolist (file elc) (load (file-name-sans-extension file)))) (byte-recompile-directory ,package-dir 0 t) (dolist (file elc) (load file))) (pdf-tools-install 'compile 'skip-deps 'no-error))) (add-hook 'post-command-hook build-hook)))))

(autoload 'pdf-tools--melpa-build-server "pdf-tools/lisp/pdf-tools" "\
Compile the epdfinfo program in BUILD-DIRECTORY.

This is a helper function when installing via melpa.

Don't try to install dependencies if SKIP-DEPENDENCIES-P is non-nil.

CALLBACK may be a function, which will be locally put on
`compilation-finish-functions', which see.

\(fn &optional BUILD-DIRECTORY SKIP-DEPENDENCIES-P CALLBACK)" nil nil)

(autoload 'pdf-tools-enable-minor-modes "pdf-tools/lisp/pdf-tools" "\
Enable MODES in the current buffer.

MODES defaults to `pdf-tools-enabled-modes'.

\(fn &optional MODES)" t nil)

(autoload 'pdf-tools-install "pdf-tools/lisp/pdf-tools" "\
Install PDF-Tools in all current and future PDF buffers.

See `pdf-view-mode' and `pdf-tools-enabled-modes'.

\(fn &optional FORCE-COMPILE-P SKIP-DEPENDENCIES-P NO-ERROR)" t nil)

(autoload 'pdf-tools-help "pdf-tools/lisp/pdf-tools" "\


\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-tools" '("pdf-tools-")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-util" "pdf-tools/lisp/pdf-util.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-util.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-util" '("pdf-util-" "display-buffer-split-below-and-attach")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-view" "pdf-tools/lisp/pdf-view.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-view.el

(autoload 'pdf-view-bookmark-jump-handler "pdf-tools/lisp/pdf-view" "\
The bookmark handler-function interface for PDF bookmarks.

See also `pdf-view-bookmark-make-record'.

\(fn BMK)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-view" '("pdf-view-")))

;;;***

;;;### (autoloads nil "pdf-tools/lisp/pdf-virtual" "pdf-tools/lisp/pdf-virtual.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pdf-tools/lisp/pdf-virtual.el

(autoload 'pdf-virtual-edit-mode "pdf-tools/lisp/pdf-virtual" "\
Major mode when editing a virtual PDF buffer.

\(fn)" t nil)

(autoload 'pdf-virtual-view-mode "pdf-tools/lisp/pdf-virtual" "\
Major mode in virtual PDF buffers.

\(fn)" t nil)

(defvar pdf-virtual-global-minor-mode nil "\
Non-nil if Pdf-Virtual-Global minor mode is enabled.
See the `pdf-virtual-global-minor-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pdf-virtual-global-minor-mode'.")

(custom-autoload 'pdf-virtual-global-minor-mode "pdf-tools/lisp/pdf-virtual" nil)

(autoload 'pdf-virtual-global-minor-mode "pdf-tools/lisp/pdf-virtual" "\
Enable recognition and handling of VPDF files.

\(fn &optional ARG)" t nil)

(autoload 'pdf-virtual-buffer-create "pdf-tools/lisp/pdf-virtual" "\


\(fn &optional FILENAMES BUFFER-NAME DISPLAY-P)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools/lisp/pdf-virtual" '("pdf-virtual-")))

;;;***

;;;### (autoloads nil "pkg-info/pkg-info" "pkg-info/pkg-info.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg-info/pkg-info.el

(autoload 'pkg-info-library-original-version "pkg-info/pkg-info" "\
Get the original version in the header of LIBRARY.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no X-Original-Version
header.

See Info node `(elisp)Library Headers' for more information
about library headers.

\(fn LIBRARY &optional SHOW)" t nil)

(autoload 'pkg-info-library-version "pkg-info/pkg-info" "\
Get the version in the header of LIBRARY.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no proper header.

See Info node `(elisp)Library Headers' for more information
about library headers.

\(fn LIBRARY &optional SHOW)" t nil)

(autoload 'pkg-info-defining-library-original-version "pkg-info/pkg-info" "\
Get the original version of the library defining FUNCTION.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

\(fn FUNCTION &optional SHOW)" t nil)

(autoload 'pkg-info-defining-library-version "pkg-info/pkg-info" "\
Get the version of the library defining FUNCTION.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

\(fn FUNCTION &optional SHOW)" t nil)

(autoload 'pkg-info-package-version "pkg-info/pkg-info" "\
Get the version of an installed PACKAGE.

If SHOW is non-nil, show the version in the minibuffer.

Return the version as list, or nil if PACKAGE is not installed.

\(fn PACKAGE &optional SHOW)" t nil)

(autoload 'pkg-info-version-info "pkg-info/pkg-info" "\
Obtain complete version info for LIBRARY and PACKAGE.

LIBRARY is a symbol denoting a named feature, or a library name
as string.  PACKAGE is a symbol denoting an ELPA package.  If
omitted or nil, default to LIBRARY.

If SHOW is non-nil, show the version in the minibuffer.

When called interactively, prompt for LIBRARY.  When called
interactively with prefix argument, prompt for PACKAGE as well.

Return a string with complete version information for LIBRARY.
This version information contains the version from the headers of
LIBRARY, and the version of the installed PACKAGE, the LIBRARY is
part of.  If PACKAGE is not installed, or if the PACKAGE version
is the same as the LIBRARY version, do not include a package
version.

\(fn LIBRARY &optional PACKAGE SHOW)" t nil)

;;;***

;;;### (autoloads nil "popwin/popwin" "popwin/popwin.el" (0 0 0 0))
;;; Generated autoloads from popwin/popwin.el

(autoload 'popwin:popup-buffer "popwin/popwin" "\
Show BUFFER in a popup window and return the popup window. If
NOSELECT is non-nil, the popup window will not be selected. If
STICK is non-nil, the popup window will be stuck. If TAIL is
non-nil, the popup window will show the last contents. Calling
`popwin:popup-buffer' during `popwin:popup-buffer' is allowed. In
that case, the buffer of the popup window will be replaced with
BUFFER.

\(fn BUFFER &key (width popwin:popup-window-width) (height popwin:popup-window-height) (position popwin:popup-window-position) NOSELECT DEDICATED STICK TAIL)" t nil)

(autoload 'popwin:display-buffer "popwin/popwin" "\
Display BUFFER-OR-NAME, if possible, in a popup window, or as
usual. This function can be used as a value of
`display-buffer-function'.

\(fn BUFFER-OR-NAME &optional NOT-THIS-WINDOW)" t nil)

(autoload 'popwin:pop-to-buffer "popwin/popwin" "\
Same as `pop-to-buffer' except that this function will use
`popwin:display-buffer-1' instead of `display-buffer'.

\(fn BUFFER &optional OTHER-WINDOW NORECORD)" t nil)

(autoload 'popwin:universal-display "popwin/popwin" "\
Call the following command interactively with letting
`popwin:special-display-config' be
`popwin:universal-display-config'. This will be useful when
displaying buffers in popup windows temporarily.

\(fn)" t nil)

(autoload 'popwin:one-window "popwin/popwin" "\
Delete other window than the popup window. C-g restores the
original window configuration.

\(fn)" t nil)

(autoload 'popwin:popup-buffer-tail "popwin/popwin" "\
Same as `popwin:popup-buffer' except that the buffer will be
`recenter'ed at the bottom.

\(fn &rest SAME-AS-POPWIN:POPUP-BUFFER)" t nil)

(autoload 'popwin:find-file "popwin/popwin" "\
Edit file FILENAME with popup window by `popwin:popup-buffer'.

\(fn FILENAME &optional WILDCARDS)" t nil)

(autoload 'popwin:find-file-tail "popwin/popwin" "\
Edit file FILENAME with popup window by
`popwin:popup-buffer-tail'.

\(fn FILE &optional WILDCARD)" t nil)

(autoload 'popwin:messages "popwin/popwin" "\
Display *Messages* buffer in a popup window.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "puppet-mode/puppet-mode" "puppet-mode/puppet-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from puppet-mode/puppet-mode.el

(autoload 'puppet-mode "puppet-mode/puppet-mode" "\


\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))

;;;***

;;;### (autoloads nil "queue/queue" "queue/queue.el" (0 0 0 0))
;;; Generated autoloads from queue/queue.el

(defalias 'make-queue 'queue-create "\
Create an empty queue data structure.")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "queue/queue" '("queue")))

;;;***

;;;### (autoloads nil "rainbow-delimiters/rainbow-delimiters" "rainbow-delimiters/rainbow-delimiters.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from rainbow-delimiters/rainbow-delimiters.el

(autoload 'rainbow-delimiters-mode "rainbow-delimiters/rainbow-delimiters" "\
Highlight nested parentheses, brackets, and braces according to their depth.

\(fn &optional ARG)" t nil)

(autoload 'rainbow-delimiters-mode-enable "rainbow-delimiters/rainbow-delimiters" "\
Enable `rainbow-delimiters-mode'.

\(fn)" nil nil)

(autoload 'rainbow-delimiters-mode-disable "rainbow-delimiters/rainbow-delimiters" "\
Disable `rainbow-delimiters-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "rainbow-mode/rainbow-mode" "rainbow-mode/rainbow-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from rainbow-mode/rainbow-mode.el

(autoload 'rainbow-mode "rainbow-mode/rainbow-mode" "\
Colorize strings that represent colors.
This will fontify with colors the string like \"#aabbcc\" or \"blue\".

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "rainbow-mode/rainbow-mode" '("rainbow-")))

;;;***

;;;### (autoloads nil "revive/revive" "revive/revive.el" (0 0 0 0))
;;; Generated autoloads from revive/revive.el

(autoload 'current-window-configuration-printable "revive/revive" "\
Return the printable current-window-configuration.
This configuration will be stored by restore-window-configuration.
Returned configurations are list of:
'(Screen-Width Screen-Height Edge-List Buffer-List)

Edge-List is a return value of revive:all-window-edges, list of all
window-edges whose first member is always of north west window.

Buffer-List is a list of buffer property list of all windows.  This
property lists are stored in order corresponding to Edge-List.  Buffer
property list is formed as
'((buffer-file-name) (buffer-name) (point) (window-start)).

\(fn)" nil nil)

(autoload 'restore-window-configuration "revive/revive" "\
Restore the window configuration.
Configuration CONFIG should be created by
current-window-configuration-printable.

\(fn CONFIG)" nil nil)

(autoload 'wipe "revive/revive" "\
Wipe Emacs.

\(fn)" t nil)

(autoload 'save-current-configuration "revive/revive" "\
Save current window/buffer configuration into configuration file.

\(fn &optional NUM)" t nil)

(autoload 'resume "revive/revive" "\
Resume window/buffer configuration.
Configuration should be saved by save-current-configuration.

\(fn &optional NUM)" t nil)

;;;***

;;;### (autoloads nil "seqcmd/seqcmd" "seqcmd/seqcmd.el" (0 0 0 0))
;;; Generated autoloads from seqcmd/seqcmd.el

(autoload 'seqcmd-home "seqcmd")

(autoload 'seqcmd-end "seqcmd")

(autoload 'seqcmd-upcase-backward-word "seqcmd")

(autoload 'seqcmd-capitalize-backward-word "seqcmd")

(autoload 'seqcmd-downcase-backward-word "seqcmd")

(autoload 'seqcmd-setup-keys "seqcmd/seqcmd" "\
Rebind C-a, C-e, M-u, M-c, and M-l to seqcmd-* commands.
If you use `org-mode', rebind C-a and C-e.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "seqcmd/seqcmd" '("seqcmd-")))

;;;***

;;;### (autoloads nil "smtpmail-multi/smtpmail-multi" "smtpmail-multi/smtpmail-multi.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from smtpmail-multi/smtpmail-multi.el

(autoload 'smtpmail-multi-change "smtpmail-multi/smtpmail-multi" "\
Change the smtp settings to match the settings for ACCOUNT in `smtpmail-multi-accounts'.

\(fn ACCOUNT)" nil nil)

(autoload 'smtpmail-multi-get-accounts "smtpmail-multi/smtpmail-multi" "\
Returns the SMTP accounts associated with the current buffer according to `smtpmail-multi-associations'.
The account details associated with each account name are stored in `smtpmail-multi-accounts'.
If there is no SMTP account associated with the current buffer, return `smtpmail-multi-default-account'
instead.

\(fn)" nil nil)

(autoload 'smtpmail-multi-send-it "smtpmail-multi/smtpmail-multi" "\
Send mail using smtp server selected by the `smtpmail-multi-select' function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "tablist/tablist" "tablist/tablist.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from tablist/tablist.el

(autoload 'tablist-minor-mode "tablist/tablist" "\
Toggle Tablist minor mode on or off.
With a prefix argument ARG, enable Tablist minor mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{tablist-minor-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'tablist-mode "tablist/tablist" "\


\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tablist/tablist" '("tablist-")))

;;;***

;;;### (autoloads nil "tablist/tablist-filter" "tablist/tablist-filter.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tablist/tablist-filter.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tablist/tablist-filter" '("tablist-filter-")))

;;;***

;;;### (autoloads nil "twittering-mode/twittering-mode" "twittering-mode/twittering-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from twittering-mode/twittering-mode.el

(autoload 'twit "twittering-mode/twittering-mode" "\
Start twittering-mode.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "twittering-mode/twittering-mode" '("twittering-" "debug-print" "case-string" "list-push" "assocref")))

;;;***

;;;### (autoloads nil "undo-tree/undo-tree" "undo-tree/undo-tree.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from undo-tree/undo-tree.el

(autoload 'undo-tree-mode "undo-tree/undo-tree" "\
Toggle undo-tree mode.
With no argument, this command toggles the mode.
A positive prefix argument turns the mode on.
A negative prefix argument turns it off.

Undo-tree-mode replaces Emacs' standard undo feature with a more
powerful yet easier to use version, that treats the undo history
as what it is: a tree.

The following keys are available in `undo-tree-mode':

  \\{undo-tree-map}

Within the undo-tree visualizer, the following keys are available:

  \\{undo-tree-visualizer-mode-map}

\(fn &optional ARG)" t nil)

(defvar global-undo-tree-mode nil "\
Non-nil if Global Undo-Tree mode is enabled.
See the `global-undo-tree-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-undo-tree-mode'.")

(custom-autoload 'global-undo-tree-mode "undo-tree/undo-tree" nil)

(autoload 'global-undo-tree-mode "undo-tree/undo-tree" "\
Toggle Undo-Tree mode in all buffers.
With prefix ARG, enable Global Undo-Tree mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Undo-Tree mode is enabled in all buffers where
`turn-on-undo-tree-mode' would do it.
See `undo-tree-mode' for more information on Undo-Tree mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "vimrc-mode/vimrc-mode" "vimrc-mode/vimrc-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vimrc-mode/vimrc-mode.el
 (add-to-list 'auto-mode-alist '("\\.vim\\'" . vimrc-mode))
 (add-to-list 'auto-mode-alist '("[._]?g?vimrc\\'" . vimrc-mode))
 (add-to-list 'auto-mode-alist '("\\.exrc\\'" . vimrc-mode))

(autoload 'vimrc-mode "vimrc-mode/vimrc-mode" "\
Major mode for editing `vimrc', `xxx.vim' and `.exrc' configuration files.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "visual-fill-column/visual-fill-column" "visual-fill-column/visual-fill-column.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from visual-fill-column/visual-fill-column.el

(autoload 'visual-fill-column-mode "visual-fill-column/visual-fill-column" "\
Wrap lines according to `fill-column' in `visual-line-mode'.

\(fn &optional ARG)" t nil)

(defvar global-visual-fill-column-mode nil "\
Non-nil if Global Visual-Fill-Column mode is enabled.
See the `global-visual-fill-column-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-visual-fill-column-mode'.")

(custom-autoload 'global-visual-fill-column-mode "visual-fill-column/visual-fill-column" nil)

(autoload 'global-visual-fill-column-mode "visual-fill-column/visual-fill-column" "\
Toggle Visual-Fill-Column mode in all buffers.
With prefix ARG, enable Global Visual-Fill-Column mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Visual-Fill-Column mode is enabled in all buffers where
`turn-on-visual-fill-column-mode' would do it.
See `visual-fill-column-mode' for more information on Visual-Fill-Column mode.

\(fn &optional ARG)" t nil)

(autoload 'visual-fill-column-split-window-sensibly "visual-fill-column/visual-fill-column" "\
Split WINDOW sensibly, unsetting its margins first.
This function unsets the window margins and calls
`split-window-sensibly'.

By default, `split-window-sensibly' does not split a window
vertically if it has wide margins, even if there is enough space
for a vertical split.  This function can be used as the value of
`split-window-preferred-function' to enable vertically splitting
windows with wide margins.

\(fn &optional WINDOW)" nil nil)

;;;***

;;;### (autoloads nil "web/web" "web/web.el" (0 0 0 0))
;;; Generated autoloads from web/web.el

(autoload 'web-http-call "web/web" "\
Make an HTTP method to the URL or the HOST, PORT, PATH and send DATA.

If URL is specified then it takes precedence over SECURE, HOST,
PORT and PATH.  URL may be HTTP or HTTPS.

Important note: any query in URL is currently IGNORED!

SECURE is `nil' by default but if `t' then SSL is used.

PORT is 80 by default.  Even if SECURE it `t'.  If you manually
specify SECURE you should manually specify PORT to be 443.  Using
URL negates the need for that, an SSL URL will work correctly.

The URL connected to (whether specified by URL or by the HOST and
PORT) is recorded on the resulting connection as the process
property `:web-url'.

EXTRA-HEADERS is an alist or a hash-table of extra headers to
send to the server.

The full set of headers sent to the server is recorded on the
connection with the process property `:web-headers'.

DATA is of MIME-TYPE.  We try to interpret DATA and MIME-TYPE
usefully:

If MIME-TYPE is `application/form-www-url-encoded' then
`web-to-query-string' is used to to format the DATA into a POST
body.

If MIME-TYPE is `multipart/form-data' then `web-to-multipart' is
called to get a POST body.

Any data sent to the server is recorded on the connection with
the process property `:web-sent'.

When the request comes back the CALLBACK is called.  CALLBACK is
always passed 3 arguments: the HTTP connection which is a process
object, the HTTP header which is a `hash-table' and `data', which
is normally a string.  `data' depends somewhat on the context.
See below.

MODE defines what it means for the request to cause the CALLBACK
to be fired.  When MODE is `stream' then the CALLBACK is called
for every chunk of data received after the header has arrived.
This allows streaming data to somewhere else; hence `stream'
mode.  In this mode CALLBACK's `data' argument is a single chunk
of the stream or `:done' when the stream ends.

The default MODE is `batch' which collects all the data from the
response before calling CALLBACK with all the data as a string.

\(fn METHOD CALLBACK &key URL (HOST \"localhost\") (PORT 80) SECURE (PATH \"/\") EXTRA-HEADERS DATA (MIME-TYPE web/request-mimetype) (MODE \\='batch) LOGGING)" nil nil)

(autoload 'web-http-get "web/web" "\
Make a GET calling CALLBACK with the result.

For information on URL or PATH, HOST, PORT and also EXTRA-HEADERS
and MODE see `web-http-call'.

The callback probably won't work unless you set `lexical-binding'
to `t'.

\(fn CALLBACK &key URL (HOST \"localhost\") (PORT 80) (PATH \"/\") EXTRA-HEADERS (MODE \\='batch) (LOGGING t))" nil nil)

(autoload 'web-http-post "web/web" "\
Make a POST and call CALLBACK with the result.

For information on URL or PATH, HOST, PORT and also MODE see
`web-http-call'.

The callback probably won't work unless you set `lexical-binding'
to `t'.

\(fn CALLBACK &key URL (HOST \"localhost\") (PORT 80) (PATH \"/\") EXTRA-HEADERS DATA (MIME-TYPE web/request-mimetype) (MODE \\='batch) (LOGGING t))" nil nil)

(autoload 'web-json-post "web/web" "\
POST DATA to URL expecting a JSON response sent to CALLBACK.

See `web-json-expected-mimetypes-list' for the list of Mime Types
we accept JSON for.  This may be let bound.  If the expectation
is not met then EXPECTATION-FAILURE-CALLBACK is called being
passed the CALLBACK parameters.  By default
EXPECTATION-FAILURE-CALLBACK is
`web-json-default-expectation-failure'.

The CALLBACK is called as:

  CALLBACK RESPONSE-DATA HTTPCON RESPONSE-HEADER

so the function may be defined like this:

  (lambda (data &rest stuff) ...)

HEADERS may be specified, these are treated as extra-headers to
be sent with the request.

The DATA is sent as `application/x-www-form-urlencoded' by
default, MIME-TYPE can change that.

JSON-ARRAY-TYPE, JSON-OBJECT-TYPE and JSON-KEY-TYPE, if present,
are used to let bind the `json-read' variables of the same name
affecting the resulting lisp structure.

\(fn CALLBACK &key URL DATA HEADERS (MIME-TYPE web/request-mimetype) (LOGGING t) (JSON-ARRAY-TYPE json-array-type) (JSON-OBJECT-TYPE json-object-type) (JSON-KEY-TYPE json-key-type) (EXPECTATION-FAILURE-CALLBACK \\='web-json-default-expectation-failure))" nil nil)

(autoload 'web-get "web/web" "\
Get the specified URL into the BUFFER.

\(fn URL &optional BUFFER)" t nil)

;;;***

;;;### (autoloads nil "windows/windows" "windows/windows.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from windows/windows.el

(autoload 'win-switch-to-window "windows/windows" "\
Switch window configurations to a buffer specified by keyboard.
If calling from program, optional second argument WINDOW can specify
the window number.

\(fn ARG &optional WINDOW)" t nil)

(autoload 'win:set-wc "windows/windows" "\
(Windows low level internal) Set the NUM-th windows configuration.
If Windows uses frame(Emacs 19), Select the NUM-th window frame.

\(fn NUM)" nil nil)

(autoload 'win:startup-with-window "windows/windows" "\
Start up Emacs with window[1] selected.

\(fn)" nil nil)

(autoload 'win-save-all-configurations "windows/windows" "\
Save all window configurations into the configuration file.

\(fn)" t nil)

(autoload 'wipe-windows "windows/windows" "\
Kill all buffers.  Optional argument NO-ASK non-nil skips query.

\(fn &optional NO-ASK)" t nil)

(autoload 'win-load-all-configurations "windows/windows" "\
Load all window configurations from the configuration file.
Non-nil for optional argument PRESERVE keeps all current buffers.

\(fn &optional PRESERVE)" t nil)

(autoload 'see-you-again "windows/windows" "\
Save all of the window configurations and kill-emacs.

\(fn)" t nil)

(autoload 'resume-windows "windows/windows" "\
Restore all window configurations reading configurations from a file.
Non-nil for optional argument PRESERVE keeps current buffers.

\(fn &optional PRESERVE)" t nil)

;;;***

;;;### (autoloads nil "yaml-mode/yaml-mode" "yaml-mode/yaml-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from yaml-mode/yaml-mode.el

(let ((loads (get 'yaml 'custom-loads))) (if (member '"yaml-mode/yaml-mode" loads) nil (put 'yaml 'custom-loads (cons '"yaml-mode/yaml-mode" loads))))

(autoload 'yaml-mode "yaml-mode/yaml-mode" "\
Simple mode to edit YAML.

\\{yaml-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.e?ya?ml\\'" . yaml-mode))

;;;***

;;;### (autoloads nil "yatemplate/yatemplate" "yatemplate/yatemplate.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from yatemplate/yatemplate.el

(defvar yatemplate-dir (locate-user-emacs-file "templates") "\
The directory containing file templates.")

(custom-autoload 'yatemplate-dir "yatemplate/yatemplate" t)

(autoload 'yatemplate-fill-alist "yatemplate/yatemplate" "\
Fill `auto-insert-alist'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("ample-regexps/init-tryout.el" "auto-complete/auto-complete-pkg.el"
;;;;;;  "avy/avy-test.el" "buttercup/buttercup-compat.el" "buttercup/buttercup-pkg.el"
;;;;;;  "calfw-gcal/calfw-gcal.el" "company-mode/company-capf.el"
;;;;;;  "company-mode/company-clang.el" "company-mode/company-cmake.el"
;;;;;;  "company-mode/company-eclim.el" "company-mode/company-template.el"
;;;;;;  "company-mode/company-tests.el" "el-get/el-get-autoloading.el"
;;;;;;  "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el" "epl/epl.el"
;;;;;;  "esxml/css-lite.el" "esxml/esxml-form-tests.el" "esxml/esxml-form.el"
;;;;;;  "esxml/esxml-html.el" "esxml/esxml.el" "esxml/esxpath.el"
;;;;;;  "fakir/fakir-tests.el" "fakir/fakir.el" "fuzzy/fuzzy.el"
;;;;;;  "go-mode/go-mode-autoloads.el" "google/google.el" "haskell-mode/haskell-compat.el"
;;;;;;  "haskell-mode/haskell-mode-autoloads.el" "haskell-mode/haskell-mode-pkg.el"
;;;;;;  "irony-mode/irony-diagnostics.el" "irony-mode/irony-snippet.el"
;;;;;;  "jedi/test-jedi.el" "jedi/tryout-jedi.el" "js2-mode/js2-old-indent.el"
;;;;;;  "jstestmacs/jstestmacs.el" "kv/kv-tests.el" "kv/kv.el" "lingr/lingr.el"
;;;;;;  "lispxmp/lispxmp.el" "logalimacs/po-mode-fix.el" "logito/logito.el"
;;;;;;  "lua-mode/init-tryout.el" "magit/lisp/magit-autoloads.el"
;;;;;;  "magit/lisp/magit-core.el" "migemo/migemo.el" "multiple-cursors/mc-cycle-cursors.el"
;;;;;;  "multiple-cursors/multiple-cursors-pkg.el" "multiple-cursors/multiple-cursors.el"
;;;;;;  "myhistory/myhistory.el" "nim-mode/nim-rx.el" "ob-go/ob-go.el"
;;;;;;  "ob-go/test-ob-go.el" "open-junk-file/open-junk-file.el"
;;;;;;  "org-mode/contrib/lisp/ob-eukleides.el" "org-mode/contrib/lisp/ob-fomus.el"
;;;;;;  "org-mode/contrib/lisp/ob-julia.el" "org-mode/contrib/lisp/ob-mathematica.el"
;;;;;;  "org-mode/contrib/lisp/ob-mathomatic.el" "org-mode/contrib/lisp/ob-oz.el"
;;;;;;  "org-mode/contrib/lisp/ob-stata.el" "org-mode/contrib/lisp/ob-tcl.el"
;;;;;;  "org-mode/contrib/lisp/org-bibtex-extras.el" "org-mode/contrib/lisp/org-bookmark.el"
;;;;;;  "org-mode/contrib/lisp/org-checklist.el" "org-mode/contrib/lisp/org-choose.el"
;;;;;;  "org-mode/contrib/lisp/org-collector.el" "org-mode/contrib/lisp/org-contribdir.el"
;;;;;;  "org-mode/contrib/lisp/org-depend.el" "org-mode/contrib/lisp/org-download.el"
;;;;;;  "org-mode/contrib/lisp/org-drill.el" "org-mode/contrib/lisp/org-ebib.el"
;;;;;;  "org-mode/contrib/lisp/org-effectiveness.el" "org-mode/contrib/lisp/org-elisp-symbol.el"
;;;;;;  "org-mode/contrib/lisp/org-eval-light.el" "org-mode/contrib/lisp/org-eval.el"
;;;;;;  "org-mode/contrib/lisp/org-eww.el" "org-mode/contrib/lisp/org-expiry.el"
;;;;;;  "org-mode/contrib/lisp/org-git-link.el" "org-mode/contrib/lisp/org-index.el"
;;;;;;  "org-mode/contrib/lisp/org-interactive-query.el" "org-mode/contrib/lisp/org-invoice.el"
;;;;;;  "org-mode/contrib/lisp/org-learn.el" "org-mode/contrib/lisp/org-license.el"
;;;;;;  "org-mode/contrib/lisp/org-loaddefs.el" "org-mode/contrib/lisp/org-mac-iCal.el"
;;;;;;  "org-mode/contrib/lisp/org-mac-link.el" "org-mode/contrib/lisp/org-mairix.el"
;;;;;;  "org-mode/contrib/lisp/org-man.el" "org-mode/contrib/lisp/org-mew.el"
;;;;;;  "org-mode/contrib/lisp/org-mime.el" "org-mode/contrib/lisp/org-notify.el"
;;;;;;  "org-mode/contrib/lisp/org-notmuch.el" "org-mode/contrib/lisp/org-panel.el"
;;;;;;  "org-mode/contrib/lisp/org-screen.el" "org-mode/contrib/lisp/org-secretary.el"
;;;;;;  "org-mode/contrib/lisp/org-static-mathjax.el" "org-mode/contrib/lisp/org-sudoku.el"
;;;;;;  "org-mode/contrib/lisp/org-velocity.el" "org-mode/contrib/lisp/org-vm.el"
;;;;;;  "org-mode/contrib/lisp/org-wikinodes.el" "org-mode/contrib/lisp/org-wl.el"
;;;;;;  "org-mode/contrib/lisp/orgtbl-sqlinsert.el" "org-mode/contrib/lisp/ox-bibtex.el"
;;;;;;  "org-mode/contrib/lisp/ox-confluence.el" "org-mode/contrib/lisp/ox-deck.el"
;;;;;;  "org-mode/contrib/lisp/ox-extra.el" "org-mode/contrib/lisp/ox-gfm.el"
;;;;;;  "org-mode/contrib/lisp/ox-groff.el" "org-mode/contrib/lisp/ox-s5.el"
;;;;;;  "org-mode/lisp/ob-C.el" "org-mode/lisp/ob-J.el" "org-mode/lisp/ob-R.el"
;;;;;;  "org-mode/lisp/ob-abc.el" "org-mode/lisp/ob-asymptote.el"
;;;;;;  "org-mode/lisp/ob-awk.el" "org-mode/lisp/ob-calc.el" "org-mode/lisp/ob-clojure.el"
;;;;;;  "org-mode/lisp/ob-comint.el" "org-mode/lisp/ob-coq.el" "org-mode/lisp/ob-core.el"
;;;;;;  "org-mode/lisp/ob-css.el" "org-mode/lisp/ob-ditaa.el" "org-mode/lisp/ob-dot.el"
;;;;;;  "org-mode/lisp/ob-ebnf.el" "org-mode/lisp/ob-emacs-lisp.el"
;;;;;;  "org-mode/lisp/ob-eval.el" "org-mode/lisp/ob-exp.el" "org-mode/lisp/ob-forth.el"
;;;;;;  "org-mode/lisp/ob-fortran.el" "org-mode/lisp/ob-gnuplot.el"
;;;;;;  "org-mode/lisp/ob-groovy.el" "org-mode/lisp/ob-haskell.el"
;;;;;;  "org-mode/lisp/ob-io.el" "org-mode/lisp/ob-java.el" "org-mode/lisp/ob-js.el"
;;;;;;  "org-mode/lisp/ob-keys.el" "org-mode/lisp/ob-latex.el" "org-mode/lisp/ob-ledger.el"
;;;;;;  "org-mode/lisp/ob-lilypond.el" "org-mode/lisp/ob-lisp.el"
;;;;;;  "org-mode/lisp/ob-lob.el" "org-mode/lisp/ob-makefile.el"
;;;;;;  "org-mode/lisp/ob-matlab.el" "org-mode/lisp/ob-maxima.el"
;;;;;;  "org-mode/lisp/ob-mscgen.el" "org-mode/lisp/ob-ocaml.el"
;;;;;;  "org-mode/lisp/ob-octave.el" "org-mode/lisp/ob-org.el" "org-mode/lisp/ob-perl.el"
;;;;;;  "org-mode/lisp/ob-picolisp.el" "org-mode/lisp/ob-plantuml.el"
;;;;;;  "org-mode/lisp/ob-processing.el" "org-mode/lisp/ob-python.el"
;;;;;;  "org-mode/lisp/ob-ref.el" "org-mode/lisp/ob-ruby.el" "org-mode/lisp/ob-sass.el"
;;;;;;  "org-mode/lisp/ob-scala.el" "org-mode/lisp/ob-scheme.el"
;;;;;;  "org-mode/lisp/ob-screen.el" "org-mode/lisp/ob-sed.el" "org-mode/lisp/ob-shell.el"
;;;;;;  "org-mode/lisp/ob-shen.el" "org-mode/lisp/ob-sql.el" "org-mode/lisp/ob-sqlite.el"
;;;;;;  "org-mode/lisp/ob-stan.el" "org-mode/lisp/ob-table.el" "org-mode/lisp/ob-tangle.el"
;;;;;;  "org-mode/lisp/ob.el" "org-mode/lisp/org-archive.el" "org-mode/lisp/org-attach.el"
;;;;;;  "org-mode/lisp/org-bbdb.el" "org-mode/lisp/org-bibtex.el"
;;;;;;  "org-mode/lisp/org-clock.el" "org-mode/lisp/org-crypt.el"
;;;;;;  "org-mode/lisp/org-ctags.el" "org-mode/lisp/org-datetree.el"
;;;;;;  "org-mode/lisp/org-docview.el" "org-mode/lisp/org-element.el"
;;;;;;  "org-mode/lisp/org-entities.el" "org-mode/lisp/org-eshell.el"
;;;;;;  "org-mode/lisp/org-faces.el" "org-mode/lisp/org-feed.el"
;;;;;;  "org-mode/lisp/org-footnote.el" "org-mode/lisp/org-gnus.el"
;;;;;;  "org-mode/lisp/org-habit.el" "org-mode/lisp/org-id.el" "org-mode/lisp/org-indent.el"
;;;;;;  "org-mode/lisp/org-info.el" "org-mode/lisp/org-inlinetask.el"
;;;;;;  "org-mode/lisp/org-install.el" "org-mode/lisp/org-irc.el"
;;;;;;  "org-mode/lisp/org-list.el" "org-mode/lisp/org-macro.el"
;;;;;;  "org-mode/lisp/org-mhe.el" "org-mode/lisp/org-mobile.el"
;;;;;;  "org-mode/lisp/org-mouse.el" "org-mode/lisp/org-pcomplete.el"
;;;;;;  "org-mode/lisp/org-plot.el" "org-mode/lisp/org-protocol.el"
;;;;;;  "org-mode/lisp/org-rmail.el" "org-mode/lisp/org-src.el" "org-mode/lisp/org-table.el"
;;;;;;  "org-mode/lisp/org-timer.el" "org-mode/lisp/org-w3m.el" "org-mode/lisp/ox-ascii.el"
;;;;;;  "org-mode/lisp/ox-beamer.el" "org-mode/lisp/ox-html.el" "org-mode/lisp/ox-icalendar.el"
;;;;;;  "org-mode/lisp/ox-latex.el" "org-mode/lisp/ox-man.el" "org-mode/lisp/ox-md.el"
;;;;;;  "org-mode/lisp/ox-odt.el" "org-mode/lisp/ox-org.el" "org-mode/lisp/ox-publish.el"
;;;;;;  "org-mode/lisp/ox-texinfo.el" "org-mode/lisp/ox.el" "paredit/test.el"
;;;;;;  "pcache/pcache.el" "point-undo/point-undo.el" "popup/popup.el"
;;;;;;  "popwin/misc/popwin-browse-kill-ring.el" "popwin/misc/popwin-pp.el"
;;;;;;  "popwin/misc/popwin-term.el" "popwin/misc/popwin-w3m.el"
;;;;;;  "popwin/misc/popwin-yatex.el" "queue/queue-autoloads.el"
;;;;;;  "queue/queue-pkg.el" "rainbow-delimiters/rainbow-delimiters-test.el"
;;;;;;  "rainbow-mode/rainbow-mode-autoloads.el" "rainbow-mode/rainbow-mode-pkg.el"
;;;;;;  "request/request-deferred.el" "request/request.el" "ruby-block/ruby-block.el"
;;;;;;  "s/s.el" "splitter/splitter.el" "sudo-ext/sudo-ext.el" "twittering-mode/test.el"
;;;;;;  "viewer/viewer.el" "web/web-file-upload.el" "web/web-test.el"
;;;;;;  "with-editor/with-editor.el" "yatemplate/test-yatemplate.el")
;;;;;;  (0 0 0 0))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
