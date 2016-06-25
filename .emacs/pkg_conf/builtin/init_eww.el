;;; init_eww.el --- init file for eww.el
;; Author: Yuta Yamada <cokesboy"at"gmail.com>
;;; Commentary:

;;; Code:
(defconst eww-search-prefix
  (assoc-default
   :google
   '((:duckduckgo . "https://duckduckgo.com/?q=")
     (:google     . "https://www.google.com/search?q="))))

(require 'mykie)
(mykie:set-keys eww-mode-map
  "n" shr-next-link
  "." eww-next-url
  "," eww-back-url
  "h" backward-char
  "j" next-line
  "k" previous-line
  "l" forward-char
  "p" shr-previous-link
  "e" eww
  "s" eww
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
