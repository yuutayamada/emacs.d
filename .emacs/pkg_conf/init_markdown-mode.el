;;; init_markdown-mode.el --- init file for markdown-mode
;;; Commentary:
;;; Code:

(require 'markdown-mode)

(let ((gfm-css "~/local/vcs/github.com/sindresorhus/github-markdown-css/github-markdown.css"))
  (when (file-exists-p gfm-css)
    (setq markdown-css-paths `(,gfm-css))))

;;;###autoload
(add-to-list 'auto-mode-alist
             (cons "\\(?:\\.\\(?:\\(?:m\\(?:arkdown\\|d\\(?:own\\)?\\|kdn?\\)\\)\\)\\)\\'" 'gfm-mode))

;;;###autoload
(add-hook 'with-editor-mode-hook ; on magit commit buffer, activates GFM.
          '(lambda ()
             (when (string-match
                    (rx (or "PULLREQ_EDITMSG" "COMMIT_EDITMSG" "TAG_EDITMSG"))
                    (buffer-name))
               (gfm-mode))))

;; http://stackoverflow.com/questions/7694887/is-there-a-command-line-utility-for-rendering-github-flavored-markdown
(add-hook 'markdown-mode-hook
          '(lambda ()
             (when (eq 'markdown-mode major-mode) (gfm-mode))
             (mykie:set-keys markdown-mode-map "M-n" "M-p")))

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
