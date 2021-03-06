;;; Y-orgrc.el --- my org config -*- lexical-binding: t; -*-

;;; Commentary:

;;

;;; Code:
(require 'seqcmd)
(require 'org-loaddefs)
(require 'org)

;; Variables:

;; Footer information
(defconst org-html-postamble "")
;; Org-indent
(defconst org-startup-indented t)
(defconst org-indent-indentation-per-level 1)
(defconst org-indent-boundary-char ?\s) ; use space as boundary

(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . default)
        ("\\.pdf\\'" . "evince %s"))
      org-support-shift-select t
      org-edit-src-content-indentation 0
      org-use-speed-commands t
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
      ;; this is for debugging.
      ;; org-element-use-cache nil
      org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)"
                  "APPT(a)")))

;; Org key bindings
(require 'mykie)
;; un-bind needless keybinds
(mykie:set-keys org-mode-map "C-a" "C-e" "RET" "C-j" "C-," "C-.")

(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map (kbd "C-x p") 'Y/org-export-html-for-college)
             ;; Nim Blogger (work in progress)
             (with-no-warnings
               (load "~/local/vcs/github.com/yuutayamada/nim-blogger/misc/nimblogger")
               (setq nimblogger:blog-name "memo"
                     nimblogger:command "~/local/vcs/github.com/yuutayamada/nim-blogger/nimblogger")
               (define-key org-mode-map (kbd "C-S-p") 'nimblogger:post-article))))

;; latest org mode includes this
(when (require 'org-eldoc nil 'noerror)
  (add-hook 'org-mode-hook 'org-eldoc-load))

;; ;;;* org-trello
;; (add-hook 'org-mode-hook
;;           '(lambda ()
;;              (when (and buffer-file-name
;;                         (string-match
;;                          (expand-file-name "~/trello/") buffer-file-name))
;;                (org-trello-mode))))

(defun Y/org-export-html-for-college ()
  "This is temporary function to produce a html file for my college homework."
  (interactive)
  (cl-loop for (class . prof) in Y/prof-alist
           if (string-match class (buffer-file-name))
           do (cl-return (Y/org-html-export-to-html prof class))))

;; Functions
;; Modify header
(defun Y/org-html-export-to-html (professor class)
  "Add PROFESSOR name and CLASS to the html header.
 For my college life."
  (interactive)
  (let* ((prof (format "Professor %s" professor))
         (file (replace-regexp-in-string "_" " " (file-name-base))))
    (cl-letf ((org-html-preamble-format
               `(("en" ,(mapconcat 'identity `("%a" ,prof ,class ,file "%T") "<br />")))))
      (call-interactively 'org-html-export-to-html))))

(defun my/org-capitalize-header-string ()
  "Capitalize header string."
  (if (org-at-heading-p)
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

;;;###autoload
(defun my/org-dwim ()
  "My convinience function for `org-mode'."
  (interactive)
  (cond
   ((org-in-block-p '("src"))
    (org-edit-special))
   ((org-src-edit-buffer-p)
    (org-edit-src-exit))
   ((org-at-table-p)
    ;; (org-table-edit-field 4) ; check whether string is hidden or not
    (org-table-field-info nil))
   ((org-at-heading-p)
    (org-todo))
   ((org-at-item-checkbox-p)
    (org-toggle-checkbox))
   ((and org-return-follows-link
         (let ((tprop (get-text-property (point) 'face)))
           (or (eq tprop 'org-link)
               (and (listp tprop) (memq 'org-link tprop)))))
    (org-open-at-point))
   (t (org-insert-drawer))))

(provide 'Y-orgrc)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; Y-orgrc.el ends here
