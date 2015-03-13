;;; init_org.el --- init file for org-mode
;;; Commentary:
;;; Code:

(require 'org)
(require 'init_org-mobile)

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

(add-hook 'org-mode-hook
          '(lambda ()
             (require 'mykie)
             ;; un bind needless keybinds
             (mykie:set-keys org-mode-map "C-a" "C-e" "RET" "C-j" "C-," "C-.")
             (auto-complete-mode t)
             ;; this is temporary function to produce a html file for my college homework
             (define-key org-mode-map (kbd "C-x p")
               '(lambda () (interactive)
                  (cl-loop for (class . prof) in Y/prof-alist
                           if (string-match class (buffer-file-name))
                           do (cl-return (Y/org-html-export-to-html prof class)))))))

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

(defun my/display-image (&optional bol eol)
  "Show inline image in `org-mode'.
The BOL means beginning of line, the EOL means end of line."
  (when (eq major-mode 'org-mode)
    (org-display-inline-images
     t t (or bol (point-at-bol)) (or eol (point-at-eol)))))

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
