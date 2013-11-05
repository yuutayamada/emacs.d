;;; init_xmp.el --- init file for xmp.el

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

;; rcodetools
(add-to-list 'load-path
             (shell-command-to-string
              (concat "ruby -e " "'"
                      "require \"rubygems\"
print Gem.find_files(\"rcodetools\")[0].split(\"/\")[0..-3].join(\"/\")"
                      "'")))

(require 'rcodetools)
(require 'ruby-mode)

(define-key ruby-mode-map (kbd "C-c C-c") 'xmp)

(provide 'init_xmp)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_xmp.el ends here
