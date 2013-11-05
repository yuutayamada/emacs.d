;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; require cmigemo
;; To install, aptitude install cmigemo for ubuntu
(require 'migemo nil t)

;; for C/Migemo
(setq migemo-command "cmigemo"
      migemo-options '("-q" "--emacs" "-i" "\g")
      migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict"
      migemo-user-dictionary nil
      migemo-regex-dictionary nil
      migemo-isearch-enable-p nil
      migemo-coding-system 'utf-8)

;; ruby migemo
;; (setq
;;  ;; moccur-use-migemo t
;;  ;; where which ruby
;;  migemo-command "/usr/bin/ruby")

(provide 'init_migemo)
