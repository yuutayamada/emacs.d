;;; init_ruby-mode.el --- init file for Ruby

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
;; To use xmp, you need 'gem install rcodetools'

;; make sure rsense configuration
;; http://cx4a.org/software/rsense/manual.html

;;; Code:
(require 'my_autoload)
(require 'ruby-mode)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq inf-ruby-buffer "*inf-ruby*")
             (require 'smartparens-ruby)
             (my/remap-semicolon ruby-mode-map)
             (setq tab-width 2
                   ruby-electric-expand-delimiters-list nil
                   ruby-indent-tabs-mode nil)
             (electric-pair-mode 0)))

;;ruby-elctric
(let ((rel (assq 'ruby-electric-mode minor-mode-map-alist)))
  (setq minor-mode-map-alist
        (append (delete rel minor-mode-map-alist) (list rel))))

(provide 'init_ruby-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ruby-mode.el ends here
