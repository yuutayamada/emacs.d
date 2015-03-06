;;; my_font.el --- init file for font set

;;; Commentary:
;; If you have problem char-width against ambiguous characters like §
;; try this : (use-cjk-char-width-table 'ja_JP)
;; And you can check by : (char-width (string-to-char "§"))

;; Useful info:
;;   http://www.emacswiki.org/emacs/FontSets
;;   http://csbruce.com/software/utf-8.html
;;   http://macemacsjp.sourceforge.jp/matsuan/FontSettingJp.html

;; - How to examine character of the point -> use 'C-u C-x =' or `describe-char'
;; - XLFD (X Logical Font Description)
;;     -maker-family-weight-slant-widthtype-style...->
;;      ->...-pixels-height-horiz-vert-spacing-width-registry-encoding

;;; Code:

(require 'cl-lib)

(defun my/parse-xlfd-font-style (str)
  "Parse XLFD (X Logical Font Description) font style from STR."
  (cl-loop with index = '(:maker :family :weight :slant :widthtype :style
                                 :pixels :height :horiz :vert :spacing :width
                                 :registry :encoding)
           with attributes = (split-string str "-")
           for i from 0 upto (1- (length attributes))
           collect (cons (nth i index) (nth i attributes))))

(defun my/define-jp-font (jp_font ratio)
  "Work in progress."
  (set-fontset-font "fontset-default" 'japanese-jisx0208
                    `(,jp_font . "jisx0208.*"))

  (set-fontset-font "fontset-default" 'katakana-jisx0201
                    `(,jp_font . "jisx0201.*"))
  (add-to-list 'face-font-rescale-alist
               `(,(encode-coding-string jp_font 'emacs-mule) . ,ratio)))

(defun my/change-font-partially (spec char_from &optional char_to)
  "Change font partially.
The SPEC is `font-spec', CHAR_FROM and CHAR_TO are range of char."
  (set-fontset-font "fontset-default"
                    (cons (string-to-char char_from)
                          (string-to-char (or char_to char_from)))
                    (cl-typecase spec
                      (list (apply 'font-spec spec))
                      (string spec)
                      (cons   spec)
                      (nil    nil))))

(defun Y/adjust-font ()
  "Font configuration."
  (when (and ;; (display-graphic-p (selected-frame))
         (not (equal "fontset-default"
                     (assoc-default 'font default-frame-alist))))
    (my/change-font-partially `(:family "Anonymous Pro") "λ")))

(provide 'my_font)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_font.el ends here
