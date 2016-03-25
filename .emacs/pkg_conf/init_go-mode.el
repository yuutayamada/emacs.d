;;; init_go-mode.el --- init file for go-mode

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
;; godef, godoc, gocode

;;; Code:

(let* ((root
        (getenv "GOPATH"))
       (gocode
        (format "%s%s" root "/src/github.com/nsf/gocode/emacs/")))
  (if (and (not (file-exists-p root))
           (not (file-exists-p gocode)))
      (error (format "%s or %s not found" root gocode))
    (add-to-list 'load-path gocode)))

(require 'my_autoload)
(require 'go-mode)
(require 'company-go) ; in the gocode
(require 'commenter)

(add-hook
 'go-mode-hook
 '(lambda()
    (setq-local company-backends '(company-go))
    ;; Use goimports instead of go-fmt
    (setq gofmt-command "goimports") ; goimports
    ;; (define-key go-mode-map (kbd "C-3") 'masaw-mode)
    (my/remap-semicolon go-mode-map)
    (setq-local commenter-config
                '((single
                   . ((comment-start      . "//")
                      (comment-end        . "")
                      (comment-start-skip . "\\(//+\\|/\\*+\\)\\s *")))
                  (multi
                   . ((comment-start      . "/* ")
                      (comment-end        . " */")
                      (comment-start-skip . "/\\*")
                      (comment-end-skip   . "\\*/")
                      (comment-continue   . " * ")
                      (comment-padding    . " ")
                      (comment-multi-line . t)))))
    (commenter-setup)
    (go-eldoc-setup)))

(defadvice gofmt-before-save
  (around add-guard-conditions activate)
  "Prevent gofmt when current buffer has error or it is in org-src-buffer."
  (unless (and (bound-and-true-p flycheck-current-errors)
               (org-src-edit-buffer-p))
    ad-do-it))

(defun Y/go-mode-deploy-android-app ()
  ""
  (let ((dir (locate-dominating-file default-directory "AndroidManifest.xml")))
    (if (and (eq major-mode 'go-mode) dir
             (locate-dominating-file default-directory "main.go")
             (file-newer-than-file-p
              buffer-file-name (concat dir "bin/nativeactivity-debug.apk")))
        (progn (async-shell-command (format "cd %s; ./all.bash" dir))
               t)
      nil)))

(provide 'init_go-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_go-mode.el ends here
