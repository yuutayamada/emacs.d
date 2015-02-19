;;; init_org.el --- init file for org-mode

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
(require 'org)
(require 'ob-go)
(require 'init_org-mobile)
(require 'init_org-indent)
(require 'mykie)
;; Footer information
(defconst org-html-postamble "")

;; Modify header
(defun Y/org-html-export-to-html (professor class)
  "Add PROFESSOR name and CLASS to the html header.
For my college life."
  (interactive)
  (let* ((prof (format "Professor %s" professor))
         (file (replace-regexp-in-string "_" " " (file-name-base)))
         (org-html-preamble-format
          `(("en" ,(mapconcat 'identity `("%a" ,prof ,class ,file "%T") "<br />")))))
    (call-interactively 'org-html-export-to-html)))

(require 'cl-lib)
(define-key org-mode-map (kbd "C-x p")
  '(lambda () (interactive)
     (cl-loop for (class . prof) in Y/prof-alist
              if (string-match class (buffer-file-name))
              do (cl-return (Y/org-html-export-to-html prof class)))))

(defadvice org-export-dispatch (around ad-load-latex-init-file activate)
  "Load latex init file."
  (require 'init_latex)
  ad-do-it)

;; org this is for debugging.
(with-no-warnings
  (setq org-element-use-cache nil))

(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . default)
        ("\\.pdf\\'" . "evince %s"))
      org-support-shift-select t
      org-edit-src-content-indentation 0
      org-startup-truncated t
      org-return-follows-link t
      org-hide-leading-stars t
      ;; source code highlighting
      org-src-fontify-natively t
      org-directory "~/Dropbox/howm/org/"
      org-agenda-files (list org-directory)
      org-default-notes-file (concat org-directory "agenda.org")
      ;;* TODOリストの設定
      org-use-fast-todo-selection t
      org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)"
                  "APPT(a)")))

(defun my/org-dwim ()
  "My convinience function for `org-mode'."
  (interactive)
  (cond
   ((org-in-block-p '("src"))
    (org-edit-special))
   ((org-src-edit-buffer-p)
    (org-edit-src-exit))
   ((org-table-p)
    (org-table-edit-field 4))
   ((org-on-heading-p)
    (org-todo))
   ((org-at-item-checkbox-p)
    (org-toggle-checkbox))
   ((and org-return-follows-link
         (let ((tprop (get-text-property (point) 'face)))
           (or (eq tprop 'org-link)
               (and (listp tprop) (memq 'org-link tprop)))))
    (org-open-at-point))
   (t (org-insert-drawer))))

(defun my/org-capitalize-header-string ()
  "Capitalize header string."
  (if (org-on-heading-p)
      (progn
        (capitalize-region (point-at-bol) (point-at-eol))
        (newline-and-indent))
    (fill-region (point-at-bol) (point-at-eol))))

(add-hook 'org-mode-hook
          '(lambda ()
             (mykie:set-keys org-mode-map "C-a" "C-e" "RET" "C-j" "C-," "C-.")
             (auto-complete-mode t)))

(defun my/display-image (&optional bol eol)
  "Show inline image in `org-mode'.
The BOL means beginning of line, the EOL means end of line."
  (when (eq major-mode 'org-mode)
    (org-display-inline-images
     t t (or bol (point-at-bol)) (or eol (point-at-eol)))))

;; CSS format for export html
(require 'ox-html) ; for org-html-head
(let ((style-file (file-truename "~/.org-style.css")))
  (when (file-exists-p style-file)
    (setq org-html-head
          (concat "<link rel=\"stylesheet\" href=\"" style-file "\" />"))))

;; https://support.google.com/blogger/answer/41400?hl=en
;; work in progress
;; (let* ((origin (current-buffer))
;;        (file "~/share/doc/articles/memo/Blogger/emacs/org-mode-tip.html")
;;        (b (find-file-noselect file)))
;;   (switch-to-buffer b)
;;   (setq hoge (libxml-parse-html-region (point-min) (point-max) nil t))
;;   (switch-to-buffer origin))

(provide 'init_org)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_org.el ends here
