;;; init_view-mode.el --- init file for view mode

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
(require 'dired)
(require 'viewer)
(require 'view)
(require 'init_mykie)

;; 特定のファイル・全てのファイルをview-modeで開く
;; logファイルはview-modeで
(setq view-mode-by-default-regexp "\\.log$")

;;* view-mode key-binds
(mykie:set-keys view-mode-map
  "N"   :default View-search-last-regexp-backward
  "?"   :default View-search-regexp-backward
  "SPC" :default view-mode ;off にする時
  "1"   :default follow-mode
  "2"   :default split-window-vertically
  "3"   :default split-window-horizontally
  ";"   :default anything-refe
  "a"   :default anything-apropos
  "b"   :default View-scroll-page-backward
  "c"   :default View-scroll-page-backward
  "d"   :default kill-buffer-and-window
  "e"   :default yas/new-snippet
  "f"   :default View-scroll-page-forward
  "g"   :default anything-bm-list
  "h"   :default backward-char
  "H"   :default move-dired-current-dir
  "i"   :default view-mode
  "j"   :default next-line
  "k"   :default previous-line
  "l"   :default forward-char
  "m"   :default bm-toggle
  "n"   :default View-scroll-half-page-forward
  "N"   :default my-view-next-file
  "o"   :default my-other-window-on-view-mode
  "p"   :default View-scroll-half-page-backward
  "P"   :default my-view-previous-file
  "q"   :default anything-for-files
  "r"   :default reload-view-mode-priority
  "s"   :default (global-key-binding (kbd "C-v"))
  "t"   :default (global-key-binding (kbd "M-v"))
  "T"   :default tetris
  "C-t" :default other-window-or-split
  "u"   :default fold-dwim-hide-all
  "v"   :default View-scroll-page-forward
  "w"   :default anything-w3m-bookmarks
  "x"   :default seq-end
  "y"   :default anything-c-yas-visit-snippet-file
  "Y"   :default yas/new-snippet
  "z"   :default seq-home
  "["   :default bm-previous
  "]"   :default bm-next
  ","   :default tabbar-backward-tab
  "."   :default tabbar-forward-tab)

(provide 'init_view)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_view.el ends here
