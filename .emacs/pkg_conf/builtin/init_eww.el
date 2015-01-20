;;; init_eww.el --- init file for eww.el
;; Author: Yuta Yamada <cokesboy"at"gmail.com>
;;; Commentary:

;;; Code:
(when (fboundp 'eww)
  (defadvice eww (around eww-move-to-other-window activate)
    "Move to other window before booting eww."
    (win-switch-to-window 1 5) ; 5 means e of eww
    (delete-other-windows)
    ad-do-it))

(defconst eww-search-prefix
  (assoc-default
   :google
   '((:duckduckgo . "https://duckduckgo.com/?q=")
     (:google     . "https://www.google.com/search?q="))))

(require 'mykie)
(mykie:set-keys eww-mode-map
  "n" :default shr-next-link
  "." :default eww-next-url
  "," :default eww-back-url
  "h" :default backward-char
  "j" :default next-line
  "k" :default previous-line
  "l" :default forward-char
  "p" :default shr-previous-link
  "e" :default eww
  "s" :default eww
  ;; eww-lnum.el
  "o"
  :default eww-lnum-follow
  :C-u     eww-lnum-universal)

(provide 'init_eww)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_eww.el ends here
