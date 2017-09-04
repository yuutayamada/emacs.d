((ac-irony status "required" recipe
           (:name ac-irony :description "Auto-complete completion source for irony-mode." :type github :pkgname "Sarcasm/ac-irony"))
 (ag status "required" recipe
     (:name ag :description "A simple ag frontend, loosely based on ack-and-half.el." :type github :pkgname "Wilfred/ag.el" :depends
            (dash s)))
 (ample-regexps status "installed" recipe
                (:name ample-regexps :description "Compose and reuse Emacs regular expressions with ease" :type github :pkgname "immerrr/ample-regexps.el"))
 (android-mode status "required" recipe
               (:name android-mode :website "https://github.com/remvee/android-mode" :description "Emacs minor mode for Android application development" :type github :pkgname "remvee/android-mode"))
 (anzu status "installed" recipe
       (:name anzu :website "https://github.com/syohex/emacs-anzu" :description "A minor mode which displays current match and total matches." :type "github" :branch "master" :pkgname "syohex/emacs-anzu"))
 (arduino-mode status "required" recipe
               (:name arduino-mode :website "https://github.com/bookest/arduino-mode" :description "Emacs major mode for Arduino development." :type github :pkgname "bookest/arduino-mode"))
 (auto-capitalize status "installed" recipe
                  (:name auto-capitalize :type github :pkgname "yuutayamada/auto-capitalize-el"))
 (auto-compile status "installed" recipe
               (:name auto-compile :type github :pkgname "tarsius/auto-compile" :description "Automatically compile Emacs Lisp libraries." :depends
                      (packed dash)))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)
                       :features auto-complete-config :post-init
                       (progn
                         (add-to-list 'ac-dictionary-directories
                                      (expand-file-name "dict" default-directory))
                         (ac-config-default))))
 (auto-complete-c-headers status "installed" recipe
                          (:name auto-complete-c-headers :website "https://github.com/mooz/auto-complete-c-headers" :description "An auto-complete source for C/C++ header files." :type github :pkgname "mooz/auto-complete-c-headers" :depends auto-complete :prepare
                                 (progn
                                   (defun ac--c-headers-init nil
                                     (require 'auto-complete-c-headers)
                                     (add-to-list 'ac-sources 'ac-source-c-headers))
                                   (add-hook 'c-mode-hook 'ac--c-headers-init)
                                   (add-hook 'c++-mode-hook 'ac--c-headers-init))))
 (avy status "required" recipe
      (:name avy :description "Jump to things in Emacs tree-style." :type github :pkgname "abo-abo/avy" :depends
             (cl-lib)))
 (bats-mode status "required" recipe
            (:name bats-mode :description "A major-mode for editing Bats test files." :pkgname "dougm/bats-mode" :type github))
 (beacon status "required" recipe
         (:name beacon :description "A light following your cursor around so you don't lose it!" :type github :pkgname "Malabarba/beacon" :depends seq))
 (bm status "required" recipe
     (:name bm :pkgname "joodland/bm" :website "http://joodland.github.com/bm/" :type github :description "Visible, persistent, buffer local, bookmarks"))
 (buffer-move status "required" recipe
              (:name buffer-move :description "Swap buffers without typing C-x b on each window" :type emacswiki :features buffer-move))
 (buttercup status "required" recipe
            (:name buttercup :description "Behavior-Driven Emacs Lisp Testing" :type github :pkgname "jorgenschaefer/emacs-buttercup"))
 (c-eldoc status "required" recipe
          (:name c-eldoc :description "eldoc-mode plugin for C source code" :type github :pkgname "nflath/c-eldoc" :post-init
                 (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)))
 (calfw status "required" recipe
        (:name calfw :type github :pkgname "kiwanami/emacs-calfw" :load-path "." :description "A calendar framework for Emacs (with support for `org-mode', `howm' and iCal files)" :website "https://github.com/kiwanami/emacs-calfw"))
 (calfw-gcal status "required" recipe
             (:name calfw-gcal :type git :url "https://github.com/myuhe/calfw-gcal.el.git"))
 (camcorder status "required" recipe
            (:name camcorder :type github :pkgname "yuutayamada/camcorder.el"))
 (chumpy-windows status "required" recipe
                 (:name chumpy-windows :description "Emacs window management utilities: window-jump.el, spaces.el, splitter.el" :type github :pkgname "chumpage/chumpy-windows"))
 (cl-lib status "installed" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (cmake-mode status "required" recipe
             (:name cmake-mode :website "http://www.itk.org/Wiki/CMake/Editors/Emacs" :description "Provides syntax highlighting and indentation for CMakeLists.txt and *.cmake source files." :type http :url "http://cmake.org/gitweb?p=cmake.git;a=blob_plain;hb=master;f=Auxiliary/cmake-mode.el"))
 (coffee-mode status "required" recipe
              (:name coffee-mode :website "http://ozmm.org/posts/coffee_mode.html" :description "Emacs Major Mode for CoffeeScript" :type github :pkgname "defunkt/coffee-mode" :features coffee-mode :prepare
                     (progn
                       (add-to-list 'auto-mode-alist
                                    '("\\.coffee$" . coffee-mode))
                       (add-to-list 'auto-mode-alist
                                    '("Cakefile" . coffee-mode)))))
 (color-theme-jaqen status "installed" recipe
                    (:name color-theme-jaqen :description "" :website "https://github.com/yuutayamada/emacs-jaqen-theme" :minimum-emacs-version "24" :type github :pkgname "yuutayamada/emacs-jaqen-theme" :prepare
                           (add-to-list 'custom-theme-load-path default-directory)))
 (commenter status "installed" recipe
            (:name commenter :website "https://github.com/yuutayamada/commenter#readme" :description "multiline-comment support package" :type github :pkgname "yuutayamada/commenter" :branch "master" :minimum-emacs-version "24.4" :depends
                   (let-alist)))
 (company-c-headers status "required" recipe
                    (:name company-c-headers :description "Company mode backend for C/C++ header files." :type github :pkgname "randomphrase/company-c-headers" :depends
                           (company-mode)))
 (company-flx status "installed" recipe
              (:name company-flx :description "Fuzzy matching for company." :type github :pkgname "PythonNut/company-flx" :depends
                     (company-mode flx)))
 (company-irony status "required" recipe
                (:name company-irony :description "company-mode completion back-end for irony-mode" :type github :depends
                       (company-mode irony-mode cl-lib)
                       :pkgname "Sarcasm/company-irony"))
 (company-mode status "installed" recipe
               (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (context-kill status "installed" recipe
               (:name context-kill :type github :pkgname "yuutayamada/context-kill-el"))
 (contrast-color status "installed" recipe
                 (:name contrast-color :type github :pkgname "yuutayamada/contrast-color-el"))
 (crontab-mode status "required" recipe
               (:name crontab-mode :description "Mode for editing crontab files" :type http :url "http://web.archive.org/web/20080716014153/http://www.mahalito.net/~harley/elisp/crontab-mode.el"))
 (css-eldoc status "required" recipe
            (:name css-eldoc :website "https://github.com/zenozeng/css-eldoc" :description "eldoc plugin for CSS" :type github :pkgname "zenozeng/css-eldoc"))
 (ctable status "installed" recipe
         (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (db status "required" recipe
     (:name db :description "very simple database for emacslisp, can also wrap other databases." :depends kv :type github :pkgname "nicferrier/emacs-db"))
 (ddskk status "required" recipe
        (:name ddskk :load-path
               ("./" "./nicola" "./experimental" "./bayesian")
               :website "http://openlab.ring.gr.jp/skk/ddskk.html" :description "A Japanese input method on Emacs." :type github :pkgname "skk-dev/ddskk" :autoloads nil :info "doc/skk.info" :features
               ("skk-setup")
               :build
               `((,el-get-emacs "-batch" "-q" "-no-site-file" "-l" "SKK-MK" "-f" "SKK-MK-compile")
                 (,el-get-emacs "-batch" "-q" "-no-site-file" "-l" "SKK-MK" "-f" "SKK-MK-compile-info")
                 ("mv" "skk-setup.el.in" "skk-setup.el"))))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (direx status "required" recipe
        (:name direx :description "Directory Explorer" :type github :pkgname "m2ym/direx-el"))
 (dockerfile-mode status "required" recipe
                  (:name dockerfile-mode :description "An emacs mode for handling Dockerfiles." :type github :pkgname "spotify/dockerfile-mode" :prepare
                         (progn
                           (add-to-list 'auto-mode-alist
                                        '("Dockerfile\\'" . dockerfile-mode)))))
 (e2wm status "required" recipe
       (:name e2wm :description "simple window manager for emacs" :website "https://github.com/kiwanami/emacs-window-manager" :type github :pkgname "kiwanami/emacs-window-manager" :depends window-layout :features "e2wm"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :features el-get :post-init
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
 (emacs-async status "installed" recipe
              (:name emacs-async :description "Simple library for asynchronous processing in Emacs" :type github :pkgname "jwiegley/emacs-async"))
 (emacs-fish status "required" recipe
             (:name emacs-fish :type github :description "Emacs major mode for fish shell scripts." :pkgname "wwwjfy/emacs-fish"))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
             (deferred ctable)))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (eshell-better-prompt status "installed" recipe
                       (:name eshell-better-prompt :type git :url "https://github.com/yuutayamada/eshell-better-prompt.git"))
 (esxml status "required" recipe
        (:name esxml :description "Library for working with xml via esxml and sxml." :type github :pkgname "tali713/esxml" :depends
               (kv)))
 (evil status "installed" recipe
       (:name evil :website "https://github.com/emacs-evil/evil" :description "Evil is an extensible vi layer for Emacs. It\n       emulates the main features of Vim, and provides facilities\n       for writing custom extensions." :type github :pkgname "emacs-evil/evil" :features evil :depends
              (undo-tree goto-chg)
              :build
              (("make" "info" "all"))
              :build/berkeley-unix
              (("gmake" "info" "all"))
              :build/darwin
              `(("make" ,(format "EMACS=%s" el-get-emacs)
                 "info" "all"))
              :info "doc"))
 (evil-anzu status "installed" recipe
            (:name evil-anzu :features
                   (evil-anzu)
                   :after nil :depends
                   (anzu evil)
                   :description "anzu for evil-mode" :type github :pkgname "syohex/emacs-evil-anzu"))
 (evil-numbers status "required" recipe
               (:name evil-numbers :website "http://github.com/cofi/evil-numbers" :description "Increment/decrement numbers in Evil, the extensible vim\n       emulation layer. Like C-a/C-x in vim.\n\n       After installation, you will need to add a key-binding for evil-numbers.\n       For example:\n\n       (define-key evil-normal-state-map (kbd \"C-c +\") 'evil-numbers/inc-at-pt)\n       (define-key evil-normal-state-map (kbd \"C-c -\") 'evil-numbers/dec-at-pt)" :type github :pkgname "cofi/evil-numbers" :features evil-numbers :depends evil))
 (evil-surround status "required" recipe
                (:name evil-surround :website "http://github.com/timcharper/evil-surround" :description "Emulate Tim Pope's surround.vim in evil, the extensible vim\n       emulation layer for emacs" :type github :pkgname "timcharper/evil-surround" :features evil-surround :post-init
                       (global-evil-surround-mode 1)
                       :depends evil))
 (eww-lnum status "required" recipe
           (:name eww-lnum :type git :description "Hit A Hint implementation for eww" :url "https://github.com/m00natic/eww-lnum.git"))
 (f status "required" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
           (s dash)
           :type github :pkgname "rejeep/f.el"))
 (fakir status "required" recipe
        (:name fakir :description "Functions and macros to fake bit of Emacs core libraries, like files and processes." :type github :pkgname "nicferrier/emacs-fakir" :depends
               (noflet dash)))
 (fcitx status "installed" recipe
        (:name fcitx :description "Make fcitx better in Emacs" :type github :pkgname "cute-jumper/fcitx.el"))
 (festival status "required" recipe
           (:name festival :auto-generated t :type emacswiki :description "emacs interface into festival." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/festival.el"))
 (flx status "installed" recipe
      (:name flx :description "Fuzzy matching with good sorting in ido" :type github :pkgname "lewang/flx"))
 (flycheck status "installed" recipe
           (:name flycheck :type github :pkgname "flycheck/flycheck" :minimum-emacs-version "24.3" :description "On-the-fly syntax checking extension" :depends
                  (dash pkg-info let-alist seq)))
 (flycheck-irony status "required" recipe
                 (:name flycheck-irony :after nil :description "C, C++ and Objective-C support for Flycheck, using Irony Mode" :type github :pkgname "Sarcasm/flycheck-irony"))
 (flycheck-package status "required" recipe
                   (:name flycheck-package :type github :pkgname "purcell/flycheck-package" :depends
                          (flycheck)
                          :prepare
                          (with-eval-after-load "flycheck"
                            (setq flycheck-emacs-lisp-load-path 'inherit)
                            (add-hook 'emacs-lisp-mode-hook 'flycheck-package-setup))))
 (flycheck-tip status "installed" recipe
               (:name flycheck-tip :type github :pkgname "yuutayamada/flycheck-tip" :description "show you error by popup-tip" :depends
                      (flycheck popup)))
 (form-feed status "installed" recipe
            (:name form-feed :website "https://github.com/wasamasa/form-feed#readme" :description "Display ^L glyphs as horizontal lines" :type github :pkgname "wasamasa/form-feed"))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (ggtags status "required" recipe
         (:name ggtags :description "Use GNU Global in Emacs." :type github :pkgname "leoliu/ggtags"))
 (ginger-rephrase-api status "required" recipe
                      (:name ginger-rephrase-api :type git :url "https://gist.github.com/7349439.git"))
 (git-emacs status "required" recipe
            (:name git-emacs :type git :url "https://github.com/tsgates/git-emacs.git"))
 (git-gutter status "installed" recipe
             (:name git-gutter :description "Emacs port of GitGutter Sublime Text 2 Plugin" :website "https://github.com/syohex/emacs-git-gutter" :type github :pkgname "syohex/emacs-git-gutter"))
 (git-messenger status "required" recipe
                (:name git-messenger :description "Pops up commit messages at current line" :type github :pkgname "syohex/emacs-git-messenger" :depends
                       (popup)))
 (go-autocomplete status "required" recipe
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
 (go-eldoc status "required" recipe
           (:name go-eldoc :description "eldoc plugin for Go" :type github :pkgname "syohex/emacs-go-eldoc" :depends go-mode :post-init
                  (add-hook 'go-mode-hook 'go-eldoc-setup)))
 (go-mode status "required" recipe
          (:name go-mode :description "Major mode for the Go programming language" :type github :pkgname "dominikh/go-mode.el"))
 (google status "required" recipe
         (:name google :description "Emacs client for Google's search API" :type github :pkgname "steckerhalter/google-el"))
 (google-c-style status "installed" recipe
                 (:name google-c-style :type http :description "Google's C/C++ style for c-mode." :url "https://raw.githubusercontent.com/google/styleguide/gh-pages/google-c-style.el" :prepare
                        (progn
                          (autoload 'google-set-c-style "google-c-style" nil t)
                          (autoload 'google-make-newline-indent "google-c-style" nil t)
                          (eval-after-load 'cc-styles
                            '(progn
                               (require 'google-c-style)
                               (c-add-style "Google" google-c-style))))))
 (google-translate status "required" recipe
                   (:name google-translate :description "Emacs interface to Google Translate" :type github :pkgname "atykhonov/google-translate"))
 (goto-chg status "installed" recipe
           (:name goto-chg :description "Goto the point of the most recent edit in the buffer." :type emacswiki))
 (gradle-mode status "required" recipe
              (:name gradle-mode :type github :pkgname "jacobono/emacs-gradle-mode" :description "Minor mode for emacs to run gradle from emacs and not have to go to a terminal!"))
 (grammar status "required" recipe
          (:name grammar :type svn :url "http://bcui-emacs.googlecode.com/svn/trunk/grammar"))
 (grep-a-lot status "required" recipe
             (:name grep-a-lot :auto-generated t :type emacswiki :description "manages multiple search results buffers for grep.el" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/grep-a-lot.el"))
 (groovy-emacs-mode status "required" recipe
                    (:name groovy-emacs-mode :description "A groovy major mode, grails minor mode, and a groovy inferior mode." :type github :pkgname "Groovy-Emacs-Modes/groovy-emacs-modes"))
 (hangman status "required" recipe
          (:name hangman :type git :url "https://github.com/yuutayamada/hangman.git"))
 (haskell-mode status "required" recipe
               (:name haskell-mode :description "A Haskell editing mode" :type github :pkgname "haskell/haskell-mode" :info "." :build
                      `(("make" ,(format "EMACS=%s" el-get-emacs)
                         "all"))
                      :post-init
                      (progn
                        (require 'haskell-mode-autoloads)
                        (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
                        (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))))
 (helm status "installed" recipe
       (:name helm :post-init nil :description "Emacs incremental completion and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
              `(("make" ,(concat "ASYNC_ELPA_DIR="
                                 (el-get-package-directory 'emacs-async))))
              :depends
              (emacs-async)
              :build/darwin
              `(("make" ,(concat "ASYNC_ELPA_DIR="
                                 (el-get-package-directory 'emacs-async))
                 ,(format "EMACS_COMMAND=%s" el-get-emacs)))
              :build/windows-nt
              (let
                  ((generated-autoload-file
                    (expand-file-name "helm-autoloads.el"))
                   \
                   (backup-inhibited t))
                (update-directory-autoloads default-directory)
                nil)
              :features "helm-config"))
 (helm-ag-r status "required" recipe
            (:name helm-ag-r :type git :url "https://github.com/yuutayamada/helm-ag-r.git"))
 (helm-c-yasnippet status "installed" recipe
                   (:name helm-c-yasnippet :type github :pkgname "emacs-jp/helm-c-yasnippet" :description "Helm source for yasnippet.el." :features helm-c-yasnippet :depends
                          (helm yasnippet)))
 (helm-descbinds status "installed" recipe
                 (:name helm-descbinds :type github :pkgname "emacs-helm/helm-descbinds" :description "Yet Another `describe-bindings' with `helm'." :depends
                        (helm)
                        :prepare
                        (progn
                          (autoload 'helm-descbinds-install "helm-descbinds"))))
 (helm-ghq status "required" recipe
           (:name helm-ghq :description "Interfaces of ghq with helm." :type github :pkgname "masutaka/emacs-helm-ghq"))
 (helm-gtags status "required" recipe
             (:name helm-gtags :description "GNU GLOBAL Helm interface." :type github :pkgname "syohex/emacs-helm-gtags" :depends
                    (helm)))
 (helm-swoop status "required" recipe
             (:name helm-swoop :type github :description "Efficiently hopping squeezed lines powered by Emacs helm interface" :pkgname "ShingoFukuyama/helm-swoop" :depends
                    (helm)))
 (hi2 status "required" recipe
      (:name hi2 :description "Indentation module for Haskell mode" :type github :pkgname "errge/hi2" :prepare
             (autoload 'turn-on-hi2 "hi2" nil t)
             :depends
             (haskell-mode)))
 (hl-line+ status "required" recipe
           (:name hl-line+ :auto-generated t :type emacswiki :description "Extensions to hl-line.el." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/hl-line+.el"))
 (htmlize status "required" recipe
          (:type github :pkgname "emacsmirror/htmlize" :name htmlize :website "http://www.emacswiki.org/emacs/Htmlize" :description "Convert buffer text and decorations to HTML." :type emacsmirror :localname "htmlize.el"))
 (idle-require status "installed" recipe
               (:name idle-require :description "load elisp libraries while Emacs is idle" :type github :pkgname "nschum/idle-require.el"))
 (image-dired+ status "installed" recipe
               (:name image-dired+ :features
                      (image-dired+)
                      :after nil :website "https://github.com/mhayashi1120/Emacs-image-diredx" :description "Image-dired extensions" :type github :pkgname "mhayashi1120/Emacs-image-diredx"))
 (indent-guide status "installed" recipe
               (:name indent-guide :description "show vertical lines to guide indentation." :website "https://github.com/zk-phi/indent-guide" :type github :pkgname "zk-phi/indent-guide"))
 (inf-ruby status "required" recipe
           (:name inf-ruby :description "Inferior Ruby Mode - ruby process in a buffer." :type github :pkgname "nonsequitur/inf-ruby"))
 (irony-eldoc status "required" recipe
              (:name irony-eldoc :description "irony-mode support for eldoc-mode" :type github :pkgname "ikirill/irony-eldoc"))
 (irony-mode status "installed" recipe
             (:name irony-mode :features
                    (irony-mode)
                    :after nil :depends
                    (cl-lib)
                    :description "A C/C++ minor mode for Emacs powered by libclang" :type github :pkgname "Sarcasm/irony-mode" :compile "\\.el$"))
 (jedi status "required" recipe
       (:name jedi :description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :submodule nil :depends
              (epc auto-complete python-environment)))
 (js2-mode status "required" recipe
           (:name js2-mode :type git :url "https://github.com/mooz/js2-mode.git" :build
                  ("make")))
 (json-mode status "required" recipe
            (:name json-mode :build
                   `(,(Y/el-get-npm-install-maybe "jsonlint"))
                   :description "Major mode for editing JSON files, extends the builtin js-mode to add better syntax highlighting for JSON." :type github :pkgname "joshwnj/json-mode" :depends
                   (json-snatcher json-reformat)))
 (json-reformat status "required" recipe
                (:name json-reformat :description "Reformatting tool for JSON." :type github :pkgname "gongo/json-reformat"))
 (json-snatcher status "required" recipe
                (:name json-snatcher :description "Find the path to a value in JSON" :type github :pkgname "Sterlingg/json-snatcher"))
 (jstestmacs status "required" recipe
             (:name jstestmacs :type git :url "https://github.com/yuutayamada/jstestmacs.git"))
 (key-chord status "required" recipe
            (:name key-chord :description "Map pairs of simultaneously pressed keys to commands." :type emacswiki :features "key-chord"))
 (kv status "required" recipe
     (:name kv :description "Key/Value collection type functions: for alists, hashtables and plists. Useful stuff." :type github :pkgname "nicferrier/emacs-kv"))
 (less-css-mode status "required" recipe
                (:name less-css-mode :build
                       `(,(Y/el-get-npm-install-maybe "less" "lessc"))
                       :description "Emacs mode for LESS CSS (lesscss.org), with support for compile-on-save" :type github :pkgname "purcell/less-css-mode"))
 (let-alist status "installed" recipe
            (:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type elpa :url "https://elpa.gnu.org/packages/let-alist.html"))
 (lingr status "required" recipe
        (:name lingr :type git :url "https://github.com/lugecy/lingr-el.git"))
 (lispxmp status "required" recipe
          (:name lispxmp :description "Automagic emacs lisp code annotation" :type emacswiki :features "lispxmp"))
 (logalimacs status "required" recipe
             (:name logalimacs :type git :url "https://github.com/logaling/logalimacs.git"))
 (logito status "required" recipe
         (:name logito :type github :pkgname "sigma/logito" :description "logging library for Emacs" :website "http://github.com/sigma/logito"))
 (lua-mode status "installed" recipe
           (:name lua-mode :description "A major-mode for editing Lua scripts" :depends
                  (ample-regexps)
                  :type github :pkgname "immerrr/lua-mode"))
 (magit status "installed" recipe
        (:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :branch "master" :minimum-emacs-version "24.4" :depends
               (dash with-editor emacs-async)
               :info "Documentation" :load-path "lisp/" :compile "lisp/" :build
               `(("make" ,(format "EMACSBIN=%s" el-get-emacs)
                  "docs")
                 ("touch" "lisp/magit-autoloads.el"))
               :build/berkeley-unix
               `(("gmake" ,(format "EMACSBIN=%s" el-get-emacs)
                  "docs")
                 ("touch" "lisp/magit-autoloads.el"))
               :build/windows-nt
               (with-temp-file "lisp/magit-autoloads.el" nil)))
 (markdown-mode status "installed" recipe
                (:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :website "http://jblevins.org/projects/markdown-mode/" :type github :pkgname "jrblevin/markdown-mode" :prepare
                       (add-to-list 'auto-mode-alist
                                    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (mew status "required" recipe
      (:name mew :description "Mew is a mail reader for Emacs" :type git :url "https://github.com/kazu-yamamoto/Mew.git" :prepare
             (progn
               (setq mew-prog-mewl
                     (concat default-directory "bin/mewl"))
               (setq mew-prog-mime-encode
                     (concat default-directory "bin/mewencode"))
               (setq mew-prog-mime-decode
                     (concat default-directory "bin/mewencode"))
               (setq mew-prog-cmew
                     (concat default-directory "bin/cmew"))
               (setq mew-prog-est-update
                     (concat default-directory "bin/mewest"))
               (setq mew-prog-smew
                     (concat default-directory "bin/smew"))
               (setq mew-mbox-command
                     (concat default-directory "bin/incm")))
             :build
             `(("./configure" ,(concat "--with-emacs=" el-get-emacs))
               ("make"))))
 (migemo status "required" recipe
         (:name migemo :description "Japanese increment search with 'Romanization of Japanese'" :type github :pkgname "emacs-jp/migemo"))
 (minor-mode-hack status "required" recipe
                  (:name minor-mode-hack :auto-generated t :type emacswiki :description "Change priority of minor-mode keymaps" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/minor-mode-hack.el"))
 (multiple-cursors status "installed" recipe
                   (:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el"))
 (myhistory status "required" recipe
            (:name myhistory :type git :url "https://github.com/yuutayamada/myhistory.git"))
 (navi2ch status "required" recipe
          (:name navi2ch :type git :url "https://github.com/naota/navi2ch.git" :build
                 ("./configure && make")
                 :load-path
                 ("./" "./contrib" "./doc")))
 (nim-emacs-module status "installed" recipe
                   (:name nim-emacs-module :description "Make Emacs functions by Nim" :type github :pkgname "yuutayamada/nim-emacs-module" :minimum-emacs-version "25"))
 (nim-mode status "installed" recipe
           (:name nim-mode :type github :pkgname "yuutayamada/nim-mode" :depends
                  (flycheck company-mode epc let-alist commenter)))
 (noflet status "required" recipe
         (:name noflet :description "nic's overriding flet, for fleting functions for the purpose of decorating them" :type github :pkgname "nicferrier/emacs-noflet"))
 (nyan-mode status "required" recipe
            (:name nyan-mode :description "Nyan Cat for Emacs! Nyanyanyanyanyanyanyanyanyan!" :type github :pkgname "TeMPOraL/nyan-mode" :features nyan-mode))
 (ob-go status "required" recipe
        (:name ob-go :description "Org-Babel support for evaluating go code." :website "https://github.com/pope/ob-go" :type github :pkgname "pope/ob-go"))
 (open-junk-file status "required" recipe
                 (:name open-junk-file :description "Open a junk (memo) file to try-and-error" :type emacswiki :features "open-junk-file"))
 (org-mode status "installed" recipe
           (:name org-mode :website "http://orgmode.org/" :description "Org-mode is for keeping notes, maintaining ToDo lists, doing project planning, and authoring with a fast and effective plain-text system." :type git :url "git://orgmode.org/org-mode.git" :info "doc" :build/berkeley-unix `,(mapcar
                                                                                                                                                                                                                                                                                                       (lambda
                                                                                                                                                                                                                                                                                                         (target)
                                                                                                                                                                                                                                                                                                         (list "gmake" target
                                                                                                                                                                                                                                                                                                               (concat "EMACS="
                                                                                                                                                                                                                                                                                                                       (shell-quote-argument el-get-emacs))))
                                                                                                                                                                                                                                                                                                       '("oldorg"))
                  :build `,(mapcar
                            (lambda
                              (target)
                              (list "make" target
                                    (concat "EMACS="
                                            (shell-quote-argument el-get-emacs))))
                            '("oldorg"))
                  :load-path
                  ("." "contrib/lisp" "lisp")
                  :load
                  ("lisp/org-loaddefs.el")))
 (package status "installed" recipe
          (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "https://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :features package :post-init
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
                   (let
                       ((protocol
                         (if
                             (and
                              (fboundp 'gnutls-available-p)
                              (gnutls-available-p))
                             "https://"
                           (lwarn
                            '(el-get tls)
                            :warning "Your Emacs doesn't support HTTPS (TLS)%s"
                            (if
                                (eq system-type 'windows-nt)
                                ",\n  see https://github.com/dimitri/el-get/wiki/Installation-on-Windows." "."))
                           "http://"))
                        (archives
                         '(("melpa" . "melpa.org/packages/")
                           ("gnu" . "elpa.gnu.org/packages/")
                           ("marmalade" . "marmalade-repo.org/packages/"))))
                     (dolist
                         (archive archives)
                       (add-to-list 'package-archives
                                    (cons
                                     (car archive)
                                     (concat protocol
                                             (cdr archive)))))))))
 (packed status "installed" recipe
         (:name packed :type github :pkgname "tarsius/packed" :description "Package manager agnostic Emacs Lisp package utilities"))
 (pangu-spacing status "installed" recipe
                (:name pangu-spacing :description "Minor-mode to add space between Chinese and English characters." :type github :pkgname "coldnew/pangu-spacing"))
 (paredit status "installed" recipe
          (:name paredit :description "Minor mode for editing parentheses" :type github :prepare
                 (progn
                   (autoload 'enable-paredit-mode "paredit")
                   (autoload 'disable-paredit-mode "paredit"))
                 :pkgname "emacsmirror/paredit"))
 (pcache status "required" recipe
         (:name pcache :description "persistent caching for Emacs" :type github :pkgname "sigma/pcache"))
 (pdf-tools status "installed" recipe
            (:name pdf-tools :description "pdf tools" :type github :minimum-emacs-version "24.3" :pkgname "politza/pdf-tools" :depends
                   (let-alist tablist)
                   :prepare
                   (setq pdf-info-epdfinfo-program
                         (concat
                          (el-get-package-directory "pdf-tools")
                          "server/epdfinfo"))
                   :build
                   (("make"))
                   :load-path
                   (("lisp"))
                   :compile
                   ("lisp/")))
 (pkg-info status "installed" recipe
           (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
                  (dash epl)))
 (point-undo status "required" recipe
             (:name point-undo :auto-generated t :type emacswiki :description "undo/redo position" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/point-undo.el"))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :depends cl-lib :pkgname "auto-complete/popup-el"))
 (popwin status "installed" recipe
         (:name popwin :description "Popup Window Manager." :website "https://github.com/m2ym/popwin-el" :type github :pkgname "m2ym/popwin-el" :load-path
                ("." "misc")))
 (puppet-mode status "required" recipe
              (:name puppet-mode :description "A simple mode for editing puppet manifests" :type github :pkgname "lunaryorn/puppet-mode" :website "https://github.com/lunaryorn/puppet-mode" :prepare
                     (progn
                       (autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests" t)
                       (add-to-list 'auto-mode-alist
                                    '("\\.pp$" . puppet-mode)))))
 (python-environment status "required" recipe
                     (:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
                            (deferred)))
 (queue status "required" recipe
        (:name queue :description "Queue data structure" :type elpa))
 (quickrun status "installed" recipe
           (:name quickrun :description "Run commands quickly" :website "https://github.com/syohex/emacs-quickrun" :type github :pkgname "syohex/emacs-quickrun"))
 (rainbow-delimiters status "installed" recipe
                     (:name rainbow-delimiters :website "https://github.com/Fanael/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "Fanael/rainbow-delimiters"))
 (rainbow-mode status "installed" recipe
               (:name rainbow-mode :description "Colorize color names in buffers" :type elpa :prepare
                      (autoload 'rainbow-turn-on "rainbow-mode")))
 (request status "required" recipe
          (:name request :description "Easy HTTP request for Emacs Lisp" :type github :submodule nil :pkgname "tkf/emacs-request"))
 (revive status "installed" recipe
         (:name revive :description "Revive.el saves current editing status including the window splitting configuration, which can't be recovered by `desktop.el' nor by `saveconf.el', into a file and reconstructs that status correctly." :website "http://www.gentei.org/~yuuji/software/" :type http :url "http://www.gentei.org/~yuuji/software/revive.el" :features "revive"))
 (ruby-block status "required" recipe
             (:name ruby-block :type http :url "https://raw.github.com/emacsmirror/emacswiki.org/master/ruby-block.el" :description "highlight matching block"))
 (ruby-electric status "required" recipe
                (:name ruby-electric :description "Electric commands editing for ruby files" :type github :pkgname "qoobaa/ruby-electric" :post-init
                       (add-hook 'ruby-mode-hook 'ruby-electric-mode)))
 (rust-mode status "required" recipe
            (:name rust-mode :type github :pkgname "rust-lang/rust-mode" :description "Emacs mode for Rust"))
 (s status "required" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
 (sane-term status "installed" recipe
            (:name sane-term :description "Ansi Term with sane options and the ability to cycle/create terms" :website "https://github.com/adamrt/sane-term" :type github :pkgname "adamrt/sane-term"))
 (seq status "installed" recipe
      (:name seq :description "Sequence manipulation library for Emacs" :builtin "25" :type github :pkgname "NicolasPetton/seq.el"))
 (seqcmd status "installed" recipe
         (:name seqcmd :type github :pkgname "yuutayamada/seqcmd"))
 (set-perl5lib status "required" recipe
               (:name set-perl5lib :type http :url "http://coderepos.org/share/browser/lang/elisp/set-perl5lib/set-perl5lib.el?format=txt" :description "set path into PERL5LIB if its file path includes 'lib' directory" :website "http://d.hatena.ne.jp/sun-basix/20080117/1200528765" :localname "set-perl5lib.el"))
 (smtpmail-multi status "required" recipe
                 (:name smtpmail-multi :type http :url "http://www.emacswiki.org/emacs-en/download/smtpmail-multi.el"))
 (spinner status "required" recipe
          (:name spinner :description "Emacs mode-line spinner for operations in progress." :type github :pkgname "Bruce-Connor/spinner.el"))
 (splitter status "required" recipe
           (:name splitter :type http :url "https://raw.githubusercontent.com/chumpage/chumpy-windows/master/splitter.el"))
 (sql-indent status "required" recipe
             (:name sql-indent :type git :url "https://github.com/yuutayamada/sql-indent.git"))
 (sudo-ext status "required" recipe
           (:name sudo-ext :description "sudo support" :type emacswiki))
 (suggestion-box status "installed" recipe
                 (:name suggestion-box :type github :pkgname "yuutayamada/suggestion-box-el" :depends
                        (popup)))
 (suggestion-box-nim status "installed" recipe
                     (:name suggestion-box-nim :type github :pkgname "yuutayamada/suggestion-box-nim-el" :depends
                            (suggestion-box)))
 (svg-mode-line-themes status "required" recipe
                       (:name svg-mode-line-themes :description "Awesome mode-line for emacs!" :type github :pkgname "sabof/svg-mode-line-themes" :depends xmlgen))
 (tabbar status "installed" recipe
         (:name tabbar :description "Display a tab bar in the header line." :type github :pkgname "dholm/tabbar" :lazy t))
 (tablist status "installed" recipe
          (:name tablist :description "Extended Emacs tabulated-list-mode." :website "https://github.com/politza/tablist" :type github :pkgname "politza/tablist"))
 (transpose-frame status "required" recipe
                  (:name transpose-frame :type git :url "https://github.com/emacsmirror/transpose-frame.git"))
 (twittering-mode status "required" recipe
                  (:name twittering-mode :description "Major mode for Twitter" :type github :pkgname "hayamiz/twittering-mode" :features twittering-mode :compile "twittering-mode.el"))
 (undo-tree status "installed" recipe
            (:name undo-tree :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/"))
 (viewer status "required" recipe
         (:name viewer :auto-generated t :type emacswiki :description "View-mode extension" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/viewer.el"))
 (vimrc-mode status "required" recipe
             (:name vimrc-mode :description "Enables syntax highlighting for .vimrc/_vimrc files" :type github :pkgname "mcandre/vimrc-mode" :prepare
                    (progn
                      (add-to-list 'auto-mode-alist
                                   '(".vim\\(rc\\|peratorrc\\)?$" . vimrc-mode)))))
 (visual-fill-column status "required" recipe
                     (:name visual-fill-column :type github :pkgname "joostkremers/visual-fill-column" :after nil))
 (vlfi status "required" recipe
       (:name vlfi :description "View Large Files" :type github :pkgname "m00natic/vlfi"))
 (web status "required" recipe
      (:name web :description "A useful HTTP client in EmacsLisp" :depends fakir :type github :pkgname "nicferrier/emacs-web"))
 (web-mode status "required" recipe
           (:name web-mode :after nil :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode"))
 (wgrep status "installed" recipe
        (:name wgrep :description "Writable grep buffer and apply the changes to files" :type github :pkgname "mhayashi1120/Emacs-wgrep"))
 (window-layout status "required" recipe
                (:name window-layout :description "window layout manager" :website "https://github.com/kiwanami/emacs-window-layout" :type github :pkgname "kiwanami/emacs-window-layout" :features "window-layout"))
 (windows status "installed" recipe
          (:name windows :before
                 (progn
                   (defconst win:switch-prefix
                     (kbd "M-g"))
                   (defconst win:use-frame nil)
                   (defconst win:base-key
                     (1- 97))
                   (defconst win:max-configs
                     (+
                      (- 122 97)
                      2))
                   (defconst win:quick-selection nil)
                   (defconst revive:ignore-buffer-pattern "^ \\*")
                   (add-hook 'after-make-frame-functions
                             '(lambda
                                (frame)
                                (select-frame frame)
                                (defconst win:frames-in-nw
                                  (if
                                      (display-graphic-p)
                                      nil t)))))
                 :description "Window manager for GNU Emacs." :website "http://www.gentei.org/~yuuji/software/" :type http :url "http://www.gentei.org/~yuuji/software/windows.el" :depends
                 (revive)
                 :features "windows"))
 (with-editor status "installed" recipe
   (:name with-editor :description "Use the Emacsclient as $EDITOR" :type github :pkgname "magit/with-editor"))
 (xmlgen status "required" recipe
         (:name xmlgen :description "Generate xml using sexps with the function `xmlgen'" :type github :pkgname "philjackson/xmlgen"))
 (yaml-mode status "required" recipe
            (:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode"))
 (yasnippet status "installed" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
                   (("git" "submodule" "update" "--init" "--" "snippets"))))
 (yatemplate status "required" recipe
             (:name yatemplate :description "File templates with yasnippet" :type github :depends
                    (yasnippet)
                    :pkgname "mineo/yatemplate")))
