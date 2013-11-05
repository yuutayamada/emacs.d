;;; init_haskell-mode.el --- init file for Haskell

;; Copyright (C) 2013 by Yuta Yamada

;; Author: Yuta Yamada <cokesboy"at"gmail.com>

;;; License:
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;; Commentary:

;;; Code:

;; basic types
;; Int Integer Float Double
;; haskell basic type class
;; Eq Ord Show Read Enum Bounded Num Floating Integral

;; Haskell ghc-mod
(let ((ghc-mod "~/.cabal/share/ghc-mod-3.1.3/"))
  (when (file-directory-p ghc-mod)
    (add-to-list 'load-path (expand-file-name ghc-mod))))

(require 'cl-lib)
(require 'haskell-mode-autoloads)
(require 'my_autoload)
(require 'haskell-commander)
(require 'hooglel)

;; work around to avoid invalid function mykie:set-keys
(require 'init_mykie)

(defadvice newline-and-indent
  (around use-haskell-indent activate)
  "Use haskell-newline-and-indent if haskell-mode."
  (if (eq 'haskell-mode major-mode)
      (haskell-newline-and-indent)
    ad-do-it))

(defadvice haskell-indentation-mode
  (around override-key-by-mykie activate)
  "Override key-binds of `haskell-indentation-mode' by `mykie'."
  ad-do-it
  (mykie:attach-mykie-func-to 'haskell-indentation-mode))

(defun my/runghc ()
  "Run code."
  (interactive)
  (lexical-let ((file (buffer-name)))
    (if (or (org-src-edit-buffer-p)
            (string-match "\\.hs$" file))
        (async-shell-command (format "runghc %s" file)))))

(defvar helm-c-source-ghc-mod
  '((name   . "ghc-browse-document")
    (init   . helm-c-source-ghc-mod)
    (candidates-in-buffer)
    (action . (("Open" . helm-c-source-ghc-mod-action)))))

(defun helm-c-source-ghc-mod ()
  "Source for ghc-mode."
  (unless (executable-find "ghc-mod")
    (error "ghc-mod not found"))
  (let ((buffer (helm-candidate-buffer 'global)))
    (with-current-buffer buffer
      (call-process "ghc-mod" nil t t "list"))))

(defun helm-c-source-ghc-mod-action (candidate)
  "Action for `helm-ghc-browse-document'.  Search from CANDIDATE."
  (interactive "P")
  (let* ((pkg (ghc-resolve-package-name candidate)))
    (with-no-warnings
      (mykie:aif (and pkg candidate)
          (ghc-display-document pkg it nil)
        (message "Document not found")))))

(defun helm-ghc-browse-document ()
  "Browse document by helm."
  (interactive)
  (helm
   :sources helm-c-source-ghc-mod
   :buffer "*helm haskell*"))

(defface my/lambda-face
  '((t (:foreground "#Eeee00" :font "Droid Sans Mono-7"
        :bold t :italic t :box "#Eeee00" :height 80
        :underline t :inherit font-lock-function-name-face)))
  "My lambda face" :group 'font-lock)

;; http://stackoverflow.com/questions/10465767/default-lambda-symbol-in-emacs-haskell-mode
(defun pretty-lambdas-haskell ()
  "Make `font-lock-keywords' for haskell's lambda i.e., backslash."
  (let ((backslash (concat "\\(" (regexp-quote "\\") "\\)")))
    (font-lock-add-keywords
     nil `((,backslash
            (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                      ,(make-char 'greek-iso8859-7 107))
                      'my/lambda-face)))))))

(eval-after-load 'haskell-font-lock
  '(setq haskell-font-lock-symbols-alist
         (delq nil
               (cl-mapcar (lambda (rewrite)
                            (if (member (car rewrite) '("->" "<-"))
                                nil rewrite))
                          haskell-font-lock-symbols-alist))))

(add-hook 'haskell-mode-hook
          (lambda ()
            (turn-on-haskell-indentation)
            (pretty-lambdas-haskell)
            (unless (or (org-in-src-block-p)
                        (string-match "^\\*Org Src .*\\*" (buffer-name)))
              (ghc-init)
              (mykie:set-keys haskell-mode-map
                "M-n" nil
                "M-p" nil
                "C-c C-c" nil))))

(provide 'init_haskell-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_haskell-mode.el ends here
