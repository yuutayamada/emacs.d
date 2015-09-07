;;; init_ido.el --- init file for ido.el

;;; Commentary:
;; This is most useful article I've ever seen : http://www.masteringemacs.org/article/introduction-to-ido-mode
;; http://wikemacs.org/wiki/Ido
;; Usage Memo
;; C-s next candidate
;; C-r previous candidate
;; TAB | show possible candidates
;; C-j | create as new file
;; C-a | show hidden buffer like .xxx or
;; C-t | toggle enabling regexp

;; IDO's keymap:
;; `ido-common-completion-map', `ido-file-dir-completion-map',
;; `ido-file-completion-map' and `ido-buffer-completion-map'.

;;; Code:
;; source code: http://www.cua.dk/ido.el
(require 'ido)
(ido-mode t)

(setq ido-file-extensions-order
      '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".conf" ".html"))

(setq
 ;; enable fuzzy matching
 ido-enable-flex-matching t
 ;; you can toggle by C-t
 ido-enable-regexp t
 ;; ido-max-work-directory-list 300
 ;; do not hide dot files
 ido-enable-dot-prefix nil
 ido-enable-prefix nil)

(ido-everywhere t)

(when (executable-find "ghq")
  (defvar Y/ghq-dirs
    (cl-loop for dir in (split-string (shell-command-to-string "ghq list -p") "\n")
             collect dir)))

(require 'cl-lib)
;; Toggle feature ;;
(defun Y/ido-toggle ()
  "Toggle ido file and buffer."
  (interactive)
  (cl-case (bound-and-true-p ido-cur-item)
    (file
     (call-interactively 'ido-enter-switch-buffer))
    (buffer
     (call-interactively 'ido-enter-find-file))))

(provide 'init_ido)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ido.el ends here
