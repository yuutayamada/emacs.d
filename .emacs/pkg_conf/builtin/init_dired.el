;;; init_dired.el --- init file for dired.el
;;; Commentary:
;;; Code:

(require 'wdired)
(require 'init_image-dired+)
(require 'mykie)

(mykie:set-keys dired-mode-map
  "SPC"
  :default   dired-omit-mode
  :C-u       dired-dotfiles-toggle
  "RET"      dired-find-file
  "/"        dired-isearch-filenames-regexp
  "I"        (image-dired-show-all-from-dir default-directory)
  "'"        helm-ag-r-from-git-repo
  "="        dired-up-directory
  "C-t"      dired-display-file
  "M-RET"    my/multi-term-current-buffer
  [tab]      (Y-open-file-as-root (dired-file-name-at-point))
  "r"        wdired-change-to-wdired-mode
  "C-o"      nil
  "C-c C-c"  compile
  "o"        :default (lambda ()
                        (interactive)
                        (popwin:find-file (dired-get-file-for-visit))))

(defun Y-open-file-as-root (filename)
  "Open file of FILENAME as root."
  (interactive "f")
  (when (y-or-n-p "Do you want to open as Root? ")
    (set-buffer (find-file (format "/sudo::%s" filename)))))

;; I stole from http://www.emacswiki.org/emacs/DiredOmitMode
(defvar-local dired-dotfiles-show-p t)
(defun dired-dotfiles-toggle ()
  "Show/hide dot-files."
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if dired-dotfiles-show-p
        (progn
          (dired-mark-files-regexp "^\\\.")
          (dired-do-kill-lines)
          (setq-local dired-dotfiles-show-p nil))
      ;; otherwise just revert to re-show
      (revert-buffer)
      (setq-local dired-dotfiles-show-p t))))

(provide 'init_dired)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_dired.el ends here
