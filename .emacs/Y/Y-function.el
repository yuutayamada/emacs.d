;;; Y-function.el --- my convenience functions -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'cl-lib)
(require 'Y-autoload)
(require 'subr-x)
(require 'thingatpt)

(defun Y/banish-cursor ()
  "Move cursor to corner.  This function is only worked in GUI Emacs."
  (interactive)
  (let ((f (selected-frame)))
    (when (frame-visible-p f)
      (let* ((height (1- (frame-height)))
             (width  (frame-width)))
        (set-mouse-position (selected-frame) (max width 50) (max height 10))))))

;;;###autoload
(defun other-window-or-split (&rest _r)
  "Move buffer or split when buffer was one."
  (interactive)
  (when (one-window-p) (Y/split-window-spirally))
  (if current-prefix-arg
      (other-window -1)
    (other-window 1))
  (Y/banish-cursor))

;;;###autoload
(defun Y/split-window-spirally ()
  "Split window spirally."
  (interactive)
  (let* ((ratio (/ (frame-width) (frame-height))))
    (if (< (* ratio (window-height)) (window-width))
        (split-window-horizontally) ; |
      (split-window-vertically))))  ; -

(defvar Y/opacity-data nil)
(defun Y/toggle-opacity ()
  "Toggle opacity."
  (let* ((opacity '(70 70))
         (dg (display-graphic-p))
         (directive (if dg 'alpha 'background-color))
         (var  (frame-parameter (selected-frame) directive)))
    (cl-case directive
      (background-color ; NOX
       (cond
        ((equal "unspecified-bg" var)
         (Y/set-bg-color (if dg (car Y/opacity-data) (cdr Y/opacity-data))))
        (t (setq Y/opacity-data (cons (car Y/opacity-data) var))
           (Y/set-bg-color "unspecified-bg"))))
      (alpha ; GUI
       (if-let ((alpha var))
           (if (equal alpha opacity)
               (Y/set-bg-color nil '(100 100))
             (Y/set-bg-color nil opacity))
         (Y/set-bg-color nil opacity))))))

;;;###autoload
(defun Y/set-bg-color (color &optional alpha)
  "Set bg COLOR with ALPHA if needed."
  (interactive)
  (if (display-graphic-p (selected-frame))
      ;; GUI      unspecified-bg
      (if (or alpha (equal "unspecified-bg" color))
          ;; Loading `unspecified-bg' would cause annoying bug, so prevent it!
          (set-frame-parameter (selected-frame) 'alpha (or alpha '(70 0)))
        (set-frame-parameter (selected-frame) 'background-color color))
    ;; NOX
    (set-frame-parameter (selected-frame) 'background-color color)))

;;;###autoload
(defun Y/org-src-block-p ()
  "Return t when inside #+begin_src ... ."
  (and (fboundp 'org-in-src-block-p) (org-in-src-block-p)))

;;;###autoload
(defun Y/org-src-edit-buffer-p ()
  "Return t when created other inside *Org Src ...* buffer."
  (or (and (fboundp 'org-src-edit-buffer-p) (org-src-edit-buffer-p))
      (string-match "^\\*Org Src .*\\*" (buffer-name))))

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
      (calendar-mode         (Y/insert-day))
      (emacs-lisp-mode       (test))
      (makefile-gmake-mode   (funcall insertX "$()"))
      (python-mode           (insert "$"))
      ((go-mode sh-mode)     (funcall insertX "${}"))
      (snippet-mode          (funcall insertX "${:}" 2))
      (gold-mode             (funcall insertX "{{}}" 2))
      ((jade-mode ruby-mode) (funcall insertX "#{}")))))

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
(defun Y/ssh-add (&rest _r)
  "Add ssh-key if it was needed when using magit.  You may neeed ssh-askpath.

Example of my/keys
 (\"git@github.com\\|https://github.com\" . \"~/.ssh/rsa_github_key\")"
  (interactive)
  (when (bound-and-true-p my/keys)
    (cl-loop with remote-url = (shell-command-to-string "echo -n `git remote -v`")
             with f = (lambda (file)
                        (unless (zerop (shell-command
                                        (concat "ssh-add -l | grep " file)))
                          (shell-command (concat "ssh-add " file))))
             for (regex . remote) in my/keys
             if (string-match regex remote-url)
             do (funcall f (expand-file-name remote)))))

;;;###autoload
(defun Y/show-cheat-sheet ()
  "Popup a buffer by popwin which is related to current ‘major-mode’."
  (interactive)
  (when (bound-and-true-p Y/cheat-sheet-dir)
    (let* ((file-name (cl-case major-mode
                        ('mew-summary-mode "mew.org")
                        ('mew-message-mode "mew.org")
                        ('c++-mode         "c-mode.org")
                        ('lisp-mode        "common-lisp.org")
                        (t nil)))
           (name (symbol-name major-mode))
           (lang-name (substring name 0 (- (length name) 5)))
           (major-file
            (format "%s/%s/%s" Y/cheat-sheet-dir lang-name "_cheat.org"))
           (true-name
            (concat Y/cheat-sheet-dir file-name)))
      (if (and (file-exists-p true-name) file-name)
          (popwin:find-file true-name)
        (if (file-exists-p major-file)
            (popwin:find-file major-file)
          (find-file major-file))))))

;; 華氏 = Fahrenheit: 華氏の換算式=(9/5)x摂氏+32
;; 摂氏 = Celsius:    摂氏の換算式=(5/9)x(華氏-32)
(defun my/compute-Celsius ()
  "Compute temperature."
  (interactive)
  (let ((Fahrenheit
         (string-to-number (read-from-minibuffer "What is Fahrenheit?: "))))
    (minibuffer-message (* 0.555 (- Fahrenheit 32)))))


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

;;;###autoload
(defun my/newline-and-indent ()
  "My better newline and indent."
  (interactive)
  (cl-case major-mode
    (markdown-mode nil)
    (t (delete-trailing-whitespace (point-at-bol) (point-at-eol))))
  (cl-case major-mode
    (org-mode (and (fboundp 'org-return-indent) (org-return-indent)))
    (t (electric-newline-and-maybe-indent))))

;; (defun my/region-extender (&optional input)
;;   (interactive)
;;   (set-mark
;;    (save-excursion
;;      (goto-char (mark))
;;      (call-interactively
;;       (pcase input
;;         (`"n"  'next-line)
;;         (`"p"  'previous-line)
;;         (`"b"  'backward-char)
;;         (input 'forward-char)))
;;      (point))))

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
(defun Y/echo-current-point ()
  (interactive)
  (print (format "current point is %i" (point))))

;;;###autoload
(defun Y/toggle-truncate-lines ()
  "My toggle truncate lines."
  (interactive)
  (if (or (string-match "disabled" (toggle-truncate-lines))
          (eq 'org-mode major-mode))
      (whitespace-mode 0)
    (whitespace-mode t)))

;;;###autoload
(defun Y/lookup-stardict()
  "Lookup word by stardict."
  ;; http://askubuntu.com/questions/191125/is-there-an-offline-command-line-dictionary
  (interactive)
  (let ((buf  "*stardict*"))
    (get-buffer-create buf)
    (async-shell-command (format "sdcv --data-dir=%s %s"
                                 (file-truename "~/share/dict/stardict/")
                                 (shell-quote-argument
                                  (read-string "stardict: " (thing-at-point 'word))))
                         (get-buffer-create buf))
    (run-with-timer 0.1 nil
                    `(lambda ()
                       (unless (equal (buffer-name (current-buffer)) ,buf)
                         (switch-to-buffer-other-window ,buf))
                       (goto-char (point-min))))))


;;;###autoload
(defun replace-last-sexp ()
  "Replace last sexp."
  (interactive)
  (when-let ((value (eval (elisp--preceding-sexp))))
    (kill-sexp -1)
    (insert (format "%S" value))))

;; for scratch
(defun test ()
  (interactive)
  nil)

(provide 'Y-function)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-function.el ends here
