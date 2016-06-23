;;; init-auto-async-byte-compile.el --- init file for auto-async-byte-compile.el

;;; Commentary:

;; To byte-compile el file, needs adding below code before load the .el file.
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;;; Code:
(defconst my/emacs-program
  (let ((emacs-dev
         (format "%s/git.savannah.gnu.org/emacs/src/emacs"
                 (shell-command-to-string "echo -n `ghq root`"))))
    (if (executable-find emacs-dev)
        emacs-dev
      "emacs")))

(advice-add 'aabc/emacs-command :override (lambda () my/emacs-program))

(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")

(provide 'init-auto-async-byte-compile)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init-auto-async-byte-compile.el ends here
