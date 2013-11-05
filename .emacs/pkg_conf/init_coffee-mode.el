;;; init_coffee-mode.el --- init file for coffee-mode

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

(require 'coffee-mode)
(require 'flymake-easy)
(require 'flymake-coffee)

;; To create configuration file, execute below comamnd
;; $ coffeelint --makeconfig > config.json
(setq flymake-coffee-coffeelint-configuration-file
      (expand-file-name "~/.coffeelint.json"))

(add-hook 'coffee-mode-hook 'flymake-coffee-load)

(add-hook 'after-save-hook
          '(lambda ()
             (when (or (string-match "\\.coffee$" buffer-file-name)
                       (equal major-mode 'coffee-mode))
               (coffee-compile-file))))

(provide 'init_coffee-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_coffee-mode.el ends here
