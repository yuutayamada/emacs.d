;;; init_nim-mode.el --- Configuration for nim-mode -*- lexical-binding: t; -*-

;; Copyright (C) 2016 by Yuta Yamada

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

;; My configuration for ‘nim-mode’.

;; There is another general programming configuration here:
;; https://github.com/yuutayamada/emacs.d/blob/master/.emacs/builtin/init_prog-mode.el

;;; Code:

(require 'Y-autoload)
(el-get 'sync 'quickrun)

;;;###autoload
(el-get 'sync 'nim-mode)

(require 'nim-mode)

;; An Emacs package to write Emacs extensions by Nim (totally optional)
(el-get 'sync 'nim-emacs-module 'suggestion-box)

;; This ‘nim-nimsuggest-path’ variable is automatically set the return
;; value of ‘executable-find’, so if you include nimsuggest to your
;; PATH, you don’t need this configuration.
;; (ghq: https://github.com/motemen/ghq)
(unless nim-nimsuggest-path
  (let ((sug "%s/github.com/yuutayamada/nimsuggest/nimsuggest"))
    (setq nim-nimsuggest-path
          (format sug (shell-command-to-string "echo -n `ghq root`")))))

(add-hook 'nim-mode-hook 'nimsuggest-mode)

(defun Y/nim-mode-common-setup ()
  "My configuration for ‘nim-mode’ and ‘nimscript-mode’."
  ;; My key bindings for nim-mode and nimscript-mode.
  (define-key nim-mode-map (kbd "C-0") 'my-nim-print))

(add-hook 'nim-mode-hook 'Y/nim-mode-common-setup)

(require 'nim-suggest)
(require 'suggestion-box)

(defun my-nim-print ()
  "Just for debugging purpose for nimsuggest."
  (interactive)
  (let ((nim-suggest-ignore-dir-regex ""))
    (nim-call-epc
     ;; con dus
     'sug ; def ;dus ; sug ; 'dus ; 9, 3
     (lambda (args)
       (message "%s" args)))))

(define-key nim-mode-map (kbd "C-0") 'my-nim-print)

;; (require 'flycheck-nimsuggest)
(provide 'init_nim-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_nim-mode.el ends here
