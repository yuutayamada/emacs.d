;;; init_paredit.el --- init file for paredit.el

;;; Commentary:

;;; Code:

(require 'Y-autoload)
(el-get 'sync 'paredit)
(require 'paredit)

;; Delete duplicated keybinds form paredit-map
(cl-loop with binds = '("C-j" "C-d" "M-s" "M-;" "C-M-n" "C-M-p" "M-r" "C-k" ";"
                        "M-q")
         for keybind in binds
         do (define-key paredit-mode-map (kbd keybind) nil))

(provide 'init_paredit)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_paredit.el ends here
