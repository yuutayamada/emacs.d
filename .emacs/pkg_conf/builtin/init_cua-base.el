;;; init_cua-base.el --- init file for cua-base.el

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

;; 矩形選択
(require 'cua-base)
(require 'cua-rect)

(cua-mode t)
(setq cua-enable-cua-keys nil) ;; 変なキーバインド禁止
(define-key cua-global-keymap (kbd "C-S-SPC") nil)

(provide 'init_cua-base)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_cua-base.el ends here
