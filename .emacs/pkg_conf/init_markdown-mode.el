;;; init_markdown-mode.el --- init file for markdown-mode

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
(require 'init_yasnippet)
(require 'markdown-mode)
(require 'my_autoload)
(require 'hideshow)

(add-hook 'markdown-mode-hook
          '(lambda ()
             (auto-complete-mode t)
             (mykie:set-keys markdown-mode-map
               "M-n" "M-p")))

(provide 'init_markdown-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_markdown-mode.el ends here
