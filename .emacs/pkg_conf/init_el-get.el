;;; init_el-get.el --- init file for el-get.el

;;; Commentary:

;; My memo
;; :prepare   -- first, the :prepare function, usually defined in the recipe
;; :before    -- now call the :before user function
;; :post-init -- for recipe?
;; :after     -- same as init-PACKAGE.el?

;; :features symbol-without-quote or "string"
;;   `require' its `:features'

;; the order:
;;   :prepare -> :before -> (condition) -> :post-init :after

;; other
;; :module, :build, :load-path, :autoloads, :depends

;; variables:
;;   ‘el-get-verbose’ -- output verbose message
 ;; (setq el-get-verbose t)
;; .loaddefs.el:3626:7:Warning: assignment to free variable `jedi:setup-function'
;; .loaddefs.el:3626:43:Warning: assignment to free variable `jedi:mode-function'
;; .loaddefs.el:7809:140:Warning: assignment to free variable `org-load-hook'

;;; Code:
(require 'my_paths)

(let* ((recipes (concat el-get-dir "el-get/recipes/")))
  (defconst el-get-recipe-path-elpa      (concat recipes "elpa"))
  (defconst el-get-recipe-path-emacswiki (concat recipes "emacswiki")))

;; Define where to look for init-pkgname.el configurations.
(defconst el-get-user-package-directory
  (format "%sel-get" package-conf-dir))

(defsubst Y/el-get-npm-install-maybe (package &optional command)
  "Install npm PACKAGE if it hasn’t installed yet.
You can only use this function inside :build directive."
  ;; See also:
  ;;   https://docs.npmjs.com/getting-started/fixing-npm-permissions
  ;; You may need:
  ;;   sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}
  (if (and (not (executable-find (or command package)))
           (executable-find "npm"))
      `("npm" "install" ,package "-g")
    ""))

;; EL-GET SOURCES
(defconst
  el-get-sources
  '(;; A
    (:name auto-capitalize
           :type git
           :url "https://github.com/yuutayamada/auto-capitalize-el.git")
    ;; B
    (:name bpe
           :type git
           :url "https://github.com/yuutayamada/bpe.git")
    ;; C
    (:name calfw-gcal
           :type git
           :url "https://github.com/myuhe/calfw-gcal.el.git")
    (:name capitalizer
           :type git
           :url "https://github.com/yuutayamada/capitalizer-el.git")

    ;; D
    (:name ddskk
           :load-path ("./" "./nicola" "./experimental" "./bayesian"))
    ;; E
    (:name eshell-better-prompt
           :type git
           :url "https://github.com/yuutayamada/eshell-better-prompt.git")

    (:name eiji
           :type git
           :url "https://github.com/yuutayamada/eiji.git")
    ;; G
    (:name ginger-api
           :type git
           :url "https://gist.github.com/5457732.git")
    (:name ginger-rephrase-api
           :type git
           :url "https://gist.github.com/7349439.git")
    (:name grammar
           :type svn
           :url "http://bcui-emacs.googlecode.com/svn/trunk/grammar")
    ;; L
    (:name lookup
           :type github
           ;; Don't forget! ndeb needs eblook command
           :build ("./autogen.sh && ./configure && make")
           :url "https://github.com/lookup2/lookup2.git")

    (:name less-css-mode
           ;; For flycheck’s less checker
           :build `(,(Y/el-get-npm-install-maybe "less" "lessc")))
    (:name helm-ag-r
           :type git
           :url "https://github.com/yuutayamada/helm-ag-r.git")

    (:name helm-commit-message
           :type git
           :url "https://github.com/yuutayamada/helm-commit-message.git")

    (:name helm-shell-history
           :type git
           :url "https://github.com/yuutayamada/helm-shell-history.git")
    (:name helm-google-contacts
           :type git
           :url "https://github.com/yuutayamada/helm-google-contacts.git")
    (:name helm-ag-mydict
           :type git
           :url "https://github.com/yuutayamada/helm-ag-mydict.git")
    (:name helm-rb
           :type git
           :url "https://github.com/yuutayamada/helm-rb.git"
           :depends (helm helm-ag-r))
    (:name helm-skk-rules
           :type git
           :url "https://github.com/yuutayamada/helm-skk-rules.git")
    (:name hangman
           :type git
           :url "https://github.com/yuutayamada/hangman.git")
    (:name json-mode
           ;; Install jsonlint for flycheck
           :build `(,(Y/el-get-npm-install-maybe "jsonlint")))

    (:name jstestmacs
           :type git
           :url "https://github.com/yuutayamada/jstestmacs.git")
    (:name keyboard-converter-el
           :type git
           :url "https://github.com/yuutayamada/keyboard-converter-el.git")
    (:name logalimacs
           :type git
           :url "https://github.com/logaling/logalimacs.git")
    (:name myhistory
           :type git
           :url "https://github.com/yuutayamada/myhistory.git")

    ;; (:name mozc
    ;;        :type svn
    ;;        :url "http://mozc.googlecode.com/svn/trunk/src/unix/emacs")
    ;; Q
    (:name queue ; somehow failed authentication?
           :type http
           :url "http://git.savannah.gnu.org/gitweb/?p=emacs/elpa.git;a=blob_plain;f=packages/queue/queue.el;hb=HEAD")
    ;; R
    (:name rainbow-mode
           :type http
           :url "http://git.savannah.gnu.org/gitweb/?p=emacs/elpa.git;a=blob_plain;f=packages/rainbow-mode/rainbow-mode.el;hb=HEAD")
    ;; S
    (:name seqcmd
           :type github
           :pkgname "yuutayamada/seqcmd")
    (:name sbtp
           :type git
           :url "https://github.com/yuutayamada/sbtp.git")
    (:name skk-b
           :type git
           :url "https://github.com/yuutayamada/skk-b-el.git")
    (:name smtpmail-multi
           :type http
           :url "http://www.emacswiki.org/emacs-en/download/smtpmail-multi.el")
    (:name stem
           :type git
           :url "https://github.com/yuutayamada/stem.git")
    (:name sql-indent
           :type git
           :url "https://github.com/yuutayamada/sql-indent.git")
    ;; T
    (:name transpose-frame
           :type git
           :url "https://github.com/emacsmirror/transpose-frame.git")

    (:name windows
           :before
           (progn
             ;; Note that those variables should load before the `require windows' or
             ;; this configuration will fail.
             (defconst win:switch-prefix (kbd "M-g"))
             (defconst win:use-frame     nil)
             (defconst win:base-key      (1- ?a))         ; starts from a of alphabet
             (defconst win:max-configs   (+ (- ?z ?a) 2)) ; end at z of alphabet
             (defconst win:quick-selection nil)
             (defconst revive:ignore-buffer-pattern "^ \\*")

             ;; adjust variable of windows.el
             (add-hook 'after-make-frame-functions
                       '(lambda (frame)
                          (select-frame frame)
                          (defconst win:frames-in-nw (if (display-graphic-p) nil t))))))
    (:name navi2ch :load-path ("." "./contrib"))

    ;; TODO: PR to orgtbl-aggregate
    ;; Fix this warning:
    ;;   .loaddefs.el:8038:140:Warning: assignment to free variable `org-load-hook'
    ;; (:name orgtbl-aggregate
    ;;        :type git
    ;;        :url "https://github.com/tbanel/orgaggregate.git")
    ;; TODO: PR to el-get
    ;; (:name clojure-cheatsheet
    ;;        :type git
    ;;        :url "https://github.com/clojure-emacs/clojure-cheatsheet.git")
    (:name emacs-skype ; buzztaiki/emacs-skype is outdated
           :type github
           :pkgname "kiwanami/emacs-skype")
    (:name evil-anzu
           :type git
           :url "https://github.com/syohex/emacs-evil-anzu.git")
    (:name eww-lnum
           :type git
           :description "Hit A Hint implementation for eww"
           :url "https://github.com/m00natic/eww-lnum.git")
    (:name sudo-ext
           :description "sudo support"
           :type emacswiki)

    (:name idle-require
           :type git
           :url "https://github.com/nschum/idle-require.el.git")
    (:name pangu-spacing
           :type git
           :url "https://github.com/coldnew/pangu-spacing.git")
    (:name linum-relative
           :type github
           :pkgname "coldnew/linum-relative")
    (:name haskell-emacs
           :type github
           :pkgname "knupfer/haskell-emacs")
    (:name helm-hoogle
           :type git
           :url "https://github.com/markus1189/helm-hoogle.git")
    (:name flycheck-package
           :type github
           :pkgname "purcell/flycheck-package"
           :depends (flycheck)
           :minimum-emacs-version "24"
           :prepare
           (eval-after-load "flycheck"
             '(progn
                (unless flycheck-emacs-lisp-load-path
                  (setq flycheck-emacs-lisp-load-path 'inherit))
                (el-get 'sync 'flycheck-package)
                (flycheck-package-setup))))
    (:name jsfmt
           :type git
           :url "https://github.com/brettlangdon/jsfmt.el.git")
    (:name helm-github-issues
           :type git
           :url "https://github.com/syohex/emacs-helm-github-issues.git")
    (:name cpp-auto-include
           :type github
           :pkgname "syohex/emacs-cpp-auto-include")
    ;; TODO: make lingr-irc.el
    ;; http://mattn.kaoriya.net/software/lang/go/20130403151615.htm
    (:name lingr
           :type git
           :url "https://github.com/lugecy/lingr-el.git")
    ))

;; flycheck-emacs-lisp-initialize-packages and
;; EL-GET
;; if user doesn't have el-get package then install and load it.
(add-to-list 'load-path (format "%sel-get/" el-get-dir))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let ()
      ;; To use master branch, Use below comment out region to above let ()
      ;; (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(require 'el-get)
(condition-case err
    (progn
      ;; For my emacs.d test
      (when (and (< emacs-major-version 25)
                 (bound-and-true-p Y/on-test))
        (el-get-install 'let-alist)))
  (error err))

(provide 'init_el-get)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_el-get.el ends here
