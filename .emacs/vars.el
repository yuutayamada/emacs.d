;;; vars.el --- init file for variables

;;; Commentary:

;;; Code:
(require 'cl-lib)
(require 'my_paths)
(require 'my_util)

(let ((dev (concat elisp-dir "self/"))
      ;; for Emacs -Q option
      (sitelisp "/usr/share/emacs/site-lisp/"))
  (my/add-load-path-subdir
   `(,el-get-dir ,package-dir ,config-dir ,dev ,sitelisp)))

;; MEMO prerequisite el-get-package
;; mykie grep-a-lot image-dired+ capitalizer slime s keyboard-converter

;; TODO: fix this style
(defconst my/filecache-directories
  `((:recursive . (,config-dir
                   "~/share/doc/cheat_sheets/"
                   ,(expand-file-name (concat user-emacs-directory "../"))
                   ,package-conf-dir))
    (:normal . ("~/" ,elisp-dir))))

;;;;;;;;;;;
;; LIMIT ;;
;;;;;;;;;;;
(defconst recentf-max-menu-items  100)
(defconst recentf-max-saved-items 10000)
(setq max-lisp-eval-depth         100000
      history-length              10000
      max-specpdl-size            1000000)

;;;;;;;;;;;
;; TITLE ;;
;;;;;;;;;;;
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Avoid including org-mode by default ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq load-path
      (cl-loop for path in load-path
               unless (or (string-match "^/usr/share/emacs/site-lisp$" path)
                          (string-match "^/usr/share/.+/org$" path))
               collect path))

;; Core language
(defvar my/lang "ja_JP.UTF-8")

;; flyspell
;; avoid crazy keybinds
(defconst flyspell-mode-map '())

;; For magit
(defvar my/keys '())

;;; SKK
(defconst skk-jisyo-code 'utf-8)

;; howm
(defvar hown-directory "~/Dropbox/howm/")
(defvar howm-view-split-horizontally t)

;;;* default load files
(defconst my/default-load-files
  '(depend_main        ; this file should load than other files.
    my_builtin-configs
    init_server
    init_recentf
    init_helm
    init_tabbar
    my_automode
    my_hooks
    init_smartrep ; must load smartrep.el before loading powerline
    init_mykie
    "snapshot"))

;; jabber.el for google talk
(defconst jabber-account-list
  '((user-mail-address
     (:network-server . "talk.google.com")
     (:connection-type . ssl))))

;; Indent
(dolist (indent '(standard-indent sh-basic-offset sh-indentation
                  js-indent-level js2-basic-offset ruby-indent-level
                  css-indent-offset c-basic-offset
                  ;; TAB
                  tab-width coffee-tab-width))
  (eval `(defconst ,indent 2)))

;; Do not use TAB by default for indentation
(setq-default indent-tabs-mode nil)

;; Auto save
;; you can turn off auto saving by setting nil to `auto-save-default'
(setq auto-save-default t
      auto-save-timeout 30    ;; 30回/sec
      auto-save-interval 300  ;; 300打鍵毎に
      ;; 自動保存ファイル（#ファイル名#）の設定
      ;; 参考: http://openlab.dino.co.jp/2009/02/25/185332417.html#more-417
      auto-save-file-name-transforms `((".*/.*" ,temporary-file-directory t))
      ;; 終了時にオートセーブファイルを消す
      delete-auto-save-files t)

;;; shorten mode-name of mode-line
;; -- http://d.hatena.ne.jp/syohex/20130131/1359646452 --
(defvar mode-line-cleaner-alist
  `(;; For minor-mode, first char is 'space'
    (auto-fill-mode             . " Af")
    (yas-minor-mode             . " Ys")
    (yas-global-mode            . " YS")
    (paredit-mode               . " Pe")
    (undo-tree-mode             . " Ut")
    (elisp-slime-nav-mode       . " EN")
    (helm-gtags-mode            . " HG")
    (highlight-indentation-mode . " HI")
    (git-gutter+-mode           . " Gg")
    (flymake-mode               . ,(propertize
                               " ■" 'face '(((:foreground "red")))))
    (flyspell-mode              . " Fs")
    (whitespace-mode            . ,(propertize
                               " ■" 'face '(((:foreground "white")))))
    (eldoc-mode                 . "")
    (abbrev-mode                . "")
    (outline-minor-mode         . "")
    (ruby-block-mode            . "")
    (view-mode                  . " Vw")
    (zencoding-mode             . " Zc")
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

(provide 'vars)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; vars.el ends here
