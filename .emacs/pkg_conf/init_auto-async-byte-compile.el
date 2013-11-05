;;; init_auto-async-byte-compile.el --- init file for auto-async-byte-compile.el

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
;; To byte-compile el file, needs adding below code before load the .el file.
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
;;; Code:
(defconst my/emacs-program
  (let ((emacs-dev
         (format "%s/git.savannah.gnu.org/emacs/src/emacs"
                 (shell-command-to-string "echo -n `ghq root`"))))
    (if (executable-find emacs-dev)
        emacs-dev
      "emacs")))

(advice-add 'aabc/emacs-command :override (lambda () my/emacs-program))

(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")

(provide 'init_auto-async-byte-compile)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_auto-async-byte-compile.el ends here
