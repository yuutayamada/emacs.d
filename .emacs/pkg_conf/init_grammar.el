;;; init_grammar.el --- init file for grammer.el

;; Copyright (C) 2014 by Yuta Yamada

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
(require 'vars)
(require 'my_autoload)
(require 'grammar)
(let ((exe-file (concat el-get-dir "grammar/grammar")))
  (if (file-exists-p exe-file)
      (defconst grammar-program-name exe-file)
    (message "Can't find grammar file.")))

;; (defconst my/grammar-default-sentence-end ".:;?\"!。ぁ-んァ-ン")
;; (defvar my/grammar-sentence-end-local nil)

;; (defun* my/grammar-check (&optional (sentence ""))
;;   (interactive)
;;   (if current-prefix-arg
;;       (progn (grammar-mode 0)
;;              (grammar-delete-all-overlays))
;;     (unless (bound-and-true-p gramar-mode)
;;       (grammar-mode))
;;     (unless (bound-and-true-p my/grammar-sentence-end-local)
;;       (my/grammar-set-sentence-end))
;;     (let ((sentence-end
;;            (format "[%s%s]" my/grammar-sentence-end-local sentence)))
;;       (save-current-buffer
;;         (save-restriction
;;           (lexical-let ((p (point)))
;;             (backward-sentence)
;;             (narrow-to-region p (point))
;;             (goto-char p)
;;             (grammar-check)))))))

;; (defun my/grammar-check-auto ()
;;   ""
;;   (when (and (or (and (bound-and-true-p mykie:prog-mode-flag)
;;                       (capitalizer-comment-or-string-p))
;;                  (not (bound-and-true-p mykie:prog-mode-flag)))
;;              (bound-and-true-p grammar-mode)
;;              (not (bobp))
;;              ;; 46 dot, 63 question, 58 colon, 59 semi colon
;;              (member (char-before) '(46 63))
;;              (case major-mode
;;                (org-mode (not (org-in-src-block-p)))
;;                (t t)))
;;     (my/grammar-check)))

;; (defun my/grammar-set-sentence-end ()
;;   (interactive)
;;   (setq-local my/grammar-sentence-end-local
;;               (format "%s%s"
;;                       my/grammar-default-sentence-end
;;                       (replace-regexp-in-string " " "" (or comment-start "")))))

;; (add-hook 'post-self-insert-hook 'my/grammar-check-auto)

(provide 'init_grammar)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_grammar.el ends here
