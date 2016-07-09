;;; Y-modeline.el --- mode line customization-*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(require 'let-alist)

;;; shorten mode-name of mode-line
;; -- http://d.hatena.ne.jp/syohex/20130131/1359646452 --
;; memo:; http://unicode-table.com/en/search/?q=symbol
(defconst mode-line-cleaner-alist
  `((minor
     . ((abbrev-mode                . "")
        ;; (auto-complete-mode         . " AC")
        (auto-fill-mode             . " ⏎")
        (auto-revert-mode           . " ↻")
        (auto-capitalize-mode       . " a⇒A")
        (company-mode               . " ℅") ; c/o
        (helm-mode                  . " ⎈")
        (hs-minor-mode              . "")
        (elisp-slime-nav-mode       . " EN")
        (eldoc-mode                 . " ed")
        (indent-guide-mode          . " ⊨")
        (flyspell-mode              . " S!")
        (flycheck-mode              . " !") ; ⚠
        (flymake-mode               . " M!")
        (git-gutter-mode            . "")
        (helm-gtags-mode            . "")
        (outline-minor-mode         . "")
        (paredit-mode               . "")
        (ruby-block-mode            . "")
        (server-buffer-clients      . "")
        (superword-mode             . "")
        (subword-mode               . "")
        (undo-tree-mode             . "")
        (view-mode                  . " Vw")
        (whitespace-mode            . " ▒")
        (yas-minor-mode             . " ⓨ")
        (yas-global-mode            . " ⓨ")))
    (major
     . ((cfw:calendar-mode          . "Cfw")
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
        (emacs-lisp-mode            . "EL")
        (markdown-mode              . "Md")))
    (major-gui
     . ((nim-mode                   . " 🐻") ; or ♔
        (rust-mode                  . " ₨")
        (go-mode                    . " ʕ◔ϖ◔ʔ")
        (web-mode                   . " ₩")
        (twittering-mode            . " 🐦") ; or ™
        (java-mode                  . " ☕") ; or  ⛾
        ))))

;;;###autoload
(defun Y/clean-mode-line ()
  "Use specified abbreviation of mode-line-name by `mode-line-cleaner-alist'."
  (interactive)
  (let-alist mode-line-cleaner-alist
    (cl-loop for (mode . mode-str) in .minor do
             (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
               (when old-mode-str
                 (setcar old-mode-str mode-str))))
    (cl-loop with m = (if (display-graphic-p) .major-gui .major)
             for (mode . mode-str) in m
             if (eq mode major-mode) do
             (setq mode-name mode-str)
             (cl-return))))

(provide 'Y-modeline)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-modeline.el ends here
