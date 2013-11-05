;;; init_el-get.el --- init file for el-get.el

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

(require 'vars)

(let* ((recipes   (concat el-get-dir "el-get/recipes/")))
  (defconst el-get-recipe-path-elpa      (concat recipes "elpa"))
  (defconst el-get-recipe-path-emacswiki (concat recipes "emacswiki")))

;; Define where to look for init-pkgname.el configurations.
(defconst el-get-user-package-directory package-conf-dir)

;; EL-GET SOURCES
(defconst
  el-get-sources
  '((:name ac-mozc
           :type git
           :url "https://github.com/igjit/ac-mozc.git")
    (:name ac-skk
           :type git
           :url "https://github.com/myuhe/ac-skk.el.git")
    (:name acquire
           :type git
           :url "https://github.com/yuutayamada/acquire-el.git")
    (:name auto-async-byte-compile
           :type git
           :url "https://github.com/emacsattic/auto-async-byte-compile.git")
    (:name auto-java-complete
           :type git
           :url "https://github.com/emacs-java/auto-java-complete.git"
           :depends (auto-complete))
    (:name auto-capitalize
           :type git
           :url "https://github.com/yuutayamada/auto-capitalize-el.git")
    (:name ag-el
           :type git
           :url "https://github.com/Wilfred/ag.el.git")
    (:name aggressive-indent-mode
           :type git
           :url "https://github.com/Bruce-Connor/aggressive-indent-mode.git"
           :depends (names))
    (:name anzu
           :type git
           :url "https://github.com/syohex/emacs-anzu.git")
    (:name bpe
           :type git
           :url "https://github.com/yuutayamada/bpe.git")
    (:name company-mode
           :type git
           :url "https://github.com/company-mode/company-mode.git")
    (:name capitalizer
           :type git
           :url "https://github.com/yuutayamada/capitalizer-el.git")
    (:name css-mode-github
           :type github
           :website "https://github.com/fberger/emacs-css-mode"
           :description "Major mode for editing CSS files."
           :pkgname "fberger/css-mode")
    (:name clojure-cheatsheet
           :type git
           :url "https://github.com/clojure-emacs/clojure-cheatsheet.git")
    (:name calfw-gcal
           :type git
           :url "https://github.com/myuhe/calfw-gcal.el.git")
    (:name ddskk
           :type git
           :build '("make")
           :url "https://github.com/skk-dev/ddskk.git")
    (:name deferred
           :type git
           :description "I added package"
           :url "https://github.com/kiwanami/emacs-deferred.git")
    (:name eshell-better-prompt
           :type git
           :url "https://github.com/yuutayamada/eshell-better-prompt.git")
    (:name eww-lnum
           :type git
           :description "Hit A Hint implementation for eww"
           :url "https://github.com/m00natic/eww-lnum.git")
    (:name eclim
           :type git
           :url "https://github.com/senny/emacs-eclim.git"
           ;; :build `("ant" "clean" "deploy" (concat "-Declipse.home=" ()))
           )
    ;; see ensime recipe, I don't want to build ensime automatically.
    (:name ensime
           :type github
           :pkgname "aemoncannon/ensime")
    (:name esxml
           :type github
           :pkgname "tali713/esxml")
    (:name eww
           :type http
           :url "http://git.savannah.gnu.org/cgit/emacs.git/plain/lisp/net/eww.el"
           :depends (shr))
    (:name flycheck
           :type git
           :depends (f pkg-info)
           :url "https://github.com/flycheck/flycheck.git")
    (:name flycheck-java
           :type git
           :depends (flycheck)
           :url "https://github.com/akorobov/flycheck-java.git")
    (:name flycheck-tip
           :depends (flycheck)
           :type github
           :pkgname "yuutayamada/flycheck-tip")
    (:name f
           :type git
           :url "https://github.com/rejeep/f.el.git")
    (:name fold-dwim
           :type git
           :url "https://github.com/emacsmirror/fold-dwim.git")
    (:name emacs-skype
           :type git
           :url "https://github.com/kiwanami/emacs-skype.git")
    (:name emacs-milkode
           :type git
           :url "https://github.com/ongaeshi/emacs-milkode.git")
    (:name evil
           :type git
           :url "https://github.com/emacsmirror/evil.git")
    (:name eldoc-extension
           :type git
           :url "https://github.com/emacsmirror/eldoc-extension.git")
    (:name elnode
           :website "http://elnode.org/"
           :description "Asynchronous HttpServer framework."
           :depends (fakir web db noflet s)
           :type github
           :pkgname "nicferrier/elnode")
    (:name eiji
           :type git
           :url "https://github.com/yuutayamada/eiji.git")
    (:name foreign-regexp
           :type git
           :url "https://github.com/k-talo/foreign-regexp.el.git")
    (:name ginger-api
           :type git
           :url "https://gist.github.com/5457732.git")
    (:name ginger-rephrase-api
           :type git
           :url "https://gist.github.com/7349439.git")
    (:name gold-mode
           :type git
           :url "https://github.com/yuutayamada/gold-mode-el.git")
    (:name grammar
           :type svn
           :url "http://bcui-emacs.googlecode.com/svn/trunk/grammar")
    (:name grep-edit
           :type git
           :url "https://github.com/emacsmirror/grep-edit.git")
    (:name lua-mode
           :type git
           :url "https://github.com/immerrr/lua-mode.git")
    (:name lookup
           :type github
           :url "https://github.com/lookup2/lookup2.git")
    (:name less-css-mode
           :type git
           :url "https://github.com/purcell/less-css-mode.git")
    (:name lingr
           :type git
           :url "https://github.com/lugecy/lingr-el.git")
    (:name flymake
           :type git
           :url "https://github.com/illusori/emacs-flymake.git")
    (:name flymake-easy
           :type git
           :url "https://github.com/purcell/flymake-easy.git")
    (:name flymake-less
           :type git
           :url "https://github.com/purcell/flymake-less.git")
    (:name flymake-java
           :type git
           :url "https://github.com/yuutayamada/flymake-java-el.git")
    (:name git-modes
           :type git
           :url "https://github.com/magit/git-modes.git")
    (:name go-eldoc
           :type git
           :url "https://github.com/syohex/emacs-go-eldoc.git")
    (:name google
           :type git
           :url "https://github.com/hober/google-el.git")
    (:name emacs-helm-ag
           :type git
           :url "https://github.com/syohex/emacs-helm-ag.git")
    (:name haskell-commnader
           :type github
           :pkgname "yuutayamada/haskell-commander-el")
    (:name hooglel
           :type github
           :pkgname "yuutayamada/hooglel-el")
    (:name helm-github-issues
           :type git
           :url "https://github.com/syohex/emacs-helm-github-issues.git")
    (:name helm-ghq
           :type git
           :url "https://github.com/masutaka/emacs-helm-ghq.git")
    (:name helm-swoop
           :type git
           :url "https://github.com/ShingoFukuyama/helm-swoop.git")
    (:name helm-ag-r
           :type git
           :url "https://github.com/yuutayamada/helm-ag-r.git")
    (:name helm-go
           :type git
           :url "https://github.com/yuutayamada/helm-go.git")
    (:name helm-google
           :depends (google)
           :type git
           :url "https://github.com/steckerhalter/helm-google.git")
    (:name helm-commit-message
           :type git
           :url "https://github.com/yuutayamada/helm-commit-message.git")
    (:name helm-descbinds
           :type git
           :url "https://github.com/emacs-helm/helm-descbinds.git")
    (:name helm-gtags
           :type git
           :url "https://github.com/syohex/emacs-helm-gtags.git")
    (:name helm-migemo
           :type git
           :url "https://github.com/emacs-helm/helm-migemo.git")
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
    (:name image-dired+
           :type git
           :description "I added image-dired+"
           :url "https://github.com/mhayashi1120/Emacs-image-diredx.git")
    (:name flymake-json
           :type git
           :url "https://github.com/purcell/flymake-json.git")
    (:name json-mode
           :type git
           :url "https://github.com/joshwnj/json-mode.git"
           :depends (json-reformat json-snatcher))
    (:name json-reformat
           :type git
           :url "https://github.com/gongo/json-reformat.git")
    (:name json-snatcher
           :type git
           :url "https://github.com/Sterlingg/json-snatcher.git")
    (:name jade
           :type git
           :url "https://github.com/brianc/jade-mode.git")
    (:name javadoc-lookup
           :type git
           :url "https://github.com/skeeto/javadoc-lookup.git")
    (:name js2-mode
           :type git
           :url "https://github.com/mooz/js2-mode.git"
           :build ("make"))
    (:name jsfmt
           :type git
           :url "https://github.com/brettlangdon/jsfmt.el.git")
    (:name jstestmacs
           :type git
           :url "https://github.com/yuutayamada/jstestmacs.git")
    (:name keyboard-converter-el
           :type git
           :url "https://github.com/yuutayamada/keyboard-converter-el.git")
    (:name logalimacs
           :type git
           :url "https://github.com/logaling/logalimacs.git")
    (:name ov
           :type git
           :url "https://github.com/ShingoFukuyama/ov.el.git")
    (:name org-trello
           :type git
           :url "https://github.com/ardumont/org-trello.git"
           :depends (dash request elnode json elnode s esxml kv))
    (:name org-mode
           :type git
           :description "I added org-mode"
           :build ("make clean" "make")
           :url "git://orgmode.org/org-mode.git")
    (:name orgtbl-aggregate
           :type git
           :url "https://github.com/tbanel/orgaggregate.git")
    (:name ob-go ; org-babel go binding
           :type git
           :depends (org-mode)
           :url "https://github.com/pope/ob-go.git")
    (:name powerline
           :type git
           :url "https://github.com/milkypostman/powerline.git")
    (:name package-latest
           :type http
           :url "http://repo.or.cz/w/emacs.git/blob_plain/HEAD:/lisp/emacs-lisp/package.el"
           :load-path "./")
    (:name package-emacs23
           :type http
           :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el")
    (:name pdf-tools
           :type git
           :url "https://github.com/politza/pdf-tools.git"
           :build ("sh autogen.sh && ./configure && make"))
    (:name pkg-info
           :type git
           :url "https://github.com/lunaryorn/pkg-info.el.git")
    (:name racer
           :type git
           :url "https://github.com/phildawes/racer.git")
    (:name ruby-mode-trunk-head
           :type http
           :description "Major mode for editing Ruby files. (trunk-head)"
           :url "http://bugs.ruby-lang.org/projects/ruby-trunk/repository/raw/misc/ruby-mode.el")
    (:name rubydb3x
           :type http
           :url "http://bugs.ruby-lang.org/projects/ruby-trunk/repository/raw/misc/rubydb3x.el")
    (:name revive
           :type http
           :url "http://www.gentei.org/~yuuji/software/revive.el")
    (:name rinari
           :type git
           :url "https://github.com/eschulte/rinari.git"
           :build ("git submodule init && git submodule update"))
    (:name mag-menu
           :type git
           :depends (splitter)
           :url "https://github.com/chumpage/mag-menu.git")
    (:name multi-term
           :type http
           :url "http://www.emacswiki.org/emacs/download/multi-term.el")
    (:name mode-compile
           :type git
           :url "https://github.com/yuutayamada/mode-compile.git")
    (:name mew
           :type git
           ;; Make sure "~/.gnupg/gpg-agent.conf"
           ;; and Add mew-pinentry to pinentry-program
           ;; For example
           ;; pinentry-program /home/you/.emacs.d/el-get/mew/bin/mew-pinentry
           :build ("./configure && make")
           :url "https://github.com/kazu-yamamoto/Mew.git")
    (:name magit
           :type git
           :build ("make clean"
                   "emacs -q --batch -L . -L ../git-modes/ -f batch-byte-compile *.el"
                   "makeinfo -o magit.info magit.texi"
                   "ginstall-info --dir=dir magit.info")
           :depends (git-modes)
           :url "https://github.com/magit/magit.git")
    (:name mmm-mode
           :type git
           :url "https://github.com/purcell/mmm-mode.git")
    (:name markdown-mode
           :type git
           :url "https://github.com/milkypostman/markdown-mode.git")
    (:name migemo
           :type git
           :url "https://github.com/emacs-jp/migemo.git")
    (:name myhistory
           :type git
           :url "https://github.com/yuutayamada/myhistory.git")
    (:name names
           :type git
           :url "https://github.com/Bruce-Connor/names.git")
    (:name node-console
           :type git
           :url "https://github.com/yuutayamada/node-console")
    (:name navi2ch
           :type git
           :url "https://github.com/naota/navi2ch.git"
           :build ("./configure && make")
           :load-path ("./" "./contrib" "./doc"))
    (:name noflet
           :type git
           :url "https://github.com/nicferrier/emacs-noflet.git")
    (:name ggtags
           :type git
           :url "https://github.com/leoliu/ggtags.git")
    (:name git-emacs
           :type git
           :url "https://github.com/tsgates/git-emacs.git")
    (:name git-gutter
           :type git
           :url "https://github.com/syohex/emacs-git-gutter.git")
    (:name git-messenger :description "Pops up commit messages at current line"
           :type github
           :pkgname "syohex/emacs-git-messenger")
    (:name google-translater
           :type git
           :url "https://github.com/manzyuk/google-translate.git")
    (:name html-helper-mode
           :type git
           :url "https://github.com/emacsmirror/html-helper-mode.git")
    (:name mozrepl
           :type git
           :url "https://github.com/bard/mozrepl.git"
           :load-path ("./" "./chrome/content"))
    (:name mykie
           :type git
           :url "https://github.com/yuutayamada/mykie-el.git")
    ;; (:name mozc
    ;;        :type svn
    ;;        :url "http://mozc.googlecode.com/svn/trunk/src/unix/emacs")
    (:name pane
           :type git
           :url"https://github.com/yuutayamada/pane.git")
    (:name splitter
           :type http
           :url "https://raw.githubusercontent.com/chumpage/chumpy-windows/master/splitter.el")
    (:name sbtp
           :type git
           :url "https://github.com/yuutayamada/sbtp.git")
    (:name skk-b
           :type git
           :url "https://github.com/yuutayamada/skk-b-el.git")
    (:name scala-mode2
           :type github
           :pkgname "hvesalai/scala-mode2")
    (:name sequential-command
           :type http
           :url "http://www.emacswiki.org/cgi-bin/wiki/download/sequential-command.el")
    (:name sequential-command-config
           :type http
           :url "http://www.emacswiki.org/cgi-bin/wiki/download/sequential-command-config.el")
    (:name smart-tabs-mode
           :type git
           :url "https://github.com/jcsalomon/smarttabs.git")
    (:name smtpmail-multi
           :type http
           :url "http://www.emacswiki.org/emacs-en/download/smtpmail-multi.el")
    (:name stem
           :type git
           :url "https://github.com/yuutayamada/stem.git")
    (:name slime
           :type git
           :url "https://github.com/slime/slime.git"
           :load-path ("./" "./contrib"))
    (:name slime-js
           :type git
           :url "https://github.com/swank-js/slime-js.git")
    (:name sdic
           :type git
           :url "https://github.com/emacsattic/sdic.git")
    (:name shr
           :type http
           :url "http://git.savannah.gnu.org/cgit/emacs.git/plain/lisp/net/shr.el")
    (:name sudo-ext
           :type http
           :url "http://www.emacswiki.org/cgi-bin/wiki/download/sudo-ext.el")
    (:name smartrep
           :type git
           :url "https://github.com/myuhe/smartrep.el.git")
    (:name sql-indent
           :type git
           :url "https://github.com/yuutayamada/sql-indent.git")
    (:name tron-theme
           :type git
           :url "https://github.com/ivanmarcin/emacs-tron-theme.git")
    (:name twittering-mode
           :type git
           :url "https://github.com/hayamiz/twittering-mode.git")
    (:name vlf ; view large files
           :type git
           :url "https://github.com/m00natic/vlfi.git")
    (:name w3m
           :type git
           ;; sudo aptitude install jbibtex-base
           ;; I just comment out build configuration because
           ;; emacs 25 needs changing configure file(emacs version)
           ;; :build ("autoconf" "./configure" "make")
           :url "https://github.com/emacsmirror/w3m.git")
    (:name web-mode
           :type git
           :url "https://github.com/fxbois/web-mode.git")
    (:name windows
           :type http
           :url "http://www.gentei.org/~yuuji/software/euc/windows.el")
    (:name yaml-mode
           :type git
           :url "https://github.com/yoshiki/yaml-mode")
    (:name yim
           :type git
           :url "https://github.com/yuutayamada/yim.git")
    (:name zen-coding
           :type git
           :url "https://github.com/rooney/zencoding.git")))

;; EL-GET
;; if user hadn't el-get package then load it.
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let ()
      ;; To use master branch, Use below comment out region to above let ()
      ;; (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(condition-case err
    (with-no-warnings (el-get 'sync))
  (error err))

;; system-uses-terminfo
(provide 'init_el-get)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_el-get.el ends here
