;;; init_flycheck.el --- init file for flycheck.el

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
(defconst error-tip-timer-delay 0.3)

;; (setq
;;  ;; This variable is timer delay for moving.
;;  ;; If you increase this, showing speed will be slow when you call
;;  ;; flycheck-tip-cycle function continuously.
;;  error-tip-timer-delay 0.5 ; default is 0.3
;;  ;; This variable is timer delay that you talked about in this issue and
;;  ;; this is flycheck's timer delay.
;;  flycheck-display-errors-delay 0.3)
;; (flycheck-tip-use-timer nil)

(require 'my_autoload)
(require 'flycheck)
(require 'flycheck-tip)

;; ;; You can specify 'normal, 'verbose or nil
(flycheck-tip-use-timer 'normal)

;; Add load-path
(setq-default flycheck-emacs-lisp-load-path load-path)

(defadvice flycheck-mode
  (around avoid-flycheck-if-needed activate)
  "Turn off flycheck in specific buffer."
  (unless (or (org-in-src-block-p)
              (member (buffer-name) '(".emacs" "*scratch*"))
              (string-match "^\\*Org Src .*\\*" (buffer-name)))
    ad-do-it))

(defadvice flycheck-finish-syntax-check
  (around ad-avoid-this-func activate)
  "Avoid flycheck on org src buffer."
  (when (not (org-src-edit-buffer-p))
    ad-do-it))

;; verilog
(flycheck-define-checker verilog-verilator
  "A Verilog syntax checker using the Verilator Verilog HDL simulator.

See URL `http://www.veripool.org/wiki/verilator'."
  :command ("verilator" "--lint-only" "-Wall" "--bbox-sys"
            ;; "--bbox-unsup"
            source)
  :error-patterns
  ((warning line-start "%Warning-" (zero-or-more not-newline) ": "
            (file-name) ":" line ": " (message) line-end)
   (error line-start "%Error: " (file-name) ":"
          line ": " (message) line-end))
  :modes verilog-mode)

;; Nim
(flycheck-define-checker nim-checker
  "A Nim error checker"
  :command ("nim" "check" source)
  :error-patterns
  ((warning line-start (file-name) "(" line ", " column ") Hint: "  (message) line-end)
   (error   line-start (file-name) "(" line ", " column ") Error: " (message) line-end))
  :modes (nim-mode))

(provide 'init_flycheck)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_flycheck.el ends here
