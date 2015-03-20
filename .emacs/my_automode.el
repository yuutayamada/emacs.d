;;; my_automode.el --- define auto-mode

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'my_util)

(my/def-auto-mode
 c-mode                "\\.\\(c\\|h\\)\\'"
 c++-mode              "\\.\\(C\\|cc\\|cxx\\|cpp\\|cp\\|hh\\|H\\|hpp\\|hxx\\)\\'"
 common-lisp-mode      "\\.\\(lisp\\|l\\|cl\\|lsp\\)\\'"
 coffee-mode           "\\.coffee\\'"
 conf-mode             "\\.co?nf\\'"
 crontab-mode          "\\(\\.cron\\(tab\\)?\\|cron\\(tab\\)?\\.?\\)\\'"
 clojure-mode          "\\.clj\\'"
 dockerfile-mode       "[dD]ockerfile\\'"
 go-mode               "\\.go\\'"
 ace-mode              "\\.ace\\'"
 web-mode              "\\.ejs\\'"
 haskell-mode          "\\.hs\\'"
 haskell-cabal-mode    "\\.cabal\\'"
 literate-haskell-mode "\\.lhs\\'"
 jade-mode             "\\.\\(jade\\|amber\\)\\'"
 lua-mode              "\\.lua\\'"
 markdown-mode         "\\.\\(md\\|mdown\\|mkd\\|mkdn\\|markdown\\)\\'"
 org-mode              "\\.org\\'"
 cperl-mode            "\\.pl\\'"
 ruby-mode             "\\(\\.rb\\|[Rr]akefile\\|rake\\|Gemfile\\)\\'"
 rust-mode             "\\.\\(rs\\|rc\\)\\'"
 stylus-mode           "\\.styl\\'"
 scala-mode            "\\.\\(scala\\|sbt\\)\\'"
 yaml-mode             "\\.yml\\'"
 default-generic-mode  "\\..*ignore\\'")

(cl-loop for pair in '(("runghc"     . haskell-mode)
                       ("runhaskell" . haskell-mode)
                       ("ruby"       . ruby-mode)
                       ("node"       . js2-mode)
                       ("miniperl"   . cperl-mode))
         do (add-to-list 'interpreter-mode-alist pair))

(provide 'my_automode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_automode.el ends here
