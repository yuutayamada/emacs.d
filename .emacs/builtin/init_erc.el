;;; init_erc.el --- init file for erc.el

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

(require 'erc)
(require 'erc-join)
(require 'cl-lib)

;;;###autoload
(defun Y/erc-start-irc ()
  "Connect to IRC."
  (interactive)
  ;; (erc-tls :server "irc.oftc.net" :port 6697
  ;;          :full-name (user-full-name))
  (erc :server "irc.freenode.net" :port 6667
       :full-name (user-full-name)))

(setq erc-quit-reason-various-alist
      '(("test" "testing IRC software on Emacs")
        ;; Default message
        ("^$" "Quit: leaving")))

;; For tabbar mode
(setq erc-header-line-uses-tabbar-p t)

(defun erc-prompt ()
  (concat (buffer-name) ": "))

(provide 'init_erc)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_erc.el ends here
