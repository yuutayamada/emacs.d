;;; my_util.el --- my init functions -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(require 'cl-lib)
(require 'my_font)

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

(defun Y/after-load-function ()
  "Load convenient functions only once."
  (require 'init_isearch)
  (require 'init_auto-capitalize)
  (with-no-warnings
    (if (display-graphic-p) ; if GUI Emacs
        (and (require 'powerline)
             (powerline-default-theme)
             (my/change-powerline-color :box "#7fffd4"))
      (nyan-mode)))
  (Y/adjust-font)
  (remove-hook 'find-file-hook 'my/after-load-function))

(defun Y/adjust-font ()
  "Font configuration."
  (when (and ;; (display-graphic-p (selected-frame))
         (not (equal "fontset-default"
                     (assoc-default 'font default-frame-alist))))
    (my/change-font-partially `(:family "Anonymous Pro") "λ")))

(defun Y/frame-init-func (&optional frame)
  "Init function when Emacs connects new server with FRAME object."
  (let ((f (or frame (selected-frame))))
    (select-frame f)
    (cond ((display-graphic-p f)
           ;; GUI Emacs
           ;; Other good dark themes:
           ;; deeper-blue wombat, misterioso, tsdh-dark, wheatgrass, manoj-dark
           ;; `ghq root`/git.savannah.gnu.org/emacs/etc/themes
           (Y/apply-color-theme 'unspecified 0 f)
           (when (fboundp 'turn-off-xclip)
             (turn-off-xclip)
             (setq interprogram-cut-function   'gui-select-text
                   interprogram-paste-function 'gui-selection-value)))
          (t ; Terminal Emacs(transparent)
           (Y/apply-color-theme 'fabulous t f)
           (when (fboundp 'turn-on-xclip)
             (turn-on-xclip))))))

(defun Y/apply-color-theme (new-theme hl-flag &optional frame)
  "Use my transparent color theme if it is in terminal Emacs.
Otherwise, use a dark theme.  The FRAME is frame object."
  (interactive)
  (let* ((f (or frame (selected-frame)))
         old-theme fallback)
    (unless (eq old-theme new-theme)
      (condition-case err
          (load-theme new-theme t)
        (error (message (format "%s -- therefore use default dark color" err))
               (setq fallback t)))
      (setq old-theme new-theme))
    (global-hl-line-mode hl-flag)
    (Y/set-default-window-frame-alist f)
    ;; Apply my color theme for some packages
    (load-theme 'my_pkg_colors t)
    (when fallback
      (unless (equal "black" (frame-parameter nil 'background-color))
        (set-background-color "black"))
      (unless (equal "white" (frame-parameter nil 'foreground-color))
        (set-foreground-color "white")))))

(defun Y/set-default-window-frame-alist (frame)
  "Set window-frame-alist of FRAME."
  (let* ((ws (window-system frame))
         (bg (frame-parameter frame 'background-color))
         (fg (frame-parameter frame 'foreground-color))
         (falist
          (append
           '((background-mode . dark))
           (when bg `((background-color . ,bg)))
           (when fg `((foreground-color . ,fg))))))
    (setq window-system-default-frame-alist `(,ws ,falist))))

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
(defun message-startup-time (&optional end-time)
  "Display spent time.

You can specify END-TIME(from server-visit hook)"
  (let* ((start (+ (cl-third before-init-time)
                   (* 1000000 (cl-second before-init-time))))
         (end   (or end-time
                    after-init-time))
         (msg   (format "=====Emacs loaded in %dms=======\n=====Emacs-version: %s====="
                        (/ (- (+ (cl-third end)
                                 (* 1000000 (cl-second end)))
                              start) 1000)
                        emacs-version))
         (message-log-max 3000))
    (message msg)))

(defun Y/add-after-load-files (prefix where)
  "Register files as file that you `eval-after-load'.
You can specify searching place from WHERE and you can specify the
file prefix by PREFIX."
  (cl-loop for f in (directory-files where)
           if (string-match (concat prefix "\\(.*\\)\\.el$") f)
           do (apply
               `((lambda ()
                   (with-eval-after-load ,(match-string 1 f)
                     (condition-case err
                         (require (quote ,(intern (format "init_%s" (match-string 1 f)))))
                       (error err))))))))

(provide 'my_util)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_util.el ends here


