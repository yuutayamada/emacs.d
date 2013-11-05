;;; init_rust-mode.el --- init file for rust-mode.el

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

(require 'rust-mode)
(require 'racer)
(require 'thingatpt)
(require 'cl-lib)

(setq racer-cmd    (locate-library "racer")
      rust-srcpath (getenv "RUST_SRC_PATH")
      ;; indentation
      rust-indent-offset tab-width)

;; https://github.com/rust-lang/rust/issues/2207
(defvar my/rustdoc-path
  (concat "file:///home/ck/.ghq/github.com/"
          "rust-lang/rust/doc/std/index.html?search="))

(defun my/rustdoc ()
  ""
  (interactive)
  (browse-url-firefox
   (concat my/rustdoc-path
           (read-from-minibuffer "rustdoc: " (word-at-point)))))

;; (getenv "GTAGSLIBPATH")


;; (setq tags-table-list '("~/.tags/rust/TAGS.emacs"))
;; ctags-exuberant: Warning: "--language" option is obsolete; use "--language-force" instead
;; ctags-exuberant: Unknown language "Rust:.rs" in "language" option
;; file:///home/ck/.ghq/github.com/rust-lang/rust/doc/index.html?search=arena#libraries

;; ~/.ghq/github.com/rust-lang/rust/doc/

(provide 'init_rust-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_rust-mode.el ends here
