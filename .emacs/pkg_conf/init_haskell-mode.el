;;; init_haskell-mode.el --- init file for Haskell
;;; Commentary:

;;; Code:

;; basic types
;; Int Integer Float Double
;; haskell basic type class
;; Eq Ord Show Read Enum Bounded Num Floating Integral

;; Haskell ghc-mod
(let ((ghc-mod-elisp
       (concat (getenv "XDG_DATA_HOME")
               "/cabal/share/x86_64-linux-ghc-7.6.3/ghc-mod-5.2.1.2")))
  (when (file-directory-p ghc-mod-elisp)
    (add-to-list 'load-path (expand-file-name ghc-mod-elisp))))

(require 'cl-lib)
(require 'haskell-mode)
(require 'haskell-mode-autoloads)
(require 'Y-autoload)
(require 'helm-hoogle)

(require 'haskell-customize)
(setq haskell-process-suggest-remove-import-lines t
      haskell-process-auto-import-loaded-modules t
      haskell-tags-on-save t)

(add-hook 'haskell-mode-hook
          (lambda ()
            ;; hi2 -- haskell-indentation package
            (turn-on-hi2)
            (haskell-doc-mode t)
            ;; (define-key haskell-mode-map [f8] 'haskell-navigate-imports)
            (unless (or (org-in-src-block-p)
                        (string-match "^\\*Org Src .*\\*" (buffer-name)))
              (ghc-init)
              (mykie:set-keys haskell-mode-map
                "M-n" "M-p" "C-c C-c"))))

;; https://github.com/m2ym/auto-complete
(require 'auto-complete)
(ac-define-source ghc-mod
  '((depends ghc)
    (candidates . (ghc-select-completion-symbol))
    (symbol . "s")
    (cache)))

(defun Y/ac-haskell-mode ()
  "Set auto-complete candidates for haskell."
  (setq ac-sources '(ac-source-words-in-same-mode-buffers
                     ac-source-dictionary ac-source-ghc-mod)))

(add-hook 'haskell-mode-hook 'Y/ac-haskell-mode)

(defun Y/ac-haskell-init ()
  "Init auto-complete sources for haskell-mode when you open a file."
  (when (eq 'haskell-mode major-mode)
    (auto-complete-mode t)
    (setq ac-sources '(ac-source-words-in-same-mode-buffers
                       ac-source-dictionary ac-source-ghc-mod))))

(add-hook 'find-file-hook 'Y/ac-haskell-init)

;; (require 'haskell-commander)
;; (require 'hooglel)

;; ;; work around to avoid invalid function mykie:set-keys
;; (require 'init_mykie)

;; (defadvice newline-and-indent
;;   (around use-haskell-indent activate)
;;   "Use haskell-newline-and-indent if haskell-mode."
;;   (if (eq 'haskell-mode major-mode)
;;       (haskell-newline-and-indent)
;;     ad-do-it))

;; (defadvice haskell-indentation-mode
;;   (around override-key-by-mykie activate)
;;   "Override key-binds of `haskell-indentation-mode' by `mykie'."
;;   ad-do-it
;;   (mykie:attach-mykie-func-to 'haskell-indentation-mode))

;; (defun my/runghc ()
;;   "Run code."
;;   (interactive)
;;   (lexical-let ((file (buffer-name)))
;;     (if (or (org-src-edit-buffer-p)
;;             (string-match "\\.hs$" file))
;;         (async-shell-command (format "runghc %s" file)))))

;; (defvar helm-c-source-ghc-mod
;;   '((name   . "ghc-browse-document")
;;     (init   . helm-c-source-ghc-mod)
;;     (candidates-in-buffer)
;;     (action . (("Open" . helm-c-source-ghc-mod-action)))))

;; (defun helm-c-source-ghc-mod ()
;;   "Source for ghc-mode."
;;   (unless (executable-find "ghc-mod")
;;     (error "ghc-mod not found"))
;;   (let ((buffer (helm-candidate-buffer 'global)))
;;     (with-current-buffer buffer
;;       (call-process "ghc-mod" nil t t "list"))))

;; (defun helm-c-source-ghc-mod-action (candidate)
;;   "Action for `helm-ghc-browse-document'.  Search from CANDIDATE."
;;   (interactive "P")
;;   (let* ((pkg (ghc-resolve-package-name candidate)))
;;     (with-no-warnings
;;       (mykie:aif (and pkg candidate)
;;           (ghc-display-document pkg it nil)
;;         (message "Document not found")))))

;; (defun helm-ghc-browse-document ()
;;   "Browse document by helm."
;;   (interactive)
;;   (helm
;;    :sources helm-c-source-ghc-mod
;;    :buffer "*helm haskell*"))


(provide 'init_haskell-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_haskell-mode.el ends here
