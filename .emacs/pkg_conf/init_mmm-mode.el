;;; -*- coding: utf-8; mode: emacs-lisp; indent-tabs-mode: nil -*-

;;; init_mmm.el --- mmm-mode setting

;; Copyright (C) 2004-2011 sakito

;; Author: sakito <sakito@sakito.com>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary: mmm-mode の設定

;;

;;; Code:

;;; mmm-mode
;; @see http://mmm-mode.sourceforge.net/
;; @see https://github.com/dgutov/mmm-mode
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)

(eval-after-load "mmm-vars"
  `(progn
     (mmm-add-group
      'html-js
      '((js-script-cdata
         :submode js2-mode
         :face mmm-code-submode-face
         :front "<script[^>]*>[ \t\n]*\\(//\\)?<!\\[CDATA\\[[ \t]*\n?"
         :back "[ \t]*\\(//\\)?]]>[ \t\n]*</script>")
        (js-script
         :submode js2-mode
         :face mmm-code-submode-face
         :front "<script[^>]*>[ \t]*\n?"
         :back "[ \t]*</script>$"
         :insert ((?j js-tag nil @ "<script type=\"text/javascript\">\n"
                      @ "" _ "" @ "\n</script>" @)))
        (js-inline
         :submode js2-mode
         :face mmm-code-submode-face
         :delimiter-mode nil
         :front "\\bon\\w+=\""
         :back "\"")))     

     (mmm-add-group
      'html-css
      '((css-cdata
         :submode css-mode
         :face mmm-code-submode-face
         :front "<style[^>]*>[ \t\n]*\\(//\\)?<!\\[CDATA\\[[ \t]*\n?"
         :back "[ \t]*\\(//\\)?]]>[ \t\n]*</style>")
        (css
         :submode css-mode
         :face mmm-code-submode-face
         :front "<style[^>]*>[ \t]*\n?"
         :back "[ \t]*</style>"
         :insert ((?c css-tag nil @ "<style type=\"text/css\">\n"
                      @ "" _ "" @ "\n</style>" @)))))

     (mmm-add-group
      'html-php
      '((html-php-output
         :submode php-mode
         :face mmm-output-submode-face
         :front "<\\?php *echo "
         :back "\\?>"
         :include-front t
         :front-offset 5
         :insert ((?e php-echo nil @ "<?php" @ " echo " _ " " @ "?>" @))
         )
        (html-php-code
         :submode php-mode
         :face mmm-code-submode-face
         :front "<\\?\\(php\\)?"
         :back "\\?>"
         :insert ((?p php-section nil @ "<?php" @ " " _ " " @ "?>" @)
                  (?b php-block nil @ "<?php" @ "\n" _ "\n" @ "?>" @)))))

     (mmm-add-group
      'html-jsp
      '((jsp-comment
         :submode text-mode
         :face mmm-comment-submode-face
         :front "<%--"
         :back "--%>"
         :insert ((?- jsp-comment nil @ "<%--" @ " " _ " " @ "--%>" @))
         )
        (jsp-code
         :submode java-mode
         :match-face (("<%!" . mmm-declaration-submode-face)
                      ("<%=" . mmm-output-submode-face)
                      ("<%"  . mmm-code-submode-face))
         :front "<%[!=]?"
         :back "%>"
         :match-name "jsp"
         :insert ((?% jsp-code nil @ "<%" @ " " _ " " @ "%>" @)
                  (?! jsp-declaration nil @ "<%!" @ " " _ " " @ "%>" @)
                  (?= jsp-expression nil @ "<%=" @ " " _ " " @ "%>" @))
         )
        (jsp-directive
         :submode text-mode
         :face mmm-special-submode-face
         :front "<%@"
         :back "%>"
         :insert ((?@ jsp-directive nil @ "<%@" @ " " _ " " @ "%>" @)))))

     (dolist (mode (list 'html-mode 'nxml-mode))
       (mmm-add-mode-ext-class mode "\\.html?$" 'html-js)
       (mmm-add-mode-ext-class mode "\\.html?$" 'html-css)
       (mmm-add-mode-ext-class mode "\\.html?$" 'html-php)
       (mmm-add-mode-ext-class mode "\\.php?\\'" 'html-php)
       (mmm-add-mode-ext-class mode "\\.jsp?\\'" 'html-jsp)
       (set-face-attribute 'mmm-default-submode-face nil
                           :background "#111111")
       (set-face-attribute 'mmm-code-submode-face nil
                           :background "#111111")
       (set-face-attribute 'mmm-output-submode-face nil
                           :background "#121212"))))

;;;(define-key html-mode-map (kbd "C-c C-c") 'browse-url-of-file)

(provide 'init_mmm-mode)
