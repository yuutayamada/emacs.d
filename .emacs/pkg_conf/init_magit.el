;;; init_magit.el --- init file for magit.el -*- lexical-binding: t; -*-
;;; Commentary:

;; This configuration can not move el-get pkg configuration directory

;;; Code:

(require 'Y-autoload)
(el-get 'sync 'magit) ; 'with-editor

(require 'magit)
;; nil    never show fine differences.
;; t      show fine differences for the current diff hunk only.
;; ‘all’  show fine differences for all displayed diff hunks.
(defconst magit-diff-refine-hunk t)

(define-key magit-status-mode-map (kbd "S-SPC") 'magit-diff-show-or-scroll-down)
(define-key magit-log-mode-map    (kbd "S-SPC") 'magit-diff-show-or-scroll-down)
(define-key magit-status-mode-map (kbd "A-i")   (lookup-key magit-status-mode-map (kbd "C-i")))

(advice-add 'magit-push-popup :before 'Y/ssh-add)

;;;###autoload
(defun Y/magit-status ()
  "Call `magit-status'."
  (interactive)
  (let ((default-directory default-directory))
    (Y/magit-jump-to-g-window)
    (call-interactively 'magit-status)))

;; Set buffer switch function
(defun Y/magit-jump-to-g-window ()
  "Jump to g window of windows.el."
  (unless (eq ?g (Y/win-current-alpha))
    (Y/win-switch-window ?g) ; jump to 'g' window
    (when (not (one-window-p))
      (delete-other-windows)
      (split-window-horizontally))))

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
