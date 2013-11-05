;;; init_js.el --- init file for js-mode

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

;;;* JavaScript
(require 'js)
(defadvice js-mode (around preload-for-js-mode activate)
  "Load init file for JavaScript."
  (if (string-match "\\(\\.json\\|\\.org$\\|\\.gold\\)" buffer-file-truename)
      ad-do-it
    (js2-mode)))

;; (require 'init_jstestmacs)
;; (require 'my_autoload)

;; (defun my/js-init-mozrepl+sleme ()
;;   "Load mozrepla+slime configurations."
;;   (require 'init_moz)
;;   (require 'init_slime))

;; (defun my/search-js-manual (&optional word)
;;   (interactive)
;;   (let* ((search-word (or word (word-at-point)
;;                           (read-string "Search: "))))
;;     (popwin:popup-buffer
;;      (get-buffer-create "w3m")
;;      :stick t :height (/ (window-height) 2) :position :top)
;;     (w3m-browse-url (concat "http://jsman.net/?q=" search-word))))

(provide 'init_js)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_js.el ends here
