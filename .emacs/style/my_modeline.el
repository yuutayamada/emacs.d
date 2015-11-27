;;; my_modeline.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;; shorten mode-name of mode-line
;; -- http://d.hatena.ne.jp/syohex/20130131/1359646452 --
(defconst mode-line-cleaner-alist
  `(;; You can check by ‘minor-mode-alist’.
    (abbrev-mode                . "")
    (auto-fill-mode             . " ⏎")
    (company-mode               . "")
    (auto-capitalize            . "")
    (elisp-slime-nav-mode       . " EN")
    (eldoc-mode                 . "")
    (flyspell-mode              . " Fs")
    (flycheck-mode              . " ↻")
    (flymake-mode               . ,(propertize
                                    " ■" 'face '(((:foreground "red")))))
    (git-gutter-mode            . "")
    (helm-gtags-mode            . " HG")
    (highlight-indentation-mode . "")
    (outline-minor-mode         . "")
    (paredit-mode               . " Pe")
    (ruby-block-mode            . "")
    (superword-mode             . " ²")
    (subword-mode               . " ,")
    (undo-tree-mode             . "")
    (view-mode                  . " Vw")
    (whitespace-mode            . ,(propertize
                                    " ■" 'face '(((:foreground "white")))))
    (yas-minor-mode             . " Ys")
    (yas-global-mode            . " YS")
    ;; Major modes
    (cfw:calendar-mode          . "Cfw")
    (html-mode                  . "HT")
    (web-mode                   . "WB")
    (mmm-mode                   . "MM")
    (js2-mode                   . "J2")
    (org-mode                   . "Og")
    (text-mode                  . "Tx")
    (lisp-interaction-mode      . "Li")
    (fundamental-mode           . "Fu")
    (python-mode                . "Py")
    (ruby-mode                  . "RB")
    (outline-mode               . "Ol")
    (sh-mode                    . "SH")
    (emacs-lisp-mode            . "El")
    (markdown-mode              . "Md")))

;;;###autoload
(defun Y/clean-mode-line ()
  "Use specified abbreviation of mode-line-name  by `mode-line-cleaner-alist'."
  (interactive)
  (when (bound-and-true-p mode-line-cleaner-alist)
    (cl-loop for (mode . mode-str) in mode-line-cleaner-alist
             do
             (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
               (when old-mode-str
                 (setcar old-mode-str mode-str))
               (when (eq mode major-mode)
                 (setq mode-name mode-str))))))

(setq-default mode-line-format
              '((line-number-mode "L%l/")
                (column-number-mode "C%c-")
                (:eval (if (fboundp 'gnus-mst-notify-modeline-form)
                           (gnus-mst-notify-modeline-form)))
                mode-line-buffer-identification
                display-time-string
                mode-line-mule-info
                mode-line-modified
                " %[("
                mode-name
                (which-func-mode ("" which-func-format "-"))
                mode-line-process
                minor-mode-alist
                "%n" ")%]-"
                (-3 . "%p")
                "-%-"))

(provide 'my_modeline)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_modeline.el ends here
