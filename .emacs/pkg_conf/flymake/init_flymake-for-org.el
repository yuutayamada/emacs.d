;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(require 'init_flymake)

;;;*flymake org-babelで使えるように
(push '(".*Org Src.*\\[ C \\]" flymake-c-init flymake-simple-cleanup-extra)
      flymake-allowed-file-name-masks)
(push '(".*Org Src.*\\[ ruby \\]" flymake-ruby-init flymake-simple-cleanup)
      flymake-allowed-file-name-masks)

(defun enable-flymake-setup ()
  "org-babel (ob-C) のバッファに flymake-mode を適用する。"
  (flymake-mode t)
  (define-key (current-local-map) "\C-cc" 'flymake-start-syntax-check)
  (define-key (current-local-map) "\C-ce" 'flymake-show-and-sit)
  (define-key (current-local-map) "\C-cn" 'flymake-goto-next-error)
  (define-key (current-local-map) "\C-cp" 'flymake-goto-prev-error))

(defadvice org-src-mode-configure-edit-buffer
  (after org-src-mode-configure-edit-buffer-for-c activate)
  "c-mode-common-hook が走るタイミングでは buffer-file-name が設定されていない
ため、少し遅延して setup を実施する。"
  (enable-flymake-setup))

(provide 'init_flymake-for-org)
