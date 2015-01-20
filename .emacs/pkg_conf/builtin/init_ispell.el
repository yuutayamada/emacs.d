;;; init_ispell.el --- init file for ispell -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'ispell)

;; my/get-aspell-capital-words
(with-no-warnings
  (let ((config (getenv "XDG_CONFIG_HOME"))
        (setup (lambda ()
                 (defvar my/aspell-capitalized-words
                   (my/get-aspell-capital-words ispell-personal-dictionary))
                 (setq auto-capitalize-words
                       `("I" "English" "Japan" "ASAP" "Linux"
                         "Japanese" "ASCII" "CPU" "Halloween"
                         ,@my/aspell-capitalized-words)))))
    (cond
     ;; TODO: move configuration to ASPELL_CONF environment variable
     ((executable-find "aspell")
      (setq ispell-program-name "aspell"
            ispell-personal-dictionary (concat config "/aspell/.aspell.en.pws")
            ispell-dictionary "american"
            ispell-extra-args  `("--sug-mode=ultra" "--lang=en_US"
                                 ,(format "--home-dir=%s"
                                          (concat config "/aspell")))))
     ;; Hunspell is slow? If I used multilingual file.
     ((executable-find "hunspell")
      (setq ispell-program-name "hunspell"
            ispell-personal-dictionary (concat config "/hunspell/.hunspell_en_US")
            ispell-extra-args '("-d en_US, ja_JP"))))
    (funcall setup)))

;; work around ispell's highlighting of Japanese characters
(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+"))

(provide 'init_ispell)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ispell.el ends here
