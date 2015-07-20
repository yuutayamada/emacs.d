;;; my_function.el --- my convenience functions

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

;;; Code:
(require 'cl-lib)
(require 'my_paths)
(require 'my_autoload)

(defun banish ()
  "Move cursor to corner."
  (interactive)
  (let* ((get-param (lambda (search-param)
                      (cl-loop for parametor in (frame-parameters nil)
                               if (equal search-param (car parametor))
                               do (cl-return (cdr parametor)))))
         (height
          (- (funcall get-param 'height) 1))
         (width
          (funcall get-param 'width)))
    (set-mouse-position (selected-frame) (max width 50) (max height 10))))

(defun Y/ido-find-ghq-dirs ()
  "Find file from my favorite resource."
  (interactive)
  (let* ((ghq-dirs (bound-and-true-p Y/ghq-dirs))
         (code-dirs (cl-loop with root = "~/code"
                             for dir in (directory-files root)
                             unless (string-match "^\\(\\.\\|\\.\\.\\)$" dir)
                             collect (format "%s/%s" root dir)))
         (match (ido-completing-read "ghq: " (append ghq-dirs code-dirs))))
    (cond ((bufferp (get-buffer match))
           (switch-to-buffer (get-buffer match)))
          (t (find-file match)))))

;;;###autoload
(defun other-window-or-split ()
  "Move buffer or split when buffer was one."
  (interactive)
  (when (one-window-p) (Y/split-window-spirally))
  (if current-prefix-arg
      (other-window -1)
    (other-window 1))
  (banish))

;;;###autoload
(defun Y/split-window-spirally ()
  (interactive)
  (if (< (window-height) (window-width))
      (split-window-horizontally)
    (split-window-vertically)))

;;;###autoload
(defun Y/reverse-transpose-chars ()
  (interactive)
  (transpose-chars -1)
  (backward-char 1))

(defvar Y/inhibit-change-color nil)
;;;###autoload
(defun Y/change-color (face bg fg ul)
  "Change highlight color to which correspond to FACE, BG, FG, UL."
  (unless Y/inhibit-change-color
    (set-face-attribute
     face nil :background bg :foreground fg :underline  ul)))

(defvar Y/mode-line-change-faces
  (cl-loop for face in '(mode-line powerline-active1 powerline-active2)
           if (facep face)
           collect face))

(defvar Y/default-mode-line-face
  (cl-loop for face in Y/mode-line-change-faces
           collect (cons face (face-all-attributes face))))

;;;###autoload
(defun Y/change-style (attributes &optional inhibit)
  "Change looking of window."
  (when (or (not Y/inhibit-change-color)
            inhibit)
    (let* ((faces Y/mode-line-change-faces))
      (cl-loop for face in faces
               if attributes
               do (apply `((lambda () (Y/change-color (quote ,face) ,@attributes))))
               else do (let ((attrs (assoc-default face Y/default-mode-line-face)))
                         (Y/change-color
                          face
                          (assoc-default :background attrs)
                          (assoc-default :foreground attrs)
                          (assoc-default :underline  attrs))))))
  (cl-case inhibit
    (1 (setq Y/inhibit-change-color t))
    (0 (setq Y/inhibit-change-color nil))))

(defun clean-mode-line ()
  "Use specified abbreviation of mode-line-name  by `mode-line-cleaner-alist'."
  (interactive)
  (when (bound-and-true-p mode-line-cleaner-alist)
    (cl-loop for (mode . mode-str) in mode-line-cleaner-alist
             do
             (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
               (when old-mode-str
                 (setcar old-mode-str mode-str))
               (when (eq mode major-mode)
                 (setq mode-name mode-str))))))
(add-hook 'after-change-major-mode-hook 'clean-mode-line)
(add-hook 'find-file-hook 'clean-mode-line)

(defun my/revert-buffer ()
  ""
  (interactive)
  (if (buffer-modified-p (current-buffer))
      (revert-buffer)
    (revert-buffer nil t)))

(defun my/chomp (string)
  "Chomp STRING."
  (let ((str string))
    (when (equal (elt str (- (length str) 1)) ?\n)
      (substring str 0 (- (length str) 1)))))

(defun my/byte-compile (&optional dirs)
  "Byte-compile DIRS(if specified) or my configuration files."
  (interactive)
  (cl-loop for dir in (or dirs `(,config-dir))
           do (byte-recompile-directory dir 0 t)))

;;; For Color and Face
(defun my/load-color-theme ()
  "Load my color theme."
  (interactive)
  (when (display-graphic-p)
    (set-background-color "black"))
  (enable-theme 'opacity))

(defun my/set-opacity (selected)
  "Set opacity.
The SELECTED argument is opacity that window is selected."
  (let ((not-selected 100))
    (set-frame-parameter
     (selected-frame) 'alpha `(,selected ,not-selected))))

(defun my/toggle-opacity ()
  "Toggle opacity configuration."
  (interactive)
  (let* ((opacity (my/get-opacity))
         (high 100)
         (low 45))
    (if (< 50 opacity)
        (my/set-opacity low)
      (my/set-opacity high))))

(defun my/get-opacity ()
  "Get current opacity."
  (or (cadr (assoc 'alpha (frame-parameters)))
      50))

(defun my/increase-opacity ()
  "Increase opacity."
  (interactive)
  (my/set-opacity (min (+ (my/get-opacity) 5) 100)))

(defun my/decrease-opacity ()
  "Decrease opacity."
  (interactive)
  (my/set-opacity (max (- (my/get-opacity) 5) 0)))

;;;###autoload
(defun my/org-src-code-buffer-p ()
  ""
  (let* ((buffer (buffer-name)))
    (or (string-match "\*Org Src .+\.org\[ js \]\*" buffer)
        (string-match "\*Org Src .+\.org\[ javascript \]\*" buffer))))

(defun my/insert ()
  ""
  (interactive)
  (let* ((insertX (lambda (x &optional num)
                    (insert x)
                    (backward-char (or num 1)))))
    (cl-case major-mode
      (c-mode (insert "->"))
      (haskell-mode (insert " -> "))
      (coffee-mode
       (if (eq (face-at-point) 'font-lock-comment-face)
           (funcall insertX "#{}")
         (insert " ->")))
      (calendar-mode         (my-insert-day))
      (emacs-lisp-mode       (test))
      (makefile-gmake-mode   (funcall insertX "$()"))
      (python-mode           (insert "$"))
      ((go-mode sh-mode)     (funcall insertX "${}"))
      (snippet-mode          (funcall insertX "${:}" 2))
      (gold-mode             (funcall insertX "{{}}" 2))
      ((jade-mode ruby-mode) (funcall insertX "#{}")))))

(defun my/echo-text-properties-at-point ()
  "Print point's text-proerties."
  (interactive)
  (print (text-properties-at (point))))

;;;###autoload
(defun my/kill-line ()
  ""
  (if (not (bound-and-true-p mykie:prog-mode-flag))
      (call-interactively 'kill-line)
    (call-interactively 'paredit-kill)
    (indent-for-tab-command)))

;;;###autoload
(defun my/screen-shot ()
  ""
  (interactive)
  (if (not current-prefix-arg)
      (shell-command "gnome-screenshot > /dev/null")
    (shell-command "gnome-screenshot -a > /dev/null")))

;;;###autoload
(defun my/remap-semicolon (map)
  "Reverse Colon and Semi Colon at specified key MAP."
  (define-key map (kbd ";") (lambda () (interactive) (insert ":")))
  (define-key map (kbd ":") (lambda () (interactive) (insert ";"))))

;;;###autoload
(defun my/ssh-add ()
  "Add ssh-key if it was needed when using magit. You may neeed ssh-askpath.

Example of my/keys
 (\"git@github.com\\|https://github.com\" . \"~/.ssh/rsa_github_key\")"
  (interactive)
  (when (bound-and-true-p my/keys)
    (let* ((p (point))
           (remote-url (shell-command-to-string "echo -n `git remote -v`")))
      (cl-loop for (regex . remote) in my/keys
               if (string-match regex remote-url)
               do ((lambda (file)
                     (unless (zerop (shell-command
                                     (concat "ssh-add -l | grep " file)))
                       (shell-command (concat "ssh-add " file))))
                   (expand-file-name remote))))))

(defun my/get-buffer-string-from (file)
  ""
  (let* ((current        (current-buffer))
         (aspell-buffer  (find-file-noselect file))
         words)
    (switch-to-buffer aspell-buffer)
    (setq words (buffer-substring-no-properties (point-min) (point-max)))
    (switch-to-buffer current)
    words))

;;;###autoload
(defun my/get-aspell-capital-words (file)
  ""
  (if (file-exists-p file)
      (cl-loop with personal-dict = (my/get-buffer-string-from file)
               with words = (split-string personal-dict "\n")
               with case-fold-search = nil
               for word in words
               if (string-match "[A-Z]" word)
               collect word)
    (error (format "The file %s doesn't exist" file))))

;;;###autoload
(defun my/file-exists-p (file)
  "Search FILE recursively to check whether file is exist until home directory."
  (let* ((filename (concat "./" file))
         (home   "~/")
         (home-p (lambda (dir1 filename)
                   (equal
                    (expand-file-name dir1)
                    (expand-file-name
                     (file-name-directory filename))))))
    (while (not (or (file-exists-p filename)
                    (funcall home-p home filename)))
      (setq filename (concat "../" filename)))
    (when (file-exists-p filename)
      (expand-file-name filename))))

;;;###autoload
(defun Y/show-cheat-sheet ()
  ""
  (interactive)
  (let* ((file-name (cl-case major-mode
                      ('mew-summary-mode "mew.org")
                      ('mew-message-mode "mew.org")
                      ('c++-mode         "c-mode.org")
                      ('lisp-mode        "common-lisp.org")
                      (t nil)))
         (cheat-sheet-dir "~/share/doc/cheat_sheets/")
         (major-file
          (concat cheat-sheet-dir (symbol-name major-mode) ".org"))
         (true-name
          (concat cheat-sheet-dir file-name)))
    (if (and (file-exists-p true-name) file-name)
        (popwin:find-file true-name)
      (if (file-exists-p major-file)
          (popwin:find-file major-file)))))

;;;###autoload
(defun my/get-above-dir-name ()
  ""
  (let* ((dirs (split-string (file-name-as-directory default-directory) "/"))
         (last (- (length dirs) 2)))
    (nth last dirs)))

;;;###autoload
(defun my/in-dir-p (directory)
  ""
  (string-match (format "^%s" (expand-file-name directory))
                (expand-file-name default-directory)))

;; 華氏 = Fahrenheit: 華氏の換算式=(9/5)x摂氏+32
;; 摂氏 = Celsius:    摂氏の換算式=(5/9)x(華氏-32)
(defun my/compute-Celsius ()
  "Compute temperature."
  (interactive)
  (let ((Fahrenheit
         (string-to-number (read-from-minibuffer "What is Fahrenheit?: "))))
    (minibuffer-message (* 0.555 (- Fahrenheit 32)))))

;;;###autoload
(defun my/execute-from-current-file (&optional statement)
  ""
  (interactive)
  (let*
      ((original-buffer (current-buffer))
       (code    (shell-quote-argument (or statement (buffer-string))))
       (program (cl-case major-mode
                  (ruby-mode  "ruby -e ")
                  (cperl-mode "perl -e ")
                  (scala-mode "scala -e ")))
       (command (concat program code))
       (buffer  (get-buffer-create "*execute program*")))
    (condition-case error (kill-process buffer)
      (error error))
    (save-current-buffer
      (popwin:popup-buffer
       buffer :stick t :width (/ (frame-width) 2) :position :right)
      (erase-buffer))
    (start-process
     "emacs-program" buffer "/bin/sh" "-c" command)
    (switch-to-buffer-other-window original-buffer)))

(defun my/git-diff-from-current-file ()
  ""
  (interactive)
  (let ((current-buffer (current-buffer))
        (this-file (file-relative-name
                    buffer-file-name))
        (buffer (get-buffer-create "*git diff*")))
    (save-current-buffer
      (popwin:popup-buffer
       buffer :stick t :width (/ (frame-width) 2) :position :right)
      (erase-buffer)
      (diff-mode)
      (start-process-shell-command
       "emacs-my-git-diff" buffer
       (concat "git --no-pager diff --diff-filter=M --no-color ./"
               this-file)))))

(defun my-insert-day ()
  ""
  (interactive)
  (let ((day nil)
        (calendar-date-display-form
         '("[" year "-" (format "%02d" (string-to-int month))
           "-" (format "%02d" (string-to-int day)) "]")))
    (setq day (calendar-date-string
               (calendar-cursor-to-date t)))
    (calendar-exit)
    (insert day)))

;;;###autoload
(defun Y/get-auth-info (machine &rest keywords)
  ""
  (cl-loop with info = (car (auth-source-search :host machine :login :port))
           for kw in keywords
           for data = (plist-get info kw)
           if (functionp data)
           collect (funcall data)
           else collect data))

(defun my/delete-trailing-space (word)
  ""
  (cl-loop with str = word
           for (from . to) in '((" *$" . "")
                                ("^ *" . "")
                                (" +" . " "))
           do (setq str (replace-regexp-in-string from to str))
           finally return str))

(defun my/go-festival (text &optional loop)
  ""
  (let
      ((command (format "$GOBIN/gofestival -text \"%s\" %s" text (or loop ""))))
    (async-shell-command command)))

(defun my/insert-not-equal ()
  ""
  (insert (cl-case major-mode
            (haskell-mode "/=")
            (t "!="))))

;;;###autoload
(defun my/copy-current-file-name ()
  ""
  (interactive)
  (kill-new buffer-file-truename))

;;;###autoload
(defun my/kill-backward-word ()
  ""
  (unless (when (and (looking-at " ")
                     (string-match " " (char-to-string (char-before))))
            (just-one-space 1)
            (backward-char)
            t)
    (if (string-match "^ *\n$" (thing-at-point 'line))
        (delete-blank-lines)
      (if (and (bound-and-true-p cua--rectangle)
               (fboundp 'cua-cut-rectangle))
          (cua-cut-rectangle t)
        (save-excursion
          (save-restriction
            (narrow-to-region (point-at-bol) (point-at-eol))
            (when (not (or (eolp) (bolp)))
              (forward-char))
            (backward-word)
            (kill-word 1)))))))

(defun my/fill-current-line ()
  ""
  (interactive)
  (mykie
   :comment (let ((fill-prefix comment-start))
              (fill-region (point-at-bol) (point-at-eol)))
   :default (fill-region (point-at-bol) (point-at-eol))))

(defun my/replicate-current-line ()
  ""
  (let ((current-line
         (s-chomp (substring-no-properties (thing-at-point 'line)))))
    (newline-and-indent)
    (insert current-line)
    (save-excursion
      (save-restriction
        (narrow-to-region (point-at-bol) (point-at-eol))
        (beginning-of-line)
        (when (search-forward-regexp "[0-9]+" nil t)
          (evil-numbers/inc-at-pt 1))))
    (indent-for-tab-command)))

;;;###autoload
(defun my/newline-and-indent ()
  "My better newline and indent."
  (interactive)
  (cl-case major-mode
    (markdown-mode nil)
    (t (delete-trailing-whitespace (point-at-bol) (point-at-eol))))
  (cl-case major-mode
    (org-mode (org-return-indent))
    (t (electric-newline-and-maybe-indent))))

(defun my/browse-condition-p (&optional url)
  ""
  (let ((buffer (buffer-name)))
    (or (equal major-mode 'twittering-mode)
        (equal "*Article INBOX*" buffer)
        (equal "*ger*" buffer)
        (string-match "^https?://google" url)
        (string-match "^https?://www.lispworks.com/documentation/" url))))

;; (browse-url-default-browser URL &rest ARGS)
(defun my/w3m-or-mozila-browser-function (url &rest args)
  ""
  (interactive (browse-url-interactive-arg "URL: "))
  (let
      ((new-session (car args)))
    (if (not (my/browse-condition-p url))
        (browse-url-mozilla url new-session)
      (other-window-or-split)
      (w3m-browse-url url new-session))))

(defun my/region-extender (&optional input)
  (interactive)
  (set-mark
   (save-excursion
     (goto-char (mark))
     (call-interactively
      (pcase input
        (`"n"  'next-line)
        (`"p"  'previous-line)
        (`"b"  'backward-char)
        (input 'forward-char)))
     (point))))

(defun my/lookup-android-docs ()
  "Lookup android document from local file."
  (interactive)
  (let
      ((path (concat (getenv "ANDROID_SDK_HOME") "/docs/reference/packages.html"))
       (query (read-from-minibuffer "android reference: " (word-at-point))))
    (if (file-exists-p path)
        (browse-url-mozilla (format "file://%s#q=%s" path query))
      (error (format "%s is not found." path)))))

(defun my/get-project-dir ()
  "Return project's root directory."
  (cl-loop with file-or-dirs = '("AndroidManifest.xml"
                                 "Gruntfile.js" "gulpfile.js"
                                 "src" "build.xml" "build.gradle" "pom.xml"
                                 "Makefile" "Rakefile" ".git" ".hg")
           for path in file-or-dirs
           if (locate-dominating-file default-directory path)
           do (unless (equal it "~/") (cl-return it))))

(defun my/refactor ()
  ""
  (interactive)
  (let*
      ((dev-home (file-truename (or (my/get-project-dir) default-directory)))
       (exclude-dir ".git:.hg:bin:gen")
       (keyword (shell-quote-argument
                 (read-from-minibuffer "Refactor: " (or (word-at-point) "")))))
    (grep
     ;; For grep: "grep -Hnrw --exclude-dir %s -e %s %s"
     (format "pt --smart-case --ignore=%s --nogroup --nocolor -- %s %s"
             exclude-dir keyword dev-home))))

(defun my/set-font-size (&optional fontsize font-name)
  "Set font size."
  (interactive)
  (let*
      ((default-font-name
         (cl-loop for font-name in '("Droid Sans Mono" "Ricty" "VL Gothic")
                  if (string< "" (shell-command-to-string
                                  (concat "fc-list | grep " font-name)))
                  do (cl-return font-name)))
       (fontname (or font-name default-font-name))
       (size (or fontsize
                 (read-string "Input font size: ")))
       (font+size (concat fontname "-" size))
       (u "unicode-bmp"))
    (add-to-list 'default-frame-alist (cons 'font font+size))
    (when (version<= "23.0.0" emacs-version)
      (cond
       (window-system
        (set-frame-font font+size)
        (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0208
                          (cons font+size u)))))))

;;;###autoload
(defun my/reset-bg-color (&optional color)
  (interactive)
  (when (or (not (display-graphic-p (selected-frame)))
            color)
    (set-frame-parameter (selected-frame) 'background-color color)))

(defun my/helm-characterers (&optional start end)
  "Show chractors."
  (interactive)
  (helm :sources
        `(((name . "helm-test-code")
           (candidates .
                       (lambda ()
                         (cl-loop with start = (or start 0)
                                  with end = (or end 10000)
                                  for i from start to end
                                  collect (format "    %i: %s    " i (char-to-string i)))))
           (action . (lambda (arg) (insert arg)))))
          :requires-pattern 2
          :candidate-numer-limit 4000
          :input-idle-delay 0.3
          :prompt "helm-characters: "
          :buffer "*helm-characters*"
          :candidates-in-buffer t))

;; Eval and replace
;;;###autoload
(defun Y/eval-and-replace ()
  "Eval and replace.
This function distinguishes parenthesis and symbol accordingly."
  (interactive)
  (let ((thing (cond ((eq (char-before) ?\))
                      'paren)
                     ((thing-at-point 'symbol)
                      'sym)))
        (start (nth 2 (syntax-ppss (point))))
        (end   (point))
        (result (eval-last-sexp t)))
    (delete-region start end)
    (cl-case thing
      (paren (insert result)))))

;;;###autoload
(defun Y/echo-current-point ()
  (interactive)
  (print (format "current point is %i" (point))))

;; for scratch
(defun test ()
  (interactive)
  nil)

(provide 'my_function)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_function.el ends here
