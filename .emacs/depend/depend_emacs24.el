;;; depend_emacs24.el --- init file for Emacs 24

;;; Commentary:
;;; MEMO
;; Scrolling without modifying cursor position
;; scroll-up-line, scroll-down-line
;;; Code:

(require 'my_util)
(when (version< emacs-version "24.4")
  (autoloader-autoloads
   ("cua-base" cua-set-rectangle-mark cua-rectangle cua-cut-rectangle)))

(unless (facep 'modeline)
  (copy-face 'mode-line 'modeline))

;;; electric-pair-mode:
;; insert another pair char when pushed () "" etc..
(electric-pair-mode t)

;; http://d.hatena.ne.jp/a_bicky/20131221/1387623058
(defadvice electric-pair-post-self-insert-function
    (around prevent-electri-pair-if-string-or-comment-face activate)
  "Don't insert the closing pair in comments or strings."
  (unless (nth 8 (save-excursion (syntax-ppss (max 0 (1- (point))))))
    ad-do-it))

;; This configuration was needed when I used Emacs's specific version
;; in the past.(I can't remember which version was it.
(when (version< emacs-version "24.3.0")
  (defvar cl-custom-print-functions nil
    "This is a list of functions that format user objects for printing.
Each function is called in turn with three arguments: the object, the
stream, and the print level (currently ignored).  If it is able to
print the object it returns true; otherwise it returns nil and the
printer proceeds to the next function on the list.

This variable is not used at present, but it is defined in hopes that
a future Emacs interpreter will be able to use it."))

(provide 'depend_emacs24)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; depend_emacs24.el ends here
