;;; -*- coding: utf-8 -*-

(require 'init_logalimacs)
(require 'hangman)
(setq hm-dictionary-file "~/.logaling/glossary/my-dictionary.en.ja.yml"
      hm-use-other-format t
      ;;hm-current-fetch-process :practice
      hm/english-question-collections
      '("~/Dropbox/Document/english_word_peanuts_gold.org"
        "~/Dropbox/Document/english_word_peanuts_silver.org"
        "~/Dropbox/Document/english_word_peanuts_copper.org"))

(provide 'init_hangman)

