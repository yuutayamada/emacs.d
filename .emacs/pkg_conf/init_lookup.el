;;; init_lookup.el --- init file for lookup.el

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

(defconst lookup-search-agents
  '((ndeb "~/Dropbox/dict/EPWING/COBUILD")
    (ndspell)))
(defconst lookup-default-dictionary-options '((:stemmer . stem-english)))
(defconst lookup-max-history 0) ; 0 means unlimited

(load "lookup-autoloads")
(require 'lookup)
(require 'lookup-vars)
(require 'my_autoload)
(require 'init_festival)
(require 'mykie)

(mykie:set-keys lookup-summary-mode-map
  "S-SPC" :default lookup-summary-previous-page
  "s"     :default my/lookup-by-ace-jump
  "j"     :default my/helm-lookup-history)

(defconst ndeb-binary-programs '((wave "mplayer")
                                 (mpeg ("mplayer" "/play") :direct t)))
(defconst ndeb-program-arguments '("-e" "euc-jp"))
(defconst ndeb-play-sound-from-entry "z")
(defconst ndeb-play-movie-from-entry "x")

(defadvice lookup-pattern
  (around ad-say-by-festival activate)
  "Speak text that user is searching."
  (condition-case err
      (my/festival (ad-get-arg 0))
    (error err))
  ad-do-it)

(defadvice lookup-pattern
  (around add-condition-case-for-fallback activate)
  "Fallback by searched word if lookup was failed."
  (condition-case err
      ad-do-it
    (error
     (when (string-match " No entry for query: " (format "%s" err))
       (eiji:search (ad-get-arg 0))))))

(defun my/lookup/ace-jump-action ()
  "Action for `my/lookup-by-ace-jump."
  (lookup-pattern (or (word-at-point) ""))
  (remove-hook 'ace-jump-mode-end-hook 'my/lookup/ace-jump-action))

(defun my/lookup-by-ace-jump ()
  "Look up word by using ace-jump."
  (interactive)
  (add-hook 'ace-jump-mode-end-hook 'my/lookup/ace-jump-action)
  (ace-jump-do
   (concat "\\b" (regexp-quote (make-string 1 (read-char "ace-jump: "))))))

(require 'myhistory)

(provide 'init_lookup)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_lookup.el ends here
