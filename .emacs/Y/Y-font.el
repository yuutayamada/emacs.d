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

;; Find fonts : (font-family-list)
;; Rescale

;; Font memo:
;; mathematical fonts: stix, symbola
;; install : ttf-ancient-fonts-symbola, fonts-stix

;; example: use big font
;; (set-fontset-font "fontset-default" nil (font-spec :size 15 :name "Symbola"))

;;; Code:
(require 'cl-lib)

;; see also : http://www.hep.by/gnu/emacs/Fontsets.html
(defun Y/init-fontset ()
  "Set default(fallback) font."
  (condition-case err
      (cl-loop with fs = '("STIX" "STIX Math" "STIXGeneral" "Symbola"
                           "DejaVu Sans Mono")
               for font in fs
               if (member font (font-family-list))
               ;; Note that Symbola override Japanese "の" if you use prepend
               do (set-fontset-font t 'unicode font nil 'append))
    (error (message (format "Y/init-fontset: %s" err)))))

(defun my/parse-xlfd-font-style (str)
  "Parse XLFD (X Logical Font Description) font style from STR."
  (cl-loop with index = '(:maker :family :weight :slant :widthtype :style
                                 :pixels :height :horiz :vert :spacing :width
                                 :registry :encoding)
           with attributes = (split-string str "-")
           for i from 0 upto (1- (length attributes))
           collect (cons (nth i index) (nth i attributes))))

(provide 'my_font)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_font.el ends here
