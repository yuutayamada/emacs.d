;;; init_xclip.el --- init file for xclip.el -*- lexical-binding: t; -*-
;;; Commentary:
;; http://emacswiki.org/emacs/CopyAndPaste
;;; Code:

;; Note that the names of original values are different on
;; Emacs version. (x-select-... gui-select-...)
;; (delete-selection-mode)

(defconst Y/original-cut-and-paste
  `(,interprogram-cut-function . ,interprogram-paste-function))

(defadvice turn-on-xclip (around Y/xclip-turn-on-use-my-func activate)
  (setq interprogram-cut-function   'Y/cut-func
        interprogram-paste-function 'Y/paste-func))

(defadvice turn-off-xclip (around Y/xclip-turn-off activate)
  (setq interprogram-cut-function   (car Y/original-cut-and-paste)
        interprogram-paste-function (cdr Y/original-cut-and-paste)))

(require 'xclip)

(defun Y/cut-func (text &optional push)
  (if (display-graphic-p)
      (funcall (car Y/original-cut-and-paste) text)
    (funcall 'xclip-select-text text push)))

(defun Y/paste-func ()
  (if (display-graphic-p)
      (funcall (cdr Y/original-cut-and-paste))
    (funcall 'xclip-selection-value)))

;; Copy and paste
(turn-on-xclip)

(provide 'init_xclip)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_xclip.el ends here
