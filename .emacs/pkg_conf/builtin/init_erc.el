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

(defun Y/start-irc ()
  "Connect to IRC."
  (interactive)
  (let* ((nickname "uta"))
    (setq erc-autojoin-channels-alist
          '(("freenode.net"
             "#documentcloud" "#emacs" "#git" "#javascript" "#lisp" "#node.js"
             "#ruby-lang" "#scala" "#evil-mode" "#go-nuts")
            ("oftc.net"
             "#awesome" "#debian")
            ("undernet"
             "#toronto"))
          erc-nick (append `(,nickname)
                           (cl-loop for i from ?a upto ?z
                                    for string = (char-to-string i)
                                    if (string-match "[a-z]" string)
                                    collect (concat nickname (capitalize string)))))
    (erc-tls :server "irc.oftc.net" :port 6697
             :full-name "Y eugene Y")
    (erc :server "irc.freenode.net" :port 6667
         :full-name "Y eugene Y")))

(add-hook 'erc-mode-hook 'flyspell-mode-on)

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
