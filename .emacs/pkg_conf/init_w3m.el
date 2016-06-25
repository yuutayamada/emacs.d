;;; init_w3m.el --- init file for w3m.el

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

(eval-when-compile (require 'cl))

;;; w3m configuration
;; Hatena とか mixi にログイン出来るようにする(必須)
(defconst w3m-use-cookies t)
;; favicon のキャッシュを消さない
(defconst w3m-favicon-cache-expire-wait nil)
;;起動時に開くページ
(defconst w3m-home-page "http://www.google.com/")
;;ブックマークを保存するファイル
(defconst w3m-bookmark-file "~/.w3m/bookmark.html")
(defconst w3m-accept-languages '("ja" "en"))
(defconst w3m-language "Japanese")
(defconst w3m-search-default-engin "google-ja")

(require 'Y-autoload nil t)
(require 'w3m)
(require 'mykie)

;; Coding system configurations
(let ((coding 'utf-8))
  (setq w3m-default-coding-system coding
        w3m-coding-system coding
        w3m-output-coding-system coding
        w3m-terminal-coding-system coding
        w3m-file-coding-system coding
        w3m-file-name-coding-system coding
        w3m-default-coding-system coding))

(setq w3m-coding-system-priority-list (list 'utf-8 'shift_jis))

(defadvice w3m
    (around advice-name activate)
  ;; 23 = w -> w3m or www
  (win-switch-to-window 1 23)
  ad-do-it)

(defvar my/w3m-current-search-word "")

(defun my/w3m-search ()
  (interactive)
  (let ((google-url
         (concat "http://www.google.com/search?"
                 "ie=UTF-8"
                 "&hl=en"
                 "&inlang=en"
                 "&source=hp"
                 "&start=10"
                 "&tbo=1"     ; display detail
                 "&q="        ; query
                 )))
    (setq my/w3m-current-search-word
          (read-string "google: " my/w3m-current-search-word))
    (win-switch-to-window 1 23) ; w = 23
    (w3m-browse-url (concat google-url my/w3m-current-search-word))))

;; カーソル下にある画像を表示
;;(define-key w3m-mode-map "t" 'w3m-toggle-inline-image)

;;; ■■ dired
;;;   以下のように設定しておくと、dired-mode のバッファでファイルを選択して
;;;   いる状態で C-x m と入力すれば、該当ファイルが w3m で表示されるように
;;;   なる。
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "C-x m") 'dired-w3m-find-file)))

(defun dired-w3m-find-file ()
  (interactive)
  (require 'w3m)
  (let ((file (dired-get-filename)))
    (if (y-or-n-p (format "Open 'w3m' %s " (file-name-nondirectory file)))
        (w3m-find-file file))))

;;;*w3m自作関数
(defun my-w3m-search-forward ()
  "w3mのカーソル移動(forward)"
  (interactive)
  (if (my-url-check-on-google)
      (progn
        (if (re-search-forward "    [0-9][0-9]?\\. " nil t)
            (if (looking-at " ")
                (w3m-next-anchor))
          (if (looking-at "[0-9]\\|次へ\\|.+\\]\\| 検")
              (w3m-next-anchor)
            (re-search-forward " [0-9] " nil t))))
    (scroll-up)))

(defun my-url-check-on-google ()
  "urlがgoogleかどうかcheckする、偽ならnil"
  (string-match "http://www.google.*" w3m-current-url))

(defun my-w3m-search-backward ()
  "w3mのカーソル移動(backward)"
  (interactive)
  (if (my-url-check-on-google)
      (progn
        (unless (looking-at "次へ\\|Next")
          (goto-char (point-at-bol))
          (goto-char (1- (point))))
        (cond
         ((re-search-backward "Google 検" nil t) t)
         ((re-search-backward "次へ" nil t) t)
         ((re-search-backward "前へ" nil t) t)
         ((re-search-backward "10\\. " nil t) (forward-char 4))
         ((re-search-backward " 9\\. " nil t) (forward-char 4))
         ((re-search-backward " 8\\. " nil t) (forward-char 4))
         ((re-search-backward " 7\\. " nil t) (forward-char 4))
         ((re-search-backward " 6\\. " nil t) (forward-char 4))
         ((re-search-backward " 5\\. " nil t) (forward-char 4))
         ((re-search-backward " 4\\. " nil t) (forward-char 4))
         ((re-search-backward " 3\\. " nil t) (forward-char 4))
         ((re-search-backward " 2\\. " nil t) (forward-char 4))
         ((re-search-backward " 1\\. " nil t) (forward-char 4))))
    (scroll-down)))

(defun my-w3m-search-textarea ()
  "w3m,googleのテキストエリアの入力"
  (interactive)
  (goto-char (point-max))
  (re-search-backward "\\[.+\\] +?\n?検索" nil nil)
  (if (looking-at-p "\\[.+\\]")
      (w3m-view-this-url)))

(defun my-w3m-search-textarea-backward ()
  "w3mのテキストエリアの入力"
  (interactive)
  (re-search-backward "\\[[^現在地を入力.+\\]" nil nil))

(mykie:set-keys w3m-mode-map
  "h"    :default backward-char
  "j"    :default next-line
  "k"    :default previous-line
  "l"    :default forward-char
  "f"    :default w3m-scroll-up-or-next-url
  "b"    :default w3m-scroll-down-or-previous-url
  "a"    :default w3m-bookmark-add-current-url
  "B"    :default w3m-view-previous-page
  "c"    :default w3m-scroll-down-or-previous-url
  "d"    :default w3m-delete-buffer
  "F"    :default w3m-view-next-page
  "g"    :default w3m-toggle-inline-image
  "i"    :default w3m-tab-next-buffer
  ">"    :default w3m-tab-move-right
  "n"    :default my-w3m-search-forward
  "m"    :default w3m-next-anchor
  "o"    :default w3m-previous-anchor
  "p"    :default my-w3m-search-backward
  "r"    :default loga-lookup-in-buffer-light
  "s"    :default w3m-bookmark-view-new-session
  "t"    :default other-window-or-split
  "C-t"  :default other-window-or-split
  "u"    :default w3m-tab-previous-buffer
  "<"    :default w3m-tab-move-left
  "v"    :default w3m-scroll-up-or-next-url
  "x"    :default my-w3m-scroll-l
  "z"    :default my-w3m-scroll-r
  "RET"  :default w3m-view-this-url
  "SPC"  :default w3m-view-this-url-new-session
  "["    :default w3m-view-next-page
  "]"    :default w3m-view-previous-page
  ","    :default eiji:search
  "."    :default my-alc
  ";"    :default my/w3m-search
  ":"    :default w3m-view-this-url-new-session
  "+"    :default my-w3m-search-textarea-backward)

(setq w3m-minor-mode-map (copy-keymap w3m-mode-map))

(provide 'init_w3m)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_w3m.el ends here
