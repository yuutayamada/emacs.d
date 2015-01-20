;;; init_dired.el --- init file for dired.el

;;; Commentary:

;;; Code:

(require 'wdired)
(require 'init_image-dired+)
(require 'mykie)

(mykie:set-keys dired-mode-map
  "RET"     :default dired-find-file
  "/"       :default dired-isearch-filenames-regexp
  "I"       :default (image-dired-show-all-from-dir default-directory)
  "'"       :default helm-ag-r-from-git-repo
  "="       :default dired-up-directory
  "C-t"     :default dired-display-file
  "M-RET"   :default my/multi-term-current-buffer
  [tab]     :default (Y-open-file-as-root (dired-file-name-at-point))
  "r"       :default wdired-change-to-wdired-mode
  "C-o"
  "C-c C-c" :default compile
  "o"       :default (lambda ()
                       (interactive)
                       (popwin:find-file (dired-get-file-for-visit))))

(defun Y-open-file-as-root (filename)
  "Open file of FILENAME as root."
  (interactive "f")
  (when (y-or-n-p "Do you want to open as Root? ")
    (set-buffer (find-file (format "/sudo::%s" filename)))))

(provide 'init_dired)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_dired.el ends here
