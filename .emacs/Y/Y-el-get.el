;;; Y-el-get.el --- init file for el-get.el

;;; Commentary:

;; el-get’s Recipe format (I need this for my volatility brain)
;; =================

;; The recipe for the hypothetical package named `el-get-example' must be
;; provided in a file named `el-get-example.rcp'.  This file will be
;; searched for as described in *Note Organizing recipes::.  The variable
;; `el-get-sources' is also considered as a recipe source, as detailed in
;; *Note Organizing recipes::.

;; A recipe file contains a Lisp property list.  Accepted properties are
;; described in the documentation for the variable `el-get-sources', and
;; their possible values are described at the same place.

;;    If your property list is missing the `:type' property, then it's
;; merged with the recipe one, so that you can override any definition
;; provided by `el-get' recipes locally.

;; `:name'
;;      The name of the package.  It can be different from the name of the
;;      directory where the package is stored (after a `git clone' for
;;      example), in which case a symlink will be created.

;; `:depends'
;;      A single package name, or a list of package names, on which the
;;      package depends.  All of a packages dependencies will be installed
;;      before the package is installed.

;; `:builtin'
;;      A string containing the Emacs version (see EMACS-MAJOR-VERSION
;;      variable) from which Emacs includes the recipe as a builtin.  For
;;      example, `package.el' (the implementation of ELPA) is part of
;;      Emacs 24 but needs an external recipe for previous major versions.

;;      Unlike the builtin `:type' no `:build' or `:info' properties are
;;      executed if this matches.

;; `:pkgname'
;;      The name of the package for the underlying package management
;;      system (apt-get, fink or pacman, also supported by github and
;;      emacsmirror), which can be different from the Emacs package name.

;; `:type'
;;      The type of the package, currently el-get offers support for
;;      apt-get, elpa, git, github, emacsmirror, git-svn, bzr svn, cvs,
;;      darcs, fink, ftp, emacswiki, http-tar, pacman, hg and http.  You
;;      can easily support your own types here, see EL-GET-METHODS.

;; `:branch'
;;      Which branch to fetch when using git (and by extension, github and
;;      emacsmirror, which are derived from git).  Also supported in the
;;      installer in el-get-install.

;; `:url'
;;      Where to fetch the package, only meaningful for git and http types.

;; `:username, :pkgname'
;;      For the github type, these specify the user name and repo name to
;;      clone from Github.  For example, for el-get, the user name would be
;;      `"dimitri"' , and the repo name would be `"el-get"' . As described
;;      above, the `:pkgname' property is only required if the repo name
;;      on Github differs from the Emacs package name.  Note that the
;;      emacsmirror type is just like the github type with `:username' set
;;      to `"emacsmirror"' .

;; `:build'
;;      Your build recipe, a list.  A build command C whose `car' is a
;;      symbol  (see `symbolp') will be replaced by (eval C).

;;      Then, each element of the recipe will be interpreted as a command:

;;      If the element is a list of string, the first element of the list
;;      must be the program to call, and each following element a different
;;      argument to the call.  No whitespace parsing is done.

;;      Otherwise, if it is a list, any list sub-elements will be
;;      recursively "flattened" (see `el-get-flatten').  The resulting
;;      strings will be interpreted as individual shell arguments,
;;      appropriately quoted.

;; `:build/system-type'
;;      Your specific build recipe for a given SYSTEM-TYPE gets there and
;;      looks like `:build'.

;; `:load-path'
;;      A directory or a list of directories you want El-Get to add to your
;;      LOAD-PATH.  Those directories are relative to where the package
;;      gets installed.

;; `:compile'
;;      Allow to restrict what to byte-compile: by default, El-Get will
;;      compile all elisp files in the `:load-path' directories, unless a
;;      `:build' command exists for the package source.  Given a `:compile'
;;      property, El-Get will only byte-compile those given files,
;;      directories or filename-regexpes in the property value.  This
;;      property can be a `listp' or a `stringp' if you want to compile
;;      only one of those.

;; `:info'
;;      This string allows you to setup a directory where to find a
;;      `package.info' file, or a `path/to/whatever.info' file.  It will
;;      even run `ginstall-info' for you to create the `dir' entry so that
;;      `C-h i' will be able to list the newly installed documentation.
;;      Note that you might need to kill (`C-x k' ) your info buffer then
;;      `C-h i' again to be able to see the new menu entry.

;; `:load'
;;      List of files to load, or a single file to load after having
;;      installed the source but before `require'ing its features.

;; `:features'
;;      List of features el-get will `require' for you.

;; `:autoloads'
;;      Control whether El-Get should generate autoloads for this package.
;;      Setting this to `nil' prevents El-Get from generating autoloads
;;      for the package.  Default is `t'.  Setting this to a string or a
;;      list of string will load the named autoload files.

;; `:library'
;;      When using `:after' but not using `:features' , `:library' allows
;;      to set the library against which to register the `:after' function
;;      against `eval-after-load'.  It defaults to either `:pkgname' or
;;      `:package' , in this order.  See also `el-get-eval-after-load' .

;; `:options'
;;      Currently used by http-tar and cvs support.  When using http-tar,
;;      it allows you to give the tar options you want to use.  Typically
;;      would be `"xzf"' , but you might want to choose `"xjf"' for
;;      handling `.tar.bz' files e.g.

;;      When using CVS, when it's set to `"login"', El-Get will first
;;      issue a `cvs login' against the server, asking you interactively
;;      (in the minibuffer) any password you might to enter, and only then
;;      it will run the `cvs checkout' command.

;; `:module'
;;      Currently only used by the cvs support, allow you to configure the
;;      module you want to checkout in the given URL.

;; `:repo'
;;      Only used by the elpa support, a cons cell with the form `(NAME .
;;      URL)' , as in PACKAGE-ARCHIVES .  If the package source only
;;      specifies a URL, the URL will be used for NAME as well.

;; `:prepare'
;;      This should be a Lisp form to evaluate after both the
;;      INFO-DIRECTORY-LIST and the LOAD-PATH variables have been taken
;;      care of, but before loading the package or any further action from
;;      `el-get-init' .  It will be run with DEFAULT-DIRECTORY set to the
;;      package directory.

;; `:before'
;;      This exactly like `:prepare' property, but is reserved for user
;;      customizations in EL-GET-SOURCES .  Recipe files should not use
;;      this property.  It will be run just after :prepare.

;; `:post-init'
;;      This should be a Lisp form to evaluate after loading the package.
;;      Intended for use from recipes.  This function is registered for
;;      `eval-after-load' against the recipe library by `el-get-init' once
;;      the `:load' and `:features' have been setup.  Like `:prepare' , it
;;      will be run with DEFAULT-DIRECTORY set to the package directory.

;; `:after'
;;      This exactly like the `:post-init' property, but is reserved for
;;      user customizations in EL-GET-SOURCES.  Recipe files should not
;;      use this property.  It will be run just after `:post-init' and
;;      after any per-package user-init-file (see
;;      EL-GET-USER-PACKAGE-DIRECTORY).

;; `:lazy'
;;      Default to `nil' .  Allows to override EL-GET-IS-LAZY per package.

;; `:localname'
;;      Currently only used by both `http' and `ftp' supports, allows to
;;      specify the target name of the downloaded file.

;;      This option is useful if the package should be retrieved using a
;;      presentation interface (such as as web SCM tool).

;;      For example, destination should be set to `package.el' if the
;;      package url has the following scheme:

;;      "http://www.example.com/show-as-text?file=path/package.el"

;; `:website'
;;      The website of the project.

;; `:description'
;;      A short description of the project.

;; `:checksum'
;;      Some methods in El-Get download files that are not so trusted
;;      (e.g. anyone is allowed to modify emacswiki anytime).  For these
;;      cases you can set up a checksum value for a package, so you will
;;      notice if El-Get tries to install a version that you haven't seen
;;      before.  The installation will simply fail and you will see the
;;      good and bad checksum values in `*Messages*'.  To get the checksum
;;      value for a package initially, install the package while
;;      EL-GET-VERBOSE is on.

;;      Checksum calculation is currently supported by these methods with
;;      the following meaning:

;;      http, ftp and emacswiki with the SHA1 of the downloaded file

;;      git in which it is an alias for `:checkout' (see below)

;; `:checkout'
;;      A git refspec (branch, tag, commit hash) that should be checked out
;;      after cloning the git repository.  If provided, this overrides any
;;      value for the `:branch' property.  Unlike the `:branch' property,
;;      this can be any valid argument to git checkout, including a tag
;;      name or a commit hash.  The intended use of this property is to
;;      "lock" a repository at a particular revision, regardless of what
;;      happens to the repo upstream.

;;      Currently this property only has meaning for git type recipes.
;;      Other VCS-based methods may implement support in the future.

;; `:shallow'
;;      If set to t in a git recipe, `git-clone' will be run with `--depth
;;      1' , which will create a so-called shallow clone by not
;;      downloading all the history of the repository.  The default is
;;      controlled by the variable EL-GET-GIT-SHALLOW-CLONE, which is
;;      `nil' by default.

;; `:submodule'
;;      If set to `nil' in a git recipe, submodules will not be updated.

;; the order:
;;   :prepare -> :before -> (condition) -> :post-init :after

;; variables:
;;   ‘el-get-verbose’ -- output verbose message
;; (setq el-get-verbose t)
;; .loaddefs.el:3626:7:Warning: assignment to free variable `jedi:setup-function'
;; .loaddefs.el:3626:43:Warning: assignment to free variable `jedi:mode-function'
;; .loaddefs.el:7809:140:Warning: assignment to free variable `org-load-hook'

;;; Code:
(require 'Y-paths)

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
           :type github
           :pkgname "yuutayamada/auto-capitalize-el")
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
           :autoloads "skk-autoloads"
           :features ()
           :load-path ("./" "./nicola" "./experimental" "./bayesian"))
    ;; E
    (:name eshell-better-prompt
           :type git
           :url "https://github.com/yuutayamada/eshell-better-prompt.git")
    (:name eiji
           :type git
           :url "https://github.com/yuutayamada/eiji.git")
    ;; H
    (:name helm :post-init ()) ; avoid helm-mode

    ;; G
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

    (:name sudo-ext
           :description "sudo support"
           :type emacswiki)

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

(defsubst el-get-update-all (&rest _r)
  "Prohibit ‘el-get-update-all’."
  (interactive)
  (message "Never do this again! Never!"))

(provide 'Y-el-get)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-el-get.el ends here
