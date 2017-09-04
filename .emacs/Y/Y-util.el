;;; Y-util.el --- my init functions -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(require 'cl-lib)

(defun Y/add-load-path-subdir (dirlist)
  "Add sub directory's files by specified DIRLIST to `load-path'."
  (with-temp-buffer
    (cl-dolist (dir dirlist)
      (cd dir)
      (normal-top-level-add-subdirs-to-load-path))))

;;;###autoload
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

;; START UP TIME
(defsubst Y/message-startup-time (&optional comment notification)
  "Display spent time with COMMENT.
If you set non-nil to NOTIFICATION, you can see the result in
notification area."
  (let* ((start (+ (cl-third before-init-time)
                   (* 1000000 (cl-second before-init-time))))
         (end   (current-time))
         (e-time (/ (- (+ (cl-third end)
                          (* 1000000 (cl-second end)))
                       start)
                    1000))
         (msg   (format "%s : %dmsec" comment e-time)))
    (message (concat "STARTUP: " msg))
    (when notification
      (notifications-notify :title "Emacs"
                            :body  msg
                            :timeout 5000))))

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

(defun Y/frame-init-func (&optional frame)
  "Init function when Emacs connects new server with FRAME object."
  (let ((f (or frame (selected-frame))))
    (select-frame f)
    (cl-case (framep-on-display)
      ;; 'x' for an Emacs frame that is really an X window,
      ;; 'w32' for an Emacs frame that is a window on MS-Windows display,
      ;; 'pc' for a direct-write MS-DOS frame.
      ;; 'ns' for an Emacs frame on a GNUstep or Macintosh Cocoa display,
      ((x w32 pc ns)
       ;; http://stackoverflow.com/questions/16677825/emacs-escape-key
       ;; This key swapping allow you to bind C-[ key!
       ;; Note that terminal emacs normally can not distinguish ESC and C-[
       ;; So only change in GUI Emacs
       (keyboard-translate ?\e ?\A-\e)
       ;; On GUI Emacs, I didn't see Japanese Kanji correctly...
       (set-locale-environment "ja_JP.UTF-8")
       ;; Sorry mouse, you should disappear from my world...
       (mouse-avoidance-mode 'banish))
      (t ; nil for a termcap frame (a character-only terminal),
       ;; On Terminal Emacs, this shows eshell prompt string correctly.
       (set-locale-environment "en_US.UTF-8")))))

(defsubst Y/custom-theme-random-pick (themes)
  (let* ((themes
          (cl-remove-if
           (lambda (x) (memq x custom-enabled-themes)) themes))
         (len (length themes))
         (theme (nth (1- (random len)) themes)))
    (setq custom-enabled-themes (list theme))))

(defsubst Y/initial-buffer-current-dir-and-buffer-list ()
  (when (or (not (daemonp)) (<= 2 (length (frame-list))))
    (when (one-window-p)
      (split-window-horizontally))
    (list-buffers)
    (find-file default-directory))
  (current-buffer))

(provide 'Y-util)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-util.el ends here
