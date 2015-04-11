;;; init_filecache.el --- init file for filecache.el
;;; Commentary:
;;; Code:

;; TODO: fix this style
(require 'my_paths)
(defconst my/filecache-directories
  `((:recursive . (,config-dir
                   "~/share/doc/study/"
                   "~/share/doc/cheat_sheets/"
                   ,(expand-file-name (concat user-emacs-directory "../"))
                   ,package-conf-dir))
    (:normal . ("~/" ,elisp-dir))))

(require 'filecache)
(require 'cl-lib)

(setq file-cache-filter-regexps
      (append file-cache-filter-regexps
              ;; 無視したいファイルの正規表現を指定もできる
              '("^\\.#" "\\.cache$" "\\.tdb$")))

(cl-loop for (s . dirs) in my/filecache-directories
         if (eq s :recursive)
         do (mapc (lambda (dir) (file-cache-add-directory-recursively dir))
                  dirs)
         if (eq s :naormal)
         do (file-cache-add-directory-list dirs))

(require 'ido)
(defconst Y/ghq-root (shell-command-to-string "echo -n `ghq root`"))

;;;###autoload
(defun Y/filecache-ido-find-file ()
  "My file cache find-file."
  (interactive)
  (let* ((list (append file-cache-alist ido-virtual-buffers))
         (filename
          (substring-no-properties
           (ido-completing-read "cache: " list)))
         (tmp-file-name (assoc-default filename list))
         (file (cl-typecase tmp-file-name
                 (string tmp-file-name)
                 (list (cl-case (length tmp-file-name)
                         (1 (format "%s%s" (car tmp-file-name) filename))
                         (t (format "%s%s" (ido-completing-read "where? " tmp-file-name)
                                    filename)))))))
    (cond ((file-exists-p file)
           (find-file file))
          ((bufferp (get-buffer file))
           (switch-to-buffer (get-buffer file))))))

(provide 'init_filecache)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_filecache.el ends here
