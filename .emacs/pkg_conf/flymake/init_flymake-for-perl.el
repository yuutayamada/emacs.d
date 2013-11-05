;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(require 'init_flymake)
;; you can install set-perl5lib from el-get
;; 開いたスクリプトのパスに応じて、@INCDDにlibを追加してくれる
;; 以下からダウンロードする必要あり
(require 'set-perl5lib)

;;;*perl
(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "perl" (list "-wc" local-file))))

(defvar flymake-perl-err-line-patterns
  '(("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1)))

(push '(".+\\.pl$" flymake-perl-init) flymake-allowed-file-name-masks)
(push '(".+\\.pm$" flymake-perl-init) flymake-allowed-file-name-masks)
;; (push '(".*Org Src.*\\[ perl \\]" flymake-perl-init) flymake-allowed-file-name-masks)

(add-hook
 'cperl-mode-hook
 '(lambda ()
    ;; Don't want flymake mode for ruby regions in rhtml files
    (if (not (null buffer-file-name)) (flymake-mode))))

(provide 'init_flymake-for-perl)
