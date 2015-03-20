;;; my_util.el --- my init functions -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(require 'cl-lib)

(defun Y/add-load-path-subdir (dirlist)
  "Add sub directory's files by specified DIRLIST to `load-path'."
  (with-temp-buffer
    (cl-dolist (dir dirlist)
      (cd dir)
      (normal-top-level-add-subdirs-to-load-path))))

(defun Y/load-packages (packages)
  "Load PACKAGES."
  (if (bound-and-true-p config-dir)
      (cl-loop with req = (lambda (file &optional use-load)
                            (condition-case error
                                (if (or use-load (stringp file))
                                    (load file)
                                  (require file nil t))
                              (error error)))
               for package-name in packages
               if (symbolp package-name) do
               (message (format "loading : %s" package-name))
               (funcall req package-name)
               else do
               (funcall req (concat config-dir package-name) t))
    (error "Config-dir is not found")))

;; Automode
(cl-defun my/define-auto-mode (&keys without-dot &rest auto-mode-definitions)
  (setq auto-mode-alist
        (append auto-mode-alist
                (cl-loop with len = (length auto-mode-definitions)
                         with format = (if without-dot "%s\\'" "\\.%s\\'")
                         for i from 0 to len by 2
                         for extension  = (nth (1+ i) auto-mode-definitions)
                         for mode = (nth i auto-mode-definitions)
                         collect (cons (format format extension) mode)))))

(defmacro my/def-auto-mode (&rest args)
  "WIP"
  `(cl-loop with a = (quote ,args)
            with len = (1- (length a))
            with alist = ()
            for i from 0 to len by 2
            for mode      = (nth i a)
            for extension = (nth (1+ i) a)
            collect (cons extension mode) into alist
            finally (setq auto-mode-alist
                          (append auto-mode-alist alist))))

;; AUTOLOADER
(defmacro autoloader-autoloads (&rest args)
  ""
  `(cl-loop for properties in (quote ,args)
            do (cl-typecase properties
                 (list
                  (autoloader-autoload-from-multiple-func
                   (car properties) (cdr properties)))
                 (nil nil))))

(defun autoloader-autoload-from-multiple-func (filename functions)
  "Load FILENAME from FUNCTIONS automatically."
  (condition-case error
      (cl-loop for function in functions
               do (autoload function filename nil t))
    (error (print error))))

(defvar Y/autoloads nil)
(defun Y/get-autoloads ()
  "Get my autoload configurations."
  (if (bound-and-true-p config-dir)
      (let ((f (concat config-dir "data/autoload"))
            (origin (current-buffer)))
        (when (file-exists-p f)
          (let ((buf (find-file-noselect f)))
            (save-current-buffer
              (with-temp-buffer
                (switch-to-buffer buf)
                (goto-char (point-min))
                (insert "(setq Y/autoloads '(")
                (goto-char (point-max))
                (insert "))")
                (eval-buffer buf)
                (revert-buffer nil t)
                (kill-buffer buf)))
            (switch-to-buffer origin))
          Y/autoloads))
    (error "This function needs `config-dir' variable.")))

;; START UP TIME
(defsubst message-startup-time (&optional comment)
  "Display spent time with COMMENT."
  (let* ((start (+ (cl-third before-init-time)
                   (* 1000000 (cl-second before-init-time))))
         (end   (current-time))
         (e-time (/ (- (+ (cl-third end)
                          (* 1000000 (cl-second end)))
                       start)
                    1000))
         (msg   (format "%s : %dmsec" comment e-time))
         (message-log-max 3000))
    (message msg)))

(defvar Y/add-after-load-dir-registered-list nil)
(defun Y/add-after-load-files (prefix where)
  "Register files as file that you `eval-after-load'.
You can specify searching place from WHERE and you can specify the
file prefix by PREFIX."
  (unless (member where Y/add-after-load-dir-registered-list)
    (push where Y/add-after-load-dir-registered-list)
    (cl-loop with p-len = (length prefix)
             with regex = (format "^%s[[:alnum:]_-]+\\.el$" prefix)
             for f in (directory-files where nil regex t)
             for file = (file-name-base f)
             for sym = (intern (substring file p-len (length file)))
             if (featurep sym)
             do (require (intern file))
             else do (apply
                      `((lambda ()
                          (with-eval-after-load (quote ,sym)
                            (condition-case err
                                (require (quote ,(intern file)))
                              (error err)))))))))

;; Color theme ;;
(defun Y/apply-color-theme (new-theme hl-flag)
  "Use my transparent color theme if it is in terminal Emacs.
Otherwise, use a dark theme.  The FRAME is frame object."
  (interactive)
  (let* (old-theme fallback)
    (unless (eq old-theme new-theme)
      (condition-case _err
          (load-theme new-theme t)
        (error (setq fallback t)))
      (setq old-theme new-theme))
    (global-hl-line-mode hl-flag)
    (load-theme 'my_pkg_colors t) ; Apply my color theme for some packages
    (when fallback ; if color-theme doesn't find
      (Y/apply-default-bg-and-fg))))

(defun Y/apply-default-bg-and-fg ()
  "Change background and foreground."
  (let* ((set-color (lambda (bg fg)
                      (unless (equal bg (frame-parameter nil 'background-color))
                        (set-background-color bg))
                      (unless (equal fg (frame-parameter nil 'foreground-color))
                        (set-foreground-color fg))))
         (pair (if (display-graphic-p)
                   (Y/emacs-set-color-of-GUI)
                 ;; Terminal Emacs
                 (cons "unspecified-bg" "unspecified-fg"))))
    (funcall set-color (car pair) (cdr pair))))

(defun Y/emacs-set-color-of-GUI ()
  ""
  (let ((background-mode (frame-terminal-default-bg-mode nil)))
    (cons (or (x-get-resource "background" "Background")
              (if (eq 'dark background-mode)
                  "black"
                "white"))
          (or (x-get-resource "foreground" "Foreground")
              (if (eq 'dark background-mode)
                  "white"
                "black")))))

(defun Y/apply-color-theme-by-display ()
  "Apply color theme by display graphic type."
  (cl-case (framep-on-display)
    ;; 'x' for an Emacs frame that is really an X window,
    ;; 'w32' for an Emacs frame that is a window on MS-Windows display,
    ;; 'pc' for a direct-write MS-DOS frame.
    ;; 'ns' for an Emacs frame on a GNUstep or Macintosh Cocoa display,
    ((x w32 pc ns) (Y/apply-color-theme 'unspecified 0))
    ;; nil for a termcap frame (a character-only terminal),
    (t (Y/apply-color-theme 'fabulous t))))

(provide 'my_util)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_util.el ends here
