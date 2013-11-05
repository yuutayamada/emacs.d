((ac-mozc status "installed" recipe
          (:name ac-mozc :type git :url "https://github.com/igjit/ac-mozc.git"))
 (ac-python status "installed" recipe
            (:name ac-python :description "Simple Python Completion Source for Auto-Complete" :depends auto-complete :type http :url "http://chrispoole.com/downloads/ac-python.el" :features ac-python))
 (ac-skk status "installed" recipe
         (:name ac-skk :type git :url "https://github.com/myuhe/ac-skk.el.git"))
 (ac-slime status "installed" recipe
           (:name ac-slime :website "https://github.com/purcell/ac-slime" :description "Emacs auto-complete plugin for Slime symbols" :type github :depends
                  (slime)
                  :pkgname "purcell/ac-slime"))
 (ace-jump-mode status "installed" recipe
                (:name ace-jump-mode :website "https://github.com/winterTTr/ace-jump-mode/wiki" :description "A quick cursor location minor mode for emacs." :type github :pkgname "winterTTr/ace-jump-mode" :prepare
                       (eval-after-load "ace-jump-mode"
                         '(ace-jump-mode-enable-mark-sync))))
 (ag-el status "installed" recipe
        (:name ag-el :type git :url "https://github.com/Wilfred/ag.el.git"))
 (aggressive-indent-mode status "installed" recipe
                         (:name aggressive-indent-mode :type git :url "https://github.com/Bruce-Connor/aggressive-indent-mode.git" :depends
                                (names)))
 (ample-regexps status "installed" recipe
                (:name ample-regexps :description "Compose and reuse Emacs regular expressions with ease" :type github :pkgname "immerrr/ample-regexps.el"))
 (android-mode status "installed" recipe
               (:name android-mode :website "https://github.com/remvee/android-mode" :description "Emacs minor mode for Android application development" :type github :pkgname "remvee/android-mode"))
 (anzu status "installed" recipe
       (:name anzu :type git :url "https://github.com/syohex/emacs-anzu.git"))
 (auto-async-byte-compile status "installed" recipe
                          (:name auto-async-byte-compile :type git :url "https://github.com/emacsattic/auto-async-byte-compile.git"))
 (auto-capitalize status "installed" recipe
                  (:name auto-capitalize :type git :url "https://github.com/yuutayamada/auto-capitalize-el.git"))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)
                       :features auto-complete-config :post-init
                       (progn
                         (add-to-list 'ac-dictionary-directories
                                      (expand-file-name "dict" default-directory))
                         (ac-config-default))))
 (auto-java-complete status "installed" recipe
                     (:name auto-java-complete :type git :url "https://github.com/emacs-java/auto-java-complete.git" :depends
                            (auto-complete)))
 (bm status "installed" recipe
     (:name bm :pkgname "joodland/bm" :website "http://joodland.github.com/bm/" :type github :description "Visible, persistent, buffer local, bookmarks"))
 (bpe status "installed" recipe
      (:name bpe :type git :url "https://github.com/yuutayamada/bpe.git"))
 (buffer-move status "installed" recipe
              (:name buffer-move :description "Swap buffers without typing C-x b on each window" :type emacswiki :features buffer-move))
 (c-eldoc status "installed" recipe
          (:name c-eldoc :description "eldoc-mode plugin for C source code" :type github :pkgname "nflath/c-eldoc" :post-init
                 (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)))
 (calfw status "installed" recipe
        (:name calfw :type github :pkgname "kiwanami/emacs-calfw" :load-path "." :description "A calendar framework for Emacs (with support for `org-mode', `howm' and iCal files)" :website "https://github.com/kiwanami/emacs-calfw"))
 (calfw-gcal status "installed" recipe
             (:name calfw-gcal :type git :url "https://github.com/myuhe/calfw-gcal.el.git"))
 (capitalizer status "installed" recipe
              (:name capitalizer :type git :url "https://github.com/yuutayamada/capitalizer-el.git"))
 (cider status "installed" recipe
        (:name cider :description "CIDER is a Clojure IDE and REPL." :type github :pkgname "clojure-emacs/cider" :depends
               (dash queue clojure-mode pkg-info)))
 (clojure-cheatsheet status "installed" recipe
                     (:name clojure-cheatsheet :type git :url "https://github.com/clojure-emacs/clojure-cheatsheet.git"))
 (clojure-mode status "installed" recipe
               (:name clojure-mode :website "https://github.com/clojure-emacs/clojure-mode" :description "Emacs support for the Clojure language." :type github :pkgname "clojure-emacs/clojure-mode"))
 (coffee-mode status "installed" recipe
              (:name coffee-mode :website "http://ozmm.org/posts/coffee_mode.html" :description "Emacs Major Mode for CoffeeScript" :type github :pkgname "defunkt/coffee-mode" :features coffee-mode :post-init
                     (progn
                       (add-to-list 'auto-mode-alist
                                    '("\\.coffee$" . coffee-mode))
                       (add-to-list 'auto-mode-alist
                                    '("Cakefile" . coffee-mode))
                       (setq coffee-js-mode 'javascript-mode))))
 (company-mode status "installed" recipe
               (:name company-mode :type git :url "https://github.com/company-mode/company-mode.git"))
 (css-eldoc status "installed" recipe
            (:name css-eldoc :website "https://github.com/zenozeng/css-eldoc" :description "eldoc plugin for CSS" :type github :pkgname "zenozeng/css-eldoc"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (db status "installed" recipe
     (:name db :description "very simple database for emacslisp, can also wrap other databases." :depends kv :type github :pkgname "nicferrier/emacs-db"))
 (ddskk status "installed" recipe
        (:name ddskk :type git :build
               '("make")
               :url "https://github.com/skk-dev/ddskk.git"))
 (deferred status "installed" recipe
   (:name deferred :type git :description "I added package" :url "https://github.com/kiwanami/emacs-deferred.git"))
 (dockerfile-mode status "installed" recipe
                  (:name dockerfile-mode :description "An emacs mode for handling Dockerfiles." :type github :pkgname "spotify/dockerfile-mode" :post-init
                         (progn
                           (add-to-list 'auto-mode-alist
                                        '("Dockerfile\\'" . dockerfile-mode)))))
 (eclim status "installed" recipe
        (:name eclim :type git :url "https://github.com/senny/emacs-eclim.git"))
 (eiji status "installed" recipe
       (:name eiji :type git :url "https://github.com/yuutayamada/eiji.git"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :load "el-get.el" :post-init
                (when
                    (memq 'el-get
                          (bound-and-true-p package-activated-list))
                  (message "Deleting melpa bootstrap el-get")
                  (unless package--initialized
                    (package-initialize t))
                  (when
                      (package-installed-p 'el-get)
                    (let
                        ((feats
                          (delete-dups
                           (el-get-package-features
                            (el-get-elpa-package-directory 'el-get)))))
                      (el-get-elpa-delete-package 'el-get)
                      (dolist
                          (feat feats)
                        (unload-feature feat t))))
                  (require 'el-get))))
 (eldoc-extension status "installed" recipe
                  (:name eldoc-extension :type git :url "https://github.com/emacsmirror/eldoc-extension.git"))
 (elnode status "installed" recipe
         (:name elnode :website "http://elnode.org/" :description "Asynchronous HttpServer framework." :depends
                (fakir web db noflet s)
                :type github :pkgname "nicferrier/elnode"))
 (emacs-helm-ag status "installed" recipe
                (:name emacs-helm-ag :type git :url "https://github.com/syohex/emacs-helm-ag.git"))
 (emacs-milkode status "installed" recipe
                (:name emacs-milkode :type git :url "https://github.com/ongaeshi/emacs-milkode.git"))
 (emacs-skype status "installed" recipe
              (:name emacs-skype :type git :url "https://github.com/kiwanami/emacs-skype.git"))
 (eshell-better-prompt status "installed" recipe
                       (:name eshell-better-prompt :type git :url "https://github.com/yuutayamada/eshell-better-prompt.git"))
 (esxml status "installed" recipe
        (:name esxml :type github :pkgname "tali713/esxml"))
 (evil status "installed" recipe
       (:name evil :type git :url "https://github.com/emacsmirror/evil.git"))
 (evil-numbers status "installed" recipe
               (:name evil-numbers :website "http://github.com/cofi/evil-numbers" :description "Increment/decrement numbers in Evil, the extensible vim\n       emulation layer. Like C-a/C-x in vim.\n\n       After installation, you will need to add a key-binding for evil-numbers.\n       For example:\n\n       (define-key evil-normal-state-map (kbd \"C-c +\") 'evil-numbers/inc-at-pt)\n       (define-key evil-normal-state-map (kbd \"C-c -\") 'evil-numbers/dec-at-pt)" :type github :pkgname "cofi/evil-numbers" :features evil-numbers :depends evil))
 (eww-lnum status "installed" recipe
           (:name eww-lnum :type git :description "Hit A Hint implementation for eww" :url "https://github.com/m00natic/eww-lnum.git"))
 (f status "installed" recipe
    (:name f :type git :url "https://github.com/rejeep/f.el.git"))
 (fakir status "installed" recipe
        (:name fakir :description "Functions and macros to fake bit of Emacs core libraries, like files and processes." :type github :pkgname "nicferrier/emacs-fakir" :depends
               (noflet dash)))
 (festival status "installed" recipe
           (:name festival :auto-generated t :type emacswiki :description "emacs interface into festival." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/festival.el"))
 (flycheck status "installed" recipe
           (:name flycheck :type git :depends
                  (f pkg-info)
                  :url "https://github.com/flycheck/flycheck.git"))
 (flycheck-java status "installed" recipe
                (:name flycheck-java :type git :depends
                       (flycheck)
                       :url "https://github.com/akorobov/flycheck-java.git"))
 (flycheck-tip status "installed" recipe
               (:name flycheck-tip :depends
                      (flycheck)
                      :type github :pkgname "yuutayamada/flycheck-tip"))
 (flymake status "installed" recipe
          (:name flymake :type git :url "https://github.com/illusori/emacs-flymake.git"))
 (flymake-coffee status "installed" recipe
                 (:name flymake-coffee :type github :pkgname "purcell/flymake-coffee" :description "Flymake support for coffee script" :website "http://github.com/purcell/flymake-coffee" :depends
                        (flymake-easy)
                        :post-init
                        (add-hook 'coffee-mode-hook 'flymake-coffee-load)))
 (flymake-easy status "installed" recipe
               (:name flymake-easy :type git :url "https://github.com/purcell/flymake-easy.git"))
 (flymake-java status "installed" recipe
               (:name flymake-java :type git :url "https://github.com/yuutayamada/flymake-java-el.git"))
 (flymake-json status "installed" recipe
               (:name flymake-json :type git :url "https://github.com/purcell/flymake-json.git"))
 (flymake-less status "installed" recipe
               (:name flymake-less :type git :url "https://github.com/purcell/flymake-less.git"))
 (flymake-lua status "installed" recipe
              (:name flymake-lua :website "https://github.com/sroccaserra/emacs/blob/master/flymake-lua.el" :description "Flymake support for Lua." :type http :url "https://raw.github.com/sroccaserra/emacs/master/flymake-lua.el" :post-init
                     (add-hook 'lua-mode-hook 'flymake-lua-load)))
 (flymake-shell status "installed" recipe
                (:name flymake-shell :type github :pkgname "purcell/flymake-shell" :description "A flymake syntax-checker for shell scripts" :website "http://github.com/purcell/flymake-shell" :depends
                       (flymake-easy)
                       :post-init
                       (add-hook 'shell-script-mode-hook 'flymake-shell-load)))
 (flyspell-lazy status "installed" recipe
                (:name flyspell-lazy :description "Improve Emacs flyspell responsiveness using idle timers." :type github :pkgname "rolandwalker/flyspell-lazy"))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (ggtags status "installed" recipe
         (:name ggtags :type git :url "https://github.com/leoliu/ggtags.git"))
 (ginger-api status "installed" recipe
             (:name ginger-api :type git :url "https://gist.github.com/5457732.git"))
 (ginger-rephrase-api status "installed" recipe
                      (:name ginger-rephrase-api :type git :url "https://gist.github.com/7349439.git"))
 (git-emacs status "installed" recipe
            (:name git-emacs :type git :url "https://github.com/tsgates/git-emacs.git"))
 (git-gutter status "installed" recipe
             (:name git-gutter :type git :url "https://github.com/syohex/emacs-git-gutter.git"))
 (git-messenger status "installed" recipe
                (:name git-messenger :description "Pops up commit messages at current line" :type github :pkgname "syohex/emacs-git-messenger"))
 (git-modes status "installed" recipe
            (:name git-modes :type git :url "https://github.com/magit/git-modes.git"))
 (go-autocomplete status "installed" recipe
                  (:name go-autocomplete :description "An autocompletion daemon for the Go programming language." :type github :pkgname "nsf/gocode" :depends
                         (go-mode auto-complete)
                         :load-path
                         ("emacs")
                         :post-init
                         (progn
                           (add-to-list 'exec-path
                                        (expand-file-name "bin" default-directory))
                           (eval-after-load 'go-mode
                             '(require 'go-autocomplete)))))
 (go-eldoc status "installed" recipe
           (:name go-eldoc :type git :url "https://github.com/syohex/emacs-go-eldoc.git"))
 (go-mode status "installed" recipe
          (:name go-mode :description "Major mode for the Go programming language" :type github :pkgname "dominikh/go-mode.el"))
 (gold-mode status "installed" recipe
            (:name gold-mode :type git :url "https://github.com/yuutayamada/gold-mode-el.git"))
 (google status "installed" recipe
         (:name google :type git :url "https://github.com/hober/google-el.git"))
 (google-translater status "installed" recipe
                    (:name google-translater :type git :url "https://github.com/manzyuk/google-translate.git"))
 (goto-chg status "installed" recipe
           (:name goto-chg :description "Goto the point of the most recent edit in the buffer." :type emacswiki :features goto-chg))
 (grammar status "installed" recipe
          (:name grammar :type svn :url "http://bcui-emacs.googlecode.com/svn/trunk/grammar"))
 (grep-a-lot status "installed" recipe
             (:name grep-a-lot :auto-generated t :type emacswiki :description "manages multiple search results buffers for grep.el" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/grep-a-lot.el"))
 (grep-edit status "installed" recipe
            (:name grep-edit :type git :url "https://github.com/emacsmirror/grep-edit.git"))
 (hangman status "installed" recipe
          (:name hangman :type git :url "https://github.com/yuutayamada/hangman.git"))
 (haskell-commnader status "installed" recipe
                    (:name haskell-commnader :type github :pkgname "yuutayamada/haskell-commander-el"))
 (haskell-mode status "installed" recipe
               (:name haskell-mode :description "A Haskell editing mode" :type github :pkgname "haskell/haskell-mode" :info "." :build
                      `(("make" ,(format "EMACS=%s" el-get-emacs)
                         "all"))
                      :post-init
                      (progn
                        (require 'haskell-mode-autoloads)
                        (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
                        (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :build
              ("make")
              :build/darwin
              `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
              :build/windows-nt
              (with-temp-file "helm-autoload.el" nil)))
 (helm-ag-r status "installed" recipe
            (:name helm-ag-r :type git :url "https://github.com/yuutayamada/helm-ag-r.git"))
 (helm-c-yasnippet status "installed" recipe
                   (:name helm-c-yasnippet :type github :pkgname "emacs-helm/helm-c-yasnippet" :description "Helm source for yasnippet.el." :features helm-c-yasnippet :depends
                          (helm yasnippet)))
 (helm-descbinds status "installed" recipe
                 (:name helm-descbinds :type git :url "https://github.com/emacs-helm/helm-descbinds.git"))
 (helm-ghq status "installed" recipe
           (:name helm-ghq :type git :url "https://github.com/masutaka/emacs-helm-ghq.git"))
 (helm-github-issues status "installed" recipe
                     (:name helm-github-issues :type git :url "https://github.com/syohex/emacs-helm-github-issues.git"))
 (helm-go status "installed" recipe
          (:name helm-go :type git :url "https://github.com/yuutayamada/helm-go.git"))
 (helm-google status "installed" recipe
              (:name helm-google :depends
                     (google)
                     :type git :url "https://github.com/steckerhalter/helm-google.git"))
 (helm-gtags status "installed" recipe
             (:name helm-gtags :type git :url "https://github.com/syohex/emacs-helm-gtags.git"))
 (helm-migemo status "installed" recipe
              (:name helm-migemo :type git :url "https://github.com/emacs-helm/helm-migemo.git"))
 (helm-rb status "installed" recipe
          (:name helm-rb :type git :url "https://github.com/yuutayamada/helm-rb.git" :depends
                 (helm helm-ag-r)))
 (helm-shell-history status "installed" recipe
                     (:name helm-shell-history :type git :url "https://github.com/yuutayamada/helm-shell-history.git"))
 (helm-skk-rules status "installed" recipe
                 (:name helm-skk-rules :type git :url "https://github.com/yuutayamada/helm-skk-rules.git"))
 (helm-swoop status "installed" recipe
             (:name helm-swoop :type git :url "https://github.com/ShingoFukuyama/helm-swoop.git"))
 (highlight-indentation status "installed" recipe
                        (:name highlight-indentation :description "Function for highlighting indentation" :type git :url "https://github.com/antonj/Highlight-Indentation-for-Emacs"))
 (hl-line+ status "installed" recipe
           (:name hl-line+ :auto-generated t :type emacswiki :description "Extensions to hl-line.el." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/hl-line+.el"))
 (hooglel status "installed" recipe
          (:name hooglel :type github :pkgname "yuutayamada/hooglel-el"))
 (howm status "installed" recipe
       (:name howm :website "http://howm.sourceforge.jp/" :description "Write fragmentarily and read collectively." :type http-tar :options
              ("xzf")
              :url "http://howm.sourceforge.jp/a/howm-1.4.1.tar.gz" :build
              `(("./configure" ,(concat "--with-emacs=" el-get-emacs))
                "make")))
 (html-helper-mode status "installed" recipe
                   (:name html-helper-mode :type git :url "https://github.com/emacsmirror/html-helper-mode.git"))
 (htmlize status "installed" recipe
          (:type github :pkgname "emacsmirror/htmlize" :name htmlize :website "http://www.emacswiki.org/emacs/Htmlize" :description "Convert buffer text and decorations to HTML." :type emacsmirror :localname "htmlize.el"))
 (image-dired+ status "installed" recipe
               (:name image-dired+ :type git :description "I added image-dired+" :url "https://github.com/mhayashi1120/Emacs-image-diredx.git"))
 (inf-ruby status "installed" recipe
           (:name inf-ruby :description "Inferior Ruby Mode - ruby process in a buffer." :type github :pkgname "nonsequitur/inf-ruby"))
 (jade status "installed" recipe
       (:name jade :type git :url "https://github.com/brianc/jade-mode.git"))
 (javadoc-lookup status "installed" recipe
                 (:name javadoc-lookup :type git :url "https://github.com/skeeto/javadoc-lookup.git"))
 (js2-mode status "installed" recipe
           (:name js2-mode :type git :url "https://github.com/mooz/js2-mode.git" :build
                  ("make")))
 (jsfmt status "installed" recipe
        (:name jsfmt :type git :url "https://github.com/brettlangdon/jsfmt.el.git"))
 (json status "installed" recipe
       (:name json :description "JavaScript Object Notation parser / generator" :type http :builtin "23" :url "http://edward.oconnor.cx/elisp/json.el"))
 (json-mode status "installed" recipe
            (:name json-mode :type git :url "https://github.com/joshwnj/json-mode.git" :depends
                   (json-reformat json-snatcher)))
 (json-reformat status "installed" recipe
                (:name json-reformat :type git :url "https://github.com/gongo/json-reformat.git"))
 (json-snatcher status "installed" recipe
                (:name json-snatcher :type git :url "https://github.com/Sterlingg/json-snatcher.git"))
 (jstestmacs status "installed" recipe
             (:name jstestmacs :type git :url "https://github.com/yuutayamada/jstestmacs.git"))
 (key-chord status "installed" recipe
            (:name key-chord :description "Map pairs of simultaneously pressed keys to commands." :type emacswiki :features "key-chord"))
 (keyboard-converter-el status "installed" recipe
                        (:name keyboard-converter-el :type git :url "https://github.com/yuutayamada/keyboard-converter-el.git"))
 (kv status "installed" recipe
     (:name kv :description "Key/Value collection type functions: for alists, hashtables and plists. Useful stuff." :type github :pkgname "nicferrier/emacs-kv"))
 (less-css-mode status "installed" recipe
                (:name less-css-mode :type git :url "https://github.com/purcell/less-css-mode.git"))
 (lingr status "installed" recipe
        (:name lingr :type git :url "https://github.com/lugecy/lingr-el.git"))
 (lispxmp status "installed" recipe
          (:name lispxmp :description "Automagic emacs lisp code annotation" :type emacswiki :features "lispxmp"))
 (logalimacs status "installed" recipe
             (:name logalimacs :type git :url "https://github.com/logaling/logalimacs.git"))
 (logito status "installed" recipe
         (:name logito :type github :pkgname "sigma/logito" :description "logging library for Emacs" :website "http://github.com/sigma/logito"))
 (lookup status "installed" recipe
         (:name lookup :type github :url "https://github.com/lookup2/lookup2.git"))
 (lua-mode status "installed" recipe
           (:name lua-mode :description "A major-mode for editing Lua scripts" :depends
                  (ample-regexps)
                  :type github :pkgname "immerrr/lua-mode"))
 (mag-menu status "installed" recipe
           (:name mag-menu :type git :url "https://github.com/chumpage/mag-menu.git"))
 (magit status "installed" recipe
        (:name magit :type git :build
               ("make clean" "emacs -q --batch -L . -L ../git-modes/ -f batch-byte-compile *.el" "makeinfo -o magit.info magit.texi" "ginstall-info --dir=dir magit.info")
               :depends
               (git-modes)
               :url "https://github.com/magit/magit.git"))
 (markdown-mode status "installed" recipe
                (:name markdown-mode :type git :url "https://github.com/milkypostman/markdown-mode.git"))
 (mew status "installed" recipe
      (:name mew :type git :build
             ("./configure && make")
             :url "https://github.com/kazu-yamamoto/Mew.git"))
 (migemo status "installed" recipe
         (:name migemo :type git :url "https://github.com/emacs-jp/migemo.git"))
 (minor-mode-hack status "installed" recipe
                  (:name minor-mode-hack :auto-generated t :type emacswiki :description "Change priority of minor-mode keymaps" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/minor-mode-hack.el"))
 (mmm-mode status "installed" recipe
           (:name mmm-mode :type git :url "https://github.com/purcell/mmm-mode.git"))
 (mode-compile status "installed" recipe
               (:name mode-compile :type git :url "https://github.com/yuutayamada/mode-compile.git"))
 (mozrepl status "installed" recipe
          (:name mozrepl :type git :url "https://github.com/bard/mozrepl.git" :load-path
                 ("./" "./chrome/content")))
 (multi-term status "installed" recipe
             (:name multi-term :type http :url "http://www.emacswiki.org/emacs/download/multi-term.el"))
 (multiple-cursors status "installed" recipe
                   (:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el"))
 (myhistory status "installed" recipe
            (:name myhistory :type git :url "https://github.com/yuutayamada/myhistory.git"))
 (mykie status "installed" recipe
        (:name mykie :type git :url "https://github.com/yuutayamada/mykie-el.git"))
 (names status "installed" recipe
        (:name names :type git :url "https://github.com/Bruce-Connor/names.git"))
 (navi2ch status "installed" recipe
          (:name navi2ch :type git :url "https://github.com/naota/navi2ch.git" :build
                 ("./configure && make")
                 :load-path
                 ("./" "./contrib" "./doc")))
 (node-console status "installed" recipe
               (:name node-console :type git :url "https://github.com/yuutayamada/node-console"))
 (noflet status "installed" recipe
         (:name noflet :type git :url "https://github.com/nicferrier/emacs-noflet.git"))
 (ob-go status "installed" recipe
        (:name ob-go :type git :depends
               (org-mode)
               :url "https://github.com/pope/ob-go.git"))
 (open-junk-file status "installed" recipe
                 (:name open-junk-file :description "Open a junk (memo) file to try-and-error" :type emacswiki :features "open-junk-file"))
 (org-mode status "installed" recipe
           (:name org-mode :type git :description "I added org-mode" :build
                  ("make clean" "make")
                  :url "git://orgmode.org/org-mode.git"))
 (org-trello status "installed" recipe
             (:name org-trello :type git :url "https://github.com/ardumont/org-trello.git" :depends
                    (dash request elnode cl-lib json elnode s esxml kv)))
 (orgtbl-aggregate status "installed" recipe
                   (:name orgtbl-aggregate :type git :url "https://github.com/tbanel/orgaggregate.git"))
 (ov status "installed" recipe
     (:name ov :type git :url "https://github.com/ShingoFukuyama/ov.el.git"))
 (package status "installed" recipe
          (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
                 (progn
                   (let
                       ((old-package-user-dir
                         (expand-file-name
                          (convert-standard-filename
                           (concat
                            (file-name-as-directory default-directory)
                            "elpa")))))
                     (when
                         (file-directory-p old-package-user-dir)
                       (add-to-list 'package-directory-list old-package-user-dir)))
                   (setq package-archives
                         (bound-and-true-p package-archives))
                   (mapc
                    (lambda
                      (pa)
                      (add-to-list 'package-archives pa 'append))
                    '(("ELPA" . "http://tromey.com/elpa/")
                      ("melpa" . "http://melpa.org/packages/")
                      ("gnu" . "http://elpa.gnu.org/packages/")
                      ("marmalade" . "http://marmalade-repo.org/packages/")
                      ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (package-emacs23 status "installed" recipe
                  (:name package-emacs23 :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el"))
 (package-latest status "installed" recipe
                 (:name package-latest :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/HEAD:/lisp/emacs-lisp/package.el" :load-path "./"))
 (pane status "installed" recipe
       (:name pane :type git :url "https://github.com/yuutayamada/pane.git"))
 (paredit status "installed" recipe
          (:name paredit :description "Minor mode for editing parentheses" :type http :prepare
                 (progn
                   (autoload 'enable-paredit-mode "paredit")
                   (autoload 'disable-paredit-mode "paredit"))
                 :url "http://mumble.net/~campbell/emacs/paredit.el"))
 (pcache status "installed" recipe
         (:name pcache :description "persistent caching for Emacs" :type github :pkgname "sigma/pcache"))
 (pkg-info status "installed" recipe
           (:name pkg-info :type git :url "https://github.com/lunaryorn/pkg-info.el.git"))
 (point-undo status "installed" recipe
             (:name point-undo :auto-generated t :type emacswiki :description "undo/redo position" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/point-undo.el"))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (popwin status "installed" recipe
         (:name popwin :description "Popup Window Manager." :website "https://github.com/m2ym/popwin-el" :type github :pkgname "m2ym/popwin-el" :load-path
                ("." "misc")))
 (powerline status "installed" recipe
            (:name powerline :type git :url "https://github.com/milkypostman/powerline.git"))
 (puppet-mode status "installed" recipe
              (:name puppet-mode :description "A simple mode for editing puppet manifests" :type github :pkgname "lunaryorn/puppet-mode" :website "https://github.com/lunaryorn/puppet-mode" :prepare
                     (progn
                       (autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests" t)
                       (add-to-list 'auto-mode-alist
                                    '("\\.pp$" . puppet-mode)))))
 (queue status "installed" recipe
        (:name queue :description "Queue data structure" :type elpa))
 (quickrun status "installed" recipe
           (:name quickrun :description "Run commands quickly" :website "https://github.com/syohex/emacs-quickrun" :type github :pkgname "syohex/emacs-quickrun" :features "quickrun"))
 (racer status "installed" recipe
        (:name racer :type git :url "https://github.com/phildawes/racer.git"))
 (rainbow-delimiters status "installed" recipe
                     (:name rainbow-delimiters :website "https://github.com/jlr/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "jlr/rainbow-delimiters"))
 (request status "installed" recipe
          (:name request :description "Easy HTTP request for Emacs Lisp" :type github :submodule nil :pkgname "tkf/emacs-request"))
 (revive status "installed" recipe
         (:name revive :type http :url "http://www.gentei.org/~yuuji/software/revive.el"))
 (ruby-block status "installed" recipe
             (:name ruby-block :type http :url "https://raw.github.com/emacsmirror/emacswiki.org/master/ruby-block.el" :description "highlight matching block"))
 (ruby-electric status "installed" recipe
                (:name ruby-electric :description "Electric commands editing for ruby files" :type github :pkgname "qoobaa/ruby-electric" :post-init
                       (add-hook 'ruby-mode-hook 'ruby-electric-mode)))
 (rubydb3x status "installed" recipe
           (:name rubydb3x :type http :url "http://bugs.ruby-lang.org/projects/ruby-trunk/repository/raw/misc/rubydb3x.el"))
 (rust-mode status "installed" recipe
            (:name rust-mode :type http :url "https://raw.github.com/mozilla/rust/master/src/etc/emacs/rust-mode.el" :description "Emacs mode for Rust"))
 (s status "installed" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
 (sbtp status "installed" recipe
       (:name sbtp :type git :url "https://github.com/yuutayamada/sbtp.git"))
 (scala-mode2 status "installed" recipe
              (:name scala-mode2 :type github :pkgname "hvesalai/scala-mode2"))
 (sdic status "installed" recipe
       (:name sdic :type git :url "https://github.com/emacsattic/sdic.git"))
 (sequential-command status "installed" recipe
                     (:name sequential-command :type http :url "http://www.emacswiki.org/cgi-bin/wiki/download/sequential-command.el"))
 (sequential-command-config status "installed" recipe
                            (:name sequential-command-config :type http :url "http://www.emacswiki.org/cgi-bin/wiki/download/sequential-command-config.el"))
 (set-perl5lib status "installed" recipe
               (:name set-perl5lib :type http :url "http://coderepos.org/share/browser/lang/elisp/set-perl5lib/set-perl5lib.el?format=txt" :description "set path into PERL5LIB if its file path includes 'lib' directory" :website "http://d.hatena.ne.jp/sun-basix/20080117/1200528765" :localname "set-perl5lib.el"))
 (skk-b status "installed" recipe
        (:name skk-b :type git :url "https://github.com/yuutayamada/skk-b-el.git"))
 (slime status "installed" recipe
        (:name slime :type git :url "https://github.com/slime/slime.git" :load-path
               ("./" "./contrib")))
 (slime-js status "installed" recipe
           (:name slime-js :type git :url "https://github.com/swank-js/slime-js.git"))
 (smart-tabs-mode status "installed" recipe
                  (:name smart-tabs-mode :type git :url "https://github.com/jcsalomon/smarttabs.git"))
 (smartparens status "installed" recipe
              (:name smartparens :description "Autoinsert pairs of defined brackets and wrap regions" :type github :pkgname "Fuco1/smartparens" :depends dash))
 (smartrep status "installed" recipe
           (:name smartrep :type git :url "https://github.com/myuhe/smartrep.el.git"))
 (smtpmail-multi status "installed" recipe
                 (:name smtpmail-multi :type http :url "http://www.emacswiki.org/emacs-en/download/smtpmail-multi.el"))
 (splitter status "installed" recipe
           (:name splitter :type http :url "https://raw.githubusercontent.com/chumpage/chumpy-windows/master/splitter.el"))
 (sql-indent status "installed" recipe
             (:name sql-indent :type git :url "https://github.com/yuutayamada/sql-indent.git"))
 (stem status "installed" recipe
       (:name stem :type git :url "https://github.com/yuutayamada/stem.git"))
 (sudo-ext status "installed" recipe
           (:name sudo-ext :type http :url "http://www.emacswiki.org/cgi-bin/wiki/download/sudo-ext.el"))
 (tabbar status "installed" recipe
         (:name tabbar :description "Display a tab bar in the header line." :type github :pkgname "dholm/tabbar" :lazy t))
 (tron-theme status "installed" recipe
             (:name tron-theme :type git :url "https://github.com/ivanmarcin/emacs-tron-theme.git"))
 (twittering-mode status "installed" recipe
                  (:name twittering-mode :type git :url "https://github.com/hayamiz/twittering-mode.git"))
 (viewer status "installed" recipe
         (:name viewer :auto-generated t :type emacswiki :description "View-mode extension" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/viewer.el"))
 (vlf status "installed" recipe
      (:name vlf :type git :url "https://github.com/m00natic/vlfi.git"))
 (w3m status "installed" recipe
      (:name w3m :type git :url "https://github.com/emacsmirror/w3m.git"))
 (web status "installed" recipe
      (:name web :description "A useful HTTP client in EmacsLisp" :depends fakir :type github :pkgname "nicferrier/emacs-web"))
 (web-mode status "installed" recipe
           (:name web-mode :type git :url "https://github.com/fxbois/web-mode.git"))
 (windows status "installed" recipe
          (:name windows :type http :url "http://www.gentei.org/~yuuji/software/euc/windows.el"))
 (xclip status "installed" recipe
        (:name xclip :description "Emacs Interface to XClip" :type http :url "http://www.mail-archive.com/gnu-emacs-sources@gnu.org/msg01336/xclip.el"))
 (yaml-mode status "installed" recipe
            (:name yaml-mode :type git :url "https://github.com/yoshiki/yaml-mode"))
 (yasnippet status "installed" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
                   (("git" "submodule" "update" "--init" "--" "snippets"))))
 (yim status "installed" recipe
      (:name yim :type git :url "https://github.com/yuutayamada/yim.git"))
 (zen-coding status "installed" recipe
             (:name zen-coding :type git :url "https://github.com/rooney/zencoding.git")))
