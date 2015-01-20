;;; init_bpe.el --- init file for bpe.el

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
;;
;; (defconst bpe:account user-mail-address)
;; (defconst bpe:blog-name "blog name")
;; (defconst bpe:multiple-blog-names
;;   '(("blog name 1" . "~/articles/blog1")
;;     ("blog name 2" . "~/articles/blog2")
;;     ("blog name 3".  "~/articles/blog3")))

;;; Code:
(require 'init_org)

(require 'bpe)
(setq bpe:no-ask t
      bpe:lang "ja_JP.UTF-8"
      bpe:use-real-post-when-updating t)

(provide 'init_bpe)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_bpe.el ends here
