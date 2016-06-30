;;; Y-modeline.el --- mode line customization-*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(require 'let-alist)

(defvar Y/mode-line-timer-obj nil)
(defvar Y/mode-line-color-alist
  '((default :background "#5f00ff" :foreground "white")
    (picture :background "yellow"  :foreground "white")
    (multiple-cursor :background "#5f87ff" :foreground "white")
    ;; For Evil
    (emacs   :background "#5c5cff" :foreground "white")
    (normal  :background "#e80000" :foreground "white")
    (insert  :background "#00cd00" :foreground "white")
    (visual  :background "#006fa0" :foreground "white")
    (replace :background "#00af87" :foreground "black")))

(defun Y/mode-line-color-get-attribute ()
  ""
  (or
   (when (and (eq major-mode 'picture-mode)
              (or (eq (bound-and-true-p evil-state) 'emacs)
                  (not (or (bound-and-true-p evil-mode)
                           (bound-and-true-p evil-local-mode)))))
     'picture)
   (when (bound-and-true-p multiple-cursors-mode)
     'multiple-cursor)
   (if (or (bound-and-true-p evil-mode)
           (bound-and-true-p evil-local-mode))
       (bound-and-true-p evil-state))
   'default))

(defun Y/compute-mode-line-color ()
  ""
  (let* ((current (face-attribute 'mode-line :background))
         (attrbs (assoc-default (Y/mode-line-color-get-attribute)
                                Y/mode-line-color-alist))
         (new-color (plist-get attrbs :background)))
    (unless (equal current new-color)
      (apply `((lambda ()
                 (set-face-attribute 'mode-line nil ,@attrbs))))))
  (setq Y/mode-line-timer-obj nil))

;;;###autoload
(defun Y/update-mode-line-bg (&rest _r)
  "Update mode line background color."
  (unless Y/mode-line-timer-obj
    (setq Y/mode-line-timer-obj
          (run-with-timer 0.1 nil 'Y/compute-mode-line-color)))
  "")

(advice-add 'evil-refresh-cursor :after 'Y/update-mode-line-bg)

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
