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

;; *** New coding-system `prefer-utf-8'.
;; This is like `undecided' but prefers UTF-8 on decoding if the text to
;; be decoded does not contain any invalid UTF-8 sequences.  On encoding,
;; any non-ASCII characters are automatically encoded as UTF-8.

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

(when (and
       (version= (format "%s" emacs-major-version) "24")
       (version= "3" (format "%s" emacs-minor-version)))
  ;; There is a bug of Emacs 24.3?
  ;; https://github.com/m2ym/popwin-el/issues/93
  (defconst popwin:close-popup-window-timer-interval 0.1)
  (defun my/BitesTheDust ()
    "Purge `popwin:close-popup-window-timer' if those were multiple"
    (cl-loop with new-timer-list = '()
             for vector in timer-list
             for count = 0 then count
             for pw-timer-p = (equal 'popwin:close-popup-window-timer (elt vector 5))
             if pw-timer-p
             do (setq count (1+ count))
             if (or (<= count 1) (not pw-timer-p))
             collect vector into new-timer-list
             finally (setq timer-list new-timer-list)))
  (add-hook 'popwin:after-popup-hook 'my/BitesTheDust)

  ;; This configuration was needed when I used Emacs's specific version
  ;; in the past.(I can't remember which version was it.
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
