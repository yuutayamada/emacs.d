;;; init_popwin.el --- init file for popwin.el

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
(require 'init_windows) ; must load windows.el before loading popwin.el
(require 'popwin)

(defun my/popwin-adjust-size-current-window ()
  (interactive)
  (let ((half-width  (/ (frame-width)  2))
        (half-height (/ (frame-height) 2)))
    (setq
     popwin:popup-window-height half-height
     popwin:popup-window-width  half-width)))

(my/popwin-adjust-size-current-window)
(add-hook 'popwin:before-popup-hook 'my/popwin-adjust-size-current-window)

(setq popwin:special-display-config
      (append
       `(("*Remember*" :stick t)
         ("*Org Agenda*")
         ("*helm gtags*" :position bottom :stick t)
         ("*helm-go*|godoc" :position right :stick t)
         ("*Go output*" :dedicated t :position right)
         ("*Backtrace*")
         ("*quickrun*")
         ("*sdic*" :noselect t)
         (" *auto-async-byte-compile*" :position right)
         ("*Colors*")
         ("\*grep\*.*" :regexp t :stick t)
         ("*markdown-output*" :noselect)
         ("\\\*e?shell\\\*" :position right :regexp t)
         ("*Help*" :position right)
         ("*translated*" :position top :height 10)
         ("\*Man .+\*" :regexp t :position right)
         ;; ("^\*helm.+\*$" :regexp t)
         (":home")
         ("*bpe*")
         ("*MozRepl*" :position bottom)
         ("*EIJIRO*" :position right)
         ("*ri(helm-rb)*")
         ;; Note:
         ;; `async shell command buffer' is not acceptable
         ;; when I use this buffer on popwin then this buffer is
         ;; closed immediately.
         )
       popwin:special-display-config))

;; ================================================
;; There is a bug of Emacs 24.3?
;; https://github.com/m2ym/popwin-el/issues/93
(setq popwin:close-popup-window-timer-interval 0.1)
(defun my/BitesTheDust ()
  "Purge `popwin:close-popup-window-timer' if those were multiple"
  (cl-loop with new-timer-list = '()
           for vector in timer-list
           for count = 0 then count
           for pw-timer-p = (equal 'popwin:close-popup-window-timer (elt vector 5))
           if pw-timer-p
           do (setq count (1+ count))
           if (or (<= count 1) (not pw-timer-p))
           collect vector into new-timer-list
           finally (setq timer-list new-timer-list)))

(add-hook 'popwin:after-popup-hook 'my/BitesTheDust)
;; ================================================

(popwin-mode t)

(provide 'init_popwin)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_popwin.el ends here
