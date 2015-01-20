;;; my_paths.el --- Configuration for directory variables of my Emacs

;;; Commentary:
;;; Code:

(let* ((branch
        (expand-file-name
         (format "%s../" (car (split-string (getenv "EMACSLOADPATH") ":")))))
       (user-dir (expand-file-name user-emacs-directory)))
  (defconst yy/branch branch)
  ;; For My Emacs lisp configuration
  (defconst config-dir                   (format "%s.emacs/" branch))
  (defconst package-conf-dir             (format "%spkg_conf/"       config-dir))
  (defconst custom-file                  (format "%semacs-custom.el" config-dir))
  (defconst custom-theme-directory       (format "%sstyle/themes"    config-dir))
  (defconst skk-init-file                (concat package-conf-dir "init_skk"))
  ;; For external Emacs lisp library
  (defconst elisp-dir                    (format "%selisp/" branch))
  (defconst el-get-dir                   (format "%sel-get/"  elisp-dir))
  (defconst package-dir                  (format "%spackage/" elisp-dir))
  (defconst package-user-dir             (format "%spackage/" elisp-dir))
  ;; Override some variables
  (when (not (string= user-dir (expand-file-name "~/emacs.d")))
    (defconst eshell-directory-name        (format "%s.eshell/"     user-dir))
    (defconst save-place-file              (format "%s.save-places" user-dir))
    (defconst auto-save-list-file-name     (format "%sauto-save-list/.saves-"
                                                   user-dir))
    (defconst recentf-save-file            (format "%s.recentf"  user-dir))
    (defconst savehist-file                (format "%s.savehist" user-dir))))

(provide 'my_paths)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_paths.el ends here
