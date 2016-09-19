;;; init_grep.el --- init file for grep
;;; Commentary:
;;; Code:

(require 'grep)
(require 'thingatpt)

(el-get 'sync 'wgrep)

(defun Y/grep-jump-to-file ()
  "Sadly my ‘compile-goto-erorr’ doesn't work now...
So, I made my own."
  (interactive)
  (let ((file (thing-at-point 'filename)))
    (when file
      (when (string-match (rx (group (1+ any)) ":" (group (1+ num)) ":") file)
        (let ((f (match-string 1 file))
              (n (match-string 2 file))
              (dir default-directory))
          (windmove-left)
          (find-file (format "%s%s" dir f))
          (goto-char (point-min))
          (forward-line (string-to-number n)))))))

(define-key grep-mode-map (kbd "RET") 'Y/grep-jump-to-file)

;;; For ag command
(add-to-list 'grep-mode-font-lock-keywords
             '("^[~/].*\n"
               (0 compilation-info-face nil t)))
(add-to-list 'grep-mode-font-lock-keywords
             '("^\\([0-9]*\\):\\(.*\\)\n"
               (1 compilation-warning-face)))

;; Use ag if the command is exist, otherwise use grep
(defconst grep-command-before-query
  (cond
   ((zerop (shell-command "which pt"))
    "pt --nogroup --nocolor -U -S -e ")
   ((zerop (shell-command "which ag"))
    "ag --nogroup -a -S ")
   ;; Recursive grep by -r
   (t "grep -nH -r -e ")))

(defun grep-default-command ()
  "Define default grep command.  See also `grep-command'."
  (let* ((grep-read-from-point
          (let ((grep-command-before-target
                 (concat grep-command-before-query
                         (shell-quote-argument (grep-tag-default)))))
            (cons (if buffer-file-name
                      (concat grep-command-before-target
                              " *."
                              (file-name-extension buffer-file-name))
                    (concat grep-command-before-target " ."))
                  (1+ (length grep-command-before-target))))))
    grep-read-from-point))

(setq grep-command (cons (concat grep-command-before-query "\"\" .")
                         (+ (length grep-command-before-query) 2)))

;; (require 'init_grep-a-lot)

(provide 'init_grep)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_grep.el ends here
