;;; init_lookup.el --- init file for lookup.el

;;; Commentary:
;; Add kind of configuration to use EPWING dictionary:
;; (defconst lookup-search-agents
;;   '((ndeb "~/Dropbox/dict/EPWING/COBUILD")
;;     (ndspell)))
;; (defconst lookup-default-dictionary-options '((:stemmer . stem-english)))
;; (defconst lookup-max-history 0) ; 0 means unlimited
;;; Code:
(require 'lookup)
(require 'lookup-vars)
(require 'Y-autoload)
(require 'init_festival)
(require 'mykie)

(mykie:set-keys lookup-summary-mode-map
  "S-SPC" lookup-summary-previous-page
  "l"     Y/lookup
  "j"     my/helm-lookup-history)

(defconst ndeb-binary-programs '((wave "mplayer")
                                 (mpeg ("mplayer" "/play") :direct t)))
(defconst ndeb-program-arguments '("-e" "euc-jp"))
(defconst ndeb-play-sound-from-entry "z")
(defconst ndeb-play-movie-from-entry "x")

(defadvice lookup-pattern (around ad-say-by-festival activate)
  "Speak text that user is searching."
  (condition-case err
      (my/festival (ad-get-arg 0))
    (error err))
  ad-do-it)

(defadvice lookup-pattern (around add-condition-case-for-fallback activate)
  "Fallback by searched word if lookup was failed."
  (condition-case err
      ad-do-it
    (error
     (when (string-match " No entry for query: " (format "%s" err))
       (eiji:search (ad-get-arg 0))))))

(require 'Y-function)
(defun Y/lookup (&optional word)
  "Search English word's meaning from my dictionaries.
If user specified WORD then search form it."
  (interactive)
  (lookup)
  (let ((get-word (lambda (&optional ask)
                    (my/delete-trailing-space
                     (or (unless ask (word-at-point))
                         (read-string "lookup: " (word-at-point)))))))
    (if word
        (lookup-pattern word)
      (with-no-warnings
        (mykie
         :default (lookup-pattern (funcall get-word))
         :lookup-summary-mode (lookup-pattern (funcall get-word t))
         ;; :repeat  (my/festival    (funcall get-word))
         :C-u     (lookup-pattern (funcall get-word t))
         :region-handle-flag 'copy
         :region  (lookup-pattern mykie:region-str))))))

(require 'myhistory)

(provide 'init_lookup)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_lookup.el ends here
