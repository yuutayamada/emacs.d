;;; Y-paths.el --- Configuration for directory variables of my Emacs -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

;; Use XDG_CONFIG_HOME as personal configuration file
(let* ((emacs-conf-dir (format "%s/emacs/" (getenv "XDG_CONFIG_HOME")))
       (emacsrc (format "%semacsrc" emacs-conf-dir)))
  (when (file-exists-p emacsrc)
    (defconst user-emacs-directory emacs-conf-dir)
    (load emacsrc)))

(defconst user-init-file (locate-library "default"))
(defconst config-dir (file-name-directory user-init-file))
(let* ((branch    (substring config-dir 0 (- (length config-dir) 7)))
       (user-dir  (expand-file-name user-emacs-directory))
       (cache-dir (format "%s/emacs/" (getenv "XDG_CACHE_HOME"))))
  (defconst yy/branch branch)
  ;; For My Emacs lisp configuration
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
    (defconst savehist-file                (format "%s.savehist" user-dir))
    (defconst bookmark-default-file        (format "%sbookmarks" cache-dir))
    (defconst mew-rc-file (format "%srcfiles/init-mew" package-conf-dir))
    (defconst kkc-init-file-name (format "%srcfiles/init-kkc" package-conf-dir)))

  ;; Yasnippet: set those variables to avoid loading again
  (defconst yas-snippet-dirs
    `(,(concat user-emacs-directory "snippets")
      ,(concat el-get-dir "yasnippet/yasmate/snippets")
      ,(concat el-get-dir "yasnippet/snippets"))))

(provide 'Y-paths)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-paths.el ends here
