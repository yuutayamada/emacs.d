;;; init_helm.el --- init file for helm.el

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
(require 'helm-config)

(add-hook 'helm-before-initialize-hook
          '(lambda ()
             ;; Common configuration
             (setq helm-candidate-number-limit 9999
                   helm-maybe-use-default-as-input t)
             ;; Unset key C-h to use normal C-h
             (define-key helm-map (kbd "C-h") nil)
             (require 'init_helm-migemo)))

;; Define helm split window function
(defconst helm-split-window-preferred-function 'split-window-sensibly)

(provide 'init_helm)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_helm.el ends here
