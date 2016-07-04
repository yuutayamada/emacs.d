;;; init_doc-view.el --- init file for doc-view.el

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

(require 'Y-autoload)
(require 'doc-view)
(require 'init_mykie)

;; (setq doc-view-ghostscript-program "evince")
;; (setq doc-view-ghostscript-options nil
;;       ;; '(        ;; "-r600x72"
;;       ;;   "-dSAFER" "-dNOPAUSE"
;;       ;;   "-sDEVICE=png16m"
;;       ;;   "-dTextAlphaBits=4"
;;       ;;   "-dGraphicsAlphaBits=4"
;;       ;;   "-dBATCH" "-dQUIET")
;;       )

;; pdf-to-text program
(setq doc-view-pdftotext-program "/usr/bin/pdftotext")

(mykie:set-keys doc-view-mode-map
  "n"    doc-view-next-line-or-next-page
  "p"    doc-view-previous-line-or-previous-page
  "v"    doc-view-next-page
  "c"    doc-view-previous-page
  "g"    doc-view-goto-page
  "C-f"  image-forward-hscroll
  "C-b"  image-backward-hscroll
  "f"    image-forward-hscroll
  "b"    image-backward-hscroll
  "C-s"  my/anything-pdfgrep)

(add-hook 'view-mode-hook
          '(lambda ()
             (when (eql major-mode 'doc-view-mode)
               (define-key view-mode-map "-" nil)
               (define-key view-mode-map "n" nil)
               (define-key view-mode-map "p" nil))))

(defadvice doc-view-next-page
  (around my-doc-view-next-page activate)
  (let* ((hscroll (image-mode-window-get 'hscroll)))
      ad-do-it
      (image-set-window-hscroll hscroll)))

(defadvice doc-view-previous-page
  (around my-doc-view-previous-page activate)
  (let* ((hscroll (image-mode-window-get 'hscroll)))
    ad-do-it
    (image-set-window-hscroll hscroll)))

(defadvice doc-view-previous-line-or-previous-page
  (around my-doc-view-p-line-or-previous-page activate)
  (let* ((hscroll (image-mode-window-get 'hscroll)))
      ad-do-it
      (image-set-window-hscroll hscroll)))

(defadvice doc-view-next-line-or-next-page
  (around my-doc-view-n-line-or-next-page activate)
  (let* ((hscroll (image-mode-window-get 'hscroll)))
      ad-do-it
      (image-set-window-hscroll hscroll)))

(provide 'init_doc-view)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_doc-view.el ends here
