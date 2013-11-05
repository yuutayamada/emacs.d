;;; init_js2-mode.el --- init file for js2-mode

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

;; (require 'init_node-console)
(require 'js2-mode)

(add-hook 'js2-mode-hook
          '(lambda ()
             (setq tab-width js2-basic-offset)
             (local-set-key "\C-x\C-e" 'js-send-last-sexp)
             (local-set-key "\C-\M-x"  'js-send-last-sexp-and-go)
             (local-set-key "\C-cb"    'js-send-buffer)
             (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
             (local-set-key "\C-cl"    'js-load-file-and-go)
             (local-set-key "\C-cp"    'js2-prev-error)
             (local-set-key "\C-cn"    'js2-next-error)
             (local-set-key "\C-ct"    'jste-dwim)
             (local-set-key "\C-c\C-t" 'jste-dwim)
             (local-set-key (kbd "C-0") 'my/infospecter)))

(provide 'init_js2-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_js2-mode.el ends here
