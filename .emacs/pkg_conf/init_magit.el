;;; init_magit.el --- init file for magit.el -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
;; 65->90  (A to Z)
;; 91->96  ("[" "\\" "]" "^" "_" "`")
;; 97->122 (a to z)

;; nil    never show fine differences.
;; t      show fine differences for the current diff hunk only.
;; ‘all’  show fine differences for all displayed diff hunks.
(defconst magit-diff-refine-hunk t)

(require 'magit)

(defadvice magit-push (around ad-ssh-add-if-it-was-needed activate)
  "Do ssh-add if it is needed."
  (my/ssh-add)
  ad-do-it)

;; TODO: check later
;; 1 -> (magit-mode-get-buffer "*magit-rev: %a*" magit-revision-mode)
;; 1 <- magit-mode-get-buffer: !non-local\ exit!

;; Set buffer switch function
(setq magit-status-buffer-switch-function
      '(lambda (buffer)
         (setq-local magit-restore-window-configuration (current-window-configuration))
         (switch-to-buffer buffer)
         (when (not (one-window-p))
           (delete-other-windows))))

(defadvice with-editor-finish (around Y/go-back-to-magit-status activate)
  "Go back ‘magit-status’ if there are other un-staged things."
  (let ((dir default-directory))
    ad-do-it
    (when (magit-anything-unstaged-p)
      (magit-status-internal dir))))

(provide 'init_magit)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_magit.el ends here
