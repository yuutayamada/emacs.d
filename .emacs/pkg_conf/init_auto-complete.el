;;; init_auto-complete.el --- init file for autocomplete.el -*- lexical-binding: t; -*-

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

(require 'cl-lib)
(require 'my_autoload)
(defconst ac-dictionary-directories (concat el-get-dir "auto-complete/dict"))
(require 'auto-complete-config)
(ac-config-default)

;; To change TAB key's behavior:
;; (define-key ac-completing-map (kbd "TAB") 'ac-start)
(ac-set-trigger-key "TAB")
(setq ac-auto-start (if ac-trigger-key nil 3))

(setq
 ac-ignore-case 'smart
 ac-use-fuzzy t
 ac-use-comphist t
 ac-use-menu-map t
 ac-delay 0.1
 ac-auto-show-menu 0.8
 ac-menu-height 20
 ac-candidate-limit nil
 ac-user-dictionary-files '("~/.aspell.en.pws"))

(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-menu-map (kbd "RET") nil)

;;; Sources
;; ac-source-abbrev
;; ac-source-dictionary
;; ac-source-words-in-buffer
;; ac-source-words-in-all-buffer
;; ac-source-words-in-same-mode-buffers
;; ac-source-features
;; ac-source-functions
;; ac-source-variables
;; ac-source-symbols
;; ac-source-yasnippet

;; Set default sources
(defvar my/ac-sources-default '(ac-source-words-in-same-mode-buffers
                                ac-source-yasnippet))
(setq-default ac-sources my/ac-sources-default)

(defun my/ac-add-sources-for-prog ()
  "Add ac-sources for each programming-mode."
  (let ((add-source
                 (lambda (s)
                   (setq ac-sources (append `(,s) my/ac-sources-default)))))
    (cl-case major-mode
      (go-mode      (funcall add-source 'ac-source-go))
      (haskell-mode (add-to-list 'ac-sources 'ac-source-ghc-mod)))))

(ac-flyspell-workaround) ; to use at flyspell
(global-auto-complete-mode t)

(provide 'init_auto-complete)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_auto-complete.el ends here
