;;; init_markdown-mode.el --- init file for markdown-mode
;;; Commentary:
;;; Code:
(require 'markdown-mode)

;; http://stackoverflow.com/questions/7694887/is-there-a-command-line-utility-for-rendering-github-flavored-markdown
(add-hook 'markdown-mode-hook
          '(lambda ()
             (mykie:set-keys markdown-mode-map
               "M-[" "M-n" "M-p")
             (when (let ((dir (locate-dominating-file buffer-file-name ".git")))
                     (and dir (not (equal "~/" dir))))
               (gfm-mode))))

;; memo: install grip > ‘pip3 install grip‘
(defvar Y/markdown-process nil)
(defun Y/markdown-preview (&rest _)
  "Preview markdown file by using grip."
  (let ((gfm (if (eq major-mode 'gfm-mode) "--gfm" "")))
    (when (process-live-p Y/markdown-process)
      (kill-process Y/markdown-process))
    (setq Y/markdown-process
          (start-process-shell-command "emacs-markdown-preview"
                                       markdown-output-buffer-name
                                       (format "grip --browser %s %s" gfm buffer-file-name)))
    (run-with-timer 10 ; sec
                    nil (lambda ()
                          (when (process-live-p Y/markdown-process)
                            (kill-process Y/markdown-process))))))

;; Use advice to use preview at both markdown-mode and gfm-mode.
(when (executable-find "grip")
  (advice-add 'markdown-preview :override 'Y/markdown-preview))

(provide 'init_markdown-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_markdown-mode.el ends here
