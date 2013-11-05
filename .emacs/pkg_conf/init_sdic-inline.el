;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;;;sdic inline
(require 'sdic-inline)
(sdic-inline-mode t) ; sdic-inline モードの起動
(setq sdic-inline-word-at-point-strict t)

; 辞書ファイルの設定
(setq sdic-inline-eiwa-dictionary "~/Dropbox/dict/gene.sdic")
(setq sdic-inline-waei-dictionary "~/Dropbox/dict/jedict.sdic")

; sdic tooltip
(require 'sdic-inline-pos-tip)
(setq sdic-inline-display-func 'sdic-inline-pos-tip-show)

(setq transient-mark-mode t)

(defun sdic-inline-pos-tip-show-when-region-selected (entry)
(cond
((and transient-mark-mode mark-active)
(funcall 'sdic-inline-pos-tip-show entry))
(t
; (funcall 'sdic-inline-display-minibuffer entry)
)))

(setq sdic-inline-search-func 'sdic-inline-search-word-with-stem)
(setq sdic-inline-display-func 'sdic-inline-pos-tip-show-when-region-selected)
(define-key sdic-inline-map "\C-c\C-p" 'sdic-inline-pos-tip-show)

(provide 'init_sdic-inline)
