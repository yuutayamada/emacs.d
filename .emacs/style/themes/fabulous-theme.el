;;; color-theme-fabulous.el --- init file for my color theme

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

(deftheme fabulous "my color theme for emacs -nw")

(custom-theme-set-faces
 'fabulous

 ;; Default
 '(cursor  ((t (:foreground "#F8F8F0"))))
 ;; Note: do not specify unspecified-fg as foreground, it can not load
 ;; from other color theme.
 '(default ((t (:background "unspecified-bg"))))

 ;; ;; Region
 ;; '(region ((t (:background "blue"))))
 ;; '(secondary-selection ((t :backgroud "#00005F")))

 ;; Current line
 ;; '(highlight ((t (:foreground "#000000" :background "#C4BE89"))))
 '(hl-line   ((t (:background "#111111"
                              :foreground "#ffffff"
                              :distant-foreground "#000000"
                              :inverse t
                              :box  (:line-width -1 :color "red")))))

 ;; ;; link
 ;; '(link       ((t :foreground "#00d7ff")))

 ;; match
 ;; '(match ((t :background "#0000ee")))

 ;; ;; Minibuffer
 ;; '(minibuffer-prompt ((t (:foreground "#Afffff"))))

 ;; ;; Paren
 ;; '(show-paren-match ((t (:foreground "yellow" :background "white"))))
 ;; '(paren-face       ((t (:foreground "#a6e22a" :background nil))))

 ;; ;; shadow
 ;; '(shadow ((t (:foreground "#c6c6c6"))))

 ;; ;; Org-mode
 ;; '(org-hide ((t (:inherit 'shadow :foreground nil))))

 )

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'fabulous)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; color-theme-fabulous.el ends here
