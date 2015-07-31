;;; init_google-translate-default-ui.el --- init file for google-translate-default-ui.el

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

;; Example(collected from twitter):
;; -- Japanese
;; まだ実験中なので、たぶん誤動作します
;; -- Spanish --
;; Que yo te eche de menos no significa que tu también lo hagas , tranquilo que lo sé.
;; -- Chinese
;; 微拍福利晴子格格

(require 'google-translate)

(setq google-translate-default-target-language "en"
      google-translate-default-source-language "en")

(defun Y/google-translate-remove-ascii (text &optional regex)
  "Remove ASCII characters from TEXT.
Also you can specify the REGEX instead of ASCII characters."
  (cl-loop with chars = (cl-loop for c in (string-to-list text)
                                 unless (eq ?_ (char-syntax c))
                                 collect c)
           for char in chars
           for s = (string char)
           unless (string-match (or regex (rx (category ascii))) s)
           collect s into char-list
           finally return (mapconcat 'identity char-list "")))

(defun Y/google-translate-get-source-lang (text)
  "Decide language by TEXT automatically."
  (let* ((txt (Y/google-translate-remove-ascii text))
         lang)
    (cond ((string-match (rx (category latin)) txt)
           "es")
          ((string-match (rx (category greek)) txt)
           "el")
          ((setq lang (Y/google-translate-japanese-or-chinese-p txt))
           lang)
          ((string-match (rx (category korean)) txt)
           "ko")
          (t google-translate-default-source-language))))

(defun Y/google-translate-japanese-or-chinese-p (text)
  "Return \"ja\" or \"zh-CN\" as string if the TEXT is Japanese or chinese."
  (let ((ja-hiragana-katakana
         (when (string-match (rx (or (category japanese-katakana)
                                     (category japanese-hiragana-two-byte)))
                             text)
           "ja"))
        (ja (when (string-match (rx (category japanese)) text)
              "ja"))
        (zh (when (string-match (rx (category chinese)) text)
              "zh-CN"))) ; or zh-TW?
    (or ja-hiragana-katakana zh ja)))

(defun Y/google-translate-get-target-lang (text source-language)
  "Use ja if the TEXT is selected by region.
Do not translate same SOURCE-LANGUAGE to target language."
  (if (and (region-active-p)
           (equal source-language google-translate-default-target-language))
      "ja"
    google-translate-default-target-language))

(defadvice google-translate-translate (around Y/override-lang-config activate)
  "Override language configuration."
  ;; order of arguments : source-lang, target-lang, text
  (let ((source-lang (Y/google-translate-get-source-lang (ad-get-arg 2))))
    (ad-set-arg 0 source-lang)
    (ad-set-arg 1 (Y/google-translate-get-target-lang (ad-get-arg 2) source-lang))
    ad-do-it))

(provide 'init_google-translate-default-ui)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_google-translate-default-ui.el ends here
