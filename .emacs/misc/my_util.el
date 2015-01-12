;;; my_util.el --- my init functions -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(require 'cl-lib)
(require 'my_font)

(defun my/add-load-path-subdir (dirlist)
  "Add sub directory's files by specified DIRLIST to `load-path'."
  (with-temp-buffer
    (cl-dolist (dir dirlist)
      (cd dir)
      (normal-top-level-add-subdirs-to-load-path))))

(defun my/load-packages (packages)
  "Load PACKAGES."
  (cl-loop with req = (lambda (file &optional use-load)
                        (condition-case error
                            (if (or use-load (stringp file))
                                (load file)
                              (require file nil t))
                          (error error)))
           for package-name in packages
           if (symbolp package-name) do
           (message (concat "loading : " (symbol-name package-name)))
           (funcall req package-name)
           else do
           (funcall req (concat
                         (bound-and-true-p config-dir) package-name) t)))

(defun my/after-load-function ()
  "Load convenient functions only once."
  (require 'init_auto-complete)
  (require 'init_filecache)
  (require 'init_isearch)
  (require 'init_auto-capitalize)
  (with-no-warnings
    (when (display-graphic-p) ; if GUI Emacs
      (and (require 'powerline)
           (powerline-default-theme)
           (my/change-powerline-color :box "#7fffd4"))))
  ;; Font configuration
  (when (and (display-graphic-p (selected-frame))
             (not (equal "fontset-default"
                         (assoc-default 'font default-frame-alist))))
    (my/change-font-partially `(:family "Anonymous Pro") "λ"))
  (remove-hook 'find-file-hook 'my/after-load-function))

;; Color
(defun my/apply-color-theme ()
  "Use my transparent color theme if it is in terminal Emacs.
Otherwise, use a dark theme."
  (interactive)
  (let* ((ws (window-system (selected-frame)))
         (terminal-bg "unspecified-bg")
         (gui-bg      "black")
         (bg (if ws gui-bg terminal-bg))
         (falist
          `((background-mode  . dark)
            ;; this unspecified-bg is for terminal Emacs.
            ;; To specify bg of GUI Emacs, use -bg COLOR option.
            (background-color . ,bg)
            (foreground-color . "white")))
         (current-bg (frame-parameter (selected-frame) 'background-color)))

    (setq window-system-default-frame-alist `(,ws ,falist))
    (if (display-graphic-p (selected-frame))
        ;; Other good dark themes:
        ;; deeper-blue wombat, misterioso, tsdh-dark, wheatgrass, manoj-dark
        ;; `ghq root`/git.savannah.gnu.org/emacs/etc/themes
        (progn (when (not (equal gui-bg current-bg))
                 (load-theme 'deeper-blue))
               (global-hl-line-mode 0))
      ;; Color theme for terminal Emacs(transparent)
      (when (not (equal terminal-bg current-bg))
        (load-theme 'fabulous t))
      (global-hl-line-mode t))))

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

(defun my/add-after-load-files (prefix where)
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


