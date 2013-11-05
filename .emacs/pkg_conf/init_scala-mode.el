;;; init_scala-mode.el --- init file for scala

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
(require 'scala-mode2)
(require 'init_ensime)
(require 'my_autoload)

;;; For evil
(my/evil-inject-hjkl-keybinds+ ensime-compile-result-map)

(my/remap-semicolon scala-mode-map)

(add-hook 'scala-mode-hook
          '(lambda ()
             (setq-local pane-window-3pane-buffers
                         '("*ENSIME-Compilation-Result*" "*sbtp-console*"))
             (setq-local pane-window-2pane-other-buffer "*sbtp-console*")))

(provide 'init_scala-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_scala-mode.el ends here
