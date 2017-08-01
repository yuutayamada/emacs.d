;;; init_dired.el --- init file for dired.el
;;; Commentary:
;; 2015/08/07 - I removed wdired because I could use "r" key bind without it.
;;; Code:

(require 'mykie)

(require 'el-get)
(el-get-bundle! image-dired+)

;; Do not pass "--dired" option because often it destructs my dired buffer, so..
;; Probably it related to following error (but not sure...):
;;   "Wrong type argument: number-or-marker-p, //DIRED-OPTIONS//"
(defconst dired-use-ls-dired nil)

(require 'dired)
(require 'dired-x) ; dired extra library made by Sebastian Kremer

;; omit needless files
(add-hook 'dired-mode-hook 'dired-omit-mode)

(require 'rx)
(defconst dired-omit-files ; omit byte files too
 (apply
   `((lambda ()
      (rx (or (and line-start
                   (or (and (0+ ".") "#")
                       (and "." (0+ ".") line-end)))
              (and (or ,@completion-ignored-extensions) line-end)))))))

;; image dired+
(add-hook 'dired-mode-hook 'image-diredx-async-mode)
(defconst image-dired-gallery-dir "/tmp")

;; key binds
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
  [tab]      (Y-open-file-as-root (dired-file-name-at-point))
  "r"        wdired-change-to-wdired-mode
  "C-o"      ; nil
  "C-c C-c"  compile
  "o"        (popwin:find-file (dired-get-file-for-visit)))

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
