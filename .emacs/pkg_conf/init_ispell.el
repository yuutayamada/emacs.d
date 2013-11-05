;;; init_ispell.el --- init file for ispell

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

(require 'ispell)

(add-hook 'ispell-initialize-spellchecker-hook
          ;; I couldn't use ispell in latest Emacs(25.0.x)
          ;; because so I load below ispell instead. 12/24/2014
          ;; I know this is dirty code...
          '(lambda ()
             (load "/usr/share/emacs/site-lisp/dictionaries-common/ispell" t)))

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
