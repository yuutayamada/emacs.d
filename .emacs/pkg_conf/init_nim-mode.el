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

(require 'nim-mode)

(require 'el-get)
;; An Emacs package to write Emacs extensions by Nim
(el-get 'sync 'nim-emacs-module)

;; This ‘nim-nimsuggest-path’ variable is automatically set the return
;; value of ‘executable-find’, so if you include nimsuggest to your
;; PATH, you don’t need this configuration.
;; (ghq: https://github.com/motemen/ghq)
(unless nim-nimsuggest-path
  (setq nim-nimsuggest-path
        (format "%s/github.com/yuutayamada/nimsuggest/nimsuggest_mr"
                (shell-command-to-string "echo -n `ghq root`"))))

(require 'nim-suggest)

;; Modify triple double quote to another form (for ‘pretty-symbol-mode’)
;; my memo:
;;   http://unicode.org/cldr/utility/confusables.jsp?a=%22&r=None
;;   https://en.wikipedia.org/wiki/Quotation_mark
;;   http://unicode-table.com/en/search/?q=quotation
(setq nim-pretty-triple-double-quotes (cons ?„ ?”))

(defun Y/nim-mode-common-setup ()
  "My configuration for ‘nim-mode’ and ‘nimscript-mode’."
  ;; Comment style. see also ‘comment-styles’ variable.
  (setq-local comment-style 'indent)

  (nimsuggest-mode +1)

  ;; My key bindings for nim-mode and nimscript-mode.
  (define-key nim-mode-map (kbd "C-0") 'my-nim-print)
  (define-key nim-mode-map (kbd "C-h") 'nim-electric-backspace)

  ;; If you bind another function to TAB that
  ;; ‘nim-indent-trigger-commands’ doesn’t include, you have to
  ;;  add the function to ‘nim-indent-trigger-commands’ to use cycle
  ;;  indent.
  ;;
  ;; For example:
  ;;   (add-to-list 'nim-indent-trigger-commands 'your-function)
  ;;
  ;; Below configuration is workaround for my package
  ;; https://github.com/yuutayamada/mykie-el
  ;; Normally above ‘(add-to-list ...)’ is enough though.
  (define-key nim-mode-map (kbd "TAB")
    '(lambda ()
       (interactive)
       (setq this-command 'indent-for-tab-command)
       (mykie:global-map:<tab>:key))))

(add-hook 'nim-mode-hook 'Y/nim-mode-common-setup)

(defun my-nim-print ()
  "Just for debugging purpose for nimsuggest."
  (interactive)
  (let ((nim-suggest-ignore-dir-regex ""))
    (nim-call-epc
     ;; con dus
     'sug ; def ;dus ; sug ; 'dus ; 9, 3
     (lambda (args) (message "%s" args)))))

(provide 'init_nim-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_nim-mode.el ends here
