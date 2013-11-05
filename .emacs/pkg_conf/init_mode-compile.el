;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(require 'mode-compile)

(setq mode-compile-always-save-buffer-p t
      mode-compile-never-edit-command-p t
      mode-compile-expert-p t
      mode-compile-reading-time 0)

(defun my/get-makefile-target ()
  (interactive)
  (let* ((base-buffer (buffer-name))
         (makefile
          (car (mc--cleanup-makefile-list
                  (directory-files
                   default-directory nil mode-compile-makefile-regexp t))))
         (make-regexp
          (concat "^" (my/remove-extension (buffer-name)) ".*" ": " ".*\n"
                  "\\(	.*" "\n\\)" "\\{1,\\}"))
         makefile-content
         target)
    (when makefile
      (save-excursion
        (with-temp-buffer
          (find-file makefile)
          (setq makefile-content (buffer-string))
          (when (string-match make-regexp makefile-content)
            (setq target (match-string 0 makefile-content))))))
    (switch-to-buffer (get-buffer-create base-buffer))
    target))

(defun my/remove-extension (file)
  (interactive)
  (let ((ext (file-name-extension file)))
    (replace-regexp-in-string (concat "\." ext "$") "" file)))

(defun my/exist-makefile-p ()
  (interactive)
  (and
   (my/get-makefile-target)
   (not current-prefix-arg)))

(defadvice mc--makefile-to-use
  (around ad-mc-makefile-to-use activate)
  (if (my/exist-makefile-p)
      ad-do-it
    nil))

(provide 'init_mode-compile)
