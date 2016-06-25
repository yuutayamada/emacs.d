;;; default.el --- Yuta's Emacs init file -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; Custom variables ;;
(load "emacs-custom")

(require 'Y-autoload)

;; Sync all packages for el-get. ‘el-get’ function registers
;; load-path, path of init-PKGNAME.el.
;; Note that sometimes el-get’s .loaddefs.el might break, so check
;; the file if you caught suspicious behavior (probably you can solve
;; by "el-get-update package")
(let ((el-get-is-lazy t) ; because my_autoload.el ‘require’ .loaddefs.el
      (done ; wait until the sync is done
       (prog1 'sync-completed
         (el-get 'sync
                 '(windows ; load windows.el before mykie
                   s f dash tabbar popwin auto-capitalize wgrep
                   multiple-cursors
                   ;; flycheck
                   flycheck flycheck-tip
                   ;; key binds
                   evil seqcmd
                   ;; Magit
                   magit with-editor
                   ;; auto completion
                   company-mode auto-complete
                   ;; see also init-helm there is another (el-get ’sync ...)
                   helm)))))

  (when done
    ;; Color and Frame config ;;
    (if (not (daemonp))
        ;; Regular Emacs
        (Y/frame-init-func)
      ;; Daemon Emacs ;;
      (when (equal 1 (length (frame-list)))
        (set-frame-name "root") ; Name "root" as base frame name. (emacs --daemon)
        (add-hook 'after-make-frame-functions 'Y/frame-init-func)))

    ;; PACKAGE.el ;;
    ;; ‘package--ensure-init-file’ check this ‘package-initialize’s existence in
    ;; ‘user-init-file’. If you omit this, you can not use ‘package-install’.
    (package-initialize)))

(provide 'default)
;;; default.el ends here
