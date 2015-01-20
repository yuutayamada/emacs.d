;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(require 'ruby-mode)

;; (require 'init_auto-complete)

;; rsense
(defconst rsense-home (getenv "RSENSE_HOME"))
(defconst rsense-rurema-home "~/Dropbox/Document/rurema")

(when (add-to-list 'load-path (concat rsense-home "/etc"))
  (require 'rsense)
  ;; rsense
  ;; .や::を入力直後から補完開始
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (add-to-list 'ac-sources 'ac-source-rsense-method)
               (add-to-list 'ac-sources 'ac-source-rsense-constant)))

  ;; C-x .で補完出来るようキーを設定
  (define-key ruby-mode-map (kbd "C-S-l") 'ac-complete-rsense))

(provide 'init_rsense)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_rsense.el ends here
