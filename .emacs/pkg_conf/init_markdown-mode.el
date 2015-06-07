;;; init_markdown-mode.el --- init file for markdown-mode
;;; Commentary:
;;; Code:
(require 'markdown-mode)

;; http://stackoverflow.com/questions/7694887/is-there-a-command-line-utility-for-rendering-github-flavored-markdown
(add-hook 'markdown-mode-hook
          '(lambda ()
             (mykie:set-keys markdown-mode-map
               "M-[" "M-n" "M-p")))

(provide 'init_markdown-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_markdown-mode.el ends here
