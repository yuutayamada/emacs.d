;;; init_skk.el --- init file for SKK

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

;; 便利な応用機能
;; http://quruli.ivory.ne.jp/document/ddskk_14.2/skk_4.html

;; 必要なパッケージ
;; kakasi - 漢字をひらがなへ変換

;;; Code:
;;;*SKK
(require 'cl-lib)
(require 'skk-vars)
(require 'skk-macs)
(require 'skk-azik)

(setq ;; skk-byte-compile-init-file t
      skk-use-azik t
      skk-azik-keyboard-type 'jp106
      ;; 動的な補完を使う
      skk-dcomp-activate
      #'(lambda ()
          (and
           window-system ; -nw では動的補完をしない。
           (or (eolp)
               (looking-at "[ \t]+$"))))
      ;; 動的補完の候補をインラインに複数表示します
      ;; (32)SDS。XEmacs では動作しません
      skk-dcomp-multiple-activate t
      skk-use-kakasi t
      skk-auto-okuri-process t
      ;; 送り仮名が厳密に正しい候補を優先して表示する
      skk-henkan-strict-okuri-precedence t
      ;; 辞書登録のとき、余計な送り仮名を送らないようにする
      skk-check-okurigana-on-touroku 'auto
      ;; 単漢字検索のキーを!にする
      skk-tankan-search-key ?!
      ;; 変換候補一覧と注釈 (annotation) を GUI ぽく表示する
      skk-show-tooltip t
      ;;tooltipの色設定
      skk-tooltip-parameters '((background-color . "ForestGreen")
                               (border-color     . "royal blue"))
      ;; 変換候補をインラインに表示する
      skk-show-inline t
      ;; 変数 skk-treat-candidate-appearance-function を利用して自前で候補に
      ;; 色を付ける場合はこの変数を nil に設定する。
      skk-inline-show-face nil
      ;; 変換候補を縦型インラインに表示する
      skk-show-inline 'vertical
      ;; メッセージを日本語で通知する
      skk-japanese-message-and-error t
      ;; メニューを英語で表示する
      skk-show-japanese-menu t
      ;; 変換時に注釈 (annotation) を表示する
      skk-show-annotation t
      ;; Enter キーを押したときには確定する
      skk-egg-like-newline t
      ;; 対応する閉括弧を自動的に挿入する
      skk-auto-insert-paren t
      ;; 複数の Emacsen を起動して個人辞書を共有する
      skk-share-private-jisyo t
      ;; skkにて[辞書登録]時に候補を表示
      skk-read-from-minibuffer-function #'(lambda () skk-henkan-key)
      )

(setq skk-rom-kana-rule-list
      (append skk-rom-kana-rule-list
              '(;; For 104 keyboard & azic
                ("'" nil ("ー" . "ー"))
                (":" nil ("ッ" . "っ"))
                ;; かなモードの入力で (モード変更を行なわずに) 長音(ー)を
                ;; ASCII 数字の直後では `-' に、全角数字の直後では `?' にしたい。
                ("-" nil skk-hyphen)
                ;; かなモードの入力でモード変更を行わずに、数字入力中の
                ;; 小数点 (.) およびカンマ (,) 入力を実現する。
                ;; (例) かなモードのまま 1.23 や 1,234,567 などの記述を行える。
                ;; period
                ("." nil skk-period)
                ;; comma
                ("," nil skk-comma)
                )))

(defun skk-period (arg)
  (let ((c (char-before (point))))
    (cond ((null c) "。")
          ((and (<= ?0 c) (>= ?9 c)) ".")
          ((and (<= ?０ c) (>= ?９ c)) "．")
          (t "。"))))

(defun skk-comma (arg)
  (let ((c (char-before (point))))
    (cond ((null c) "、")
          ((and (<= ?0 c) (>= ?9 c)) ",")
          ((and (<= ?０ c) (>= ?９ c)) "，")
          (t "、"))))

(defun skk-hyphen (arg)
  ""
  (let ((c (char-before (point))))
    (cond ((null c) "ー")
          ((and (<= ?0 c) (>= ?9 c)) "-")
          ((and (<= ?０ c) (>= ?９ c)) "?")
          (t "ー"))))

(defconst skk-extra-jisyo-file-list
  ;; memo: how to convert from euc-jp to utf-8
  ;; iconv -f EUC-JP -t UTF-8 SKK-JISYO.L > SKK-JISYO.L.UTF-8
  (list '("~/share/dict/SKK-JISYO.L.UTF-8" . utf-8)))

(when skk-use-color-cursor
  (setq skk-cursor-hiragana-color "LimeGreen"
        skk-cursor-katakana-color "DodgerBlue"
        skk-cursor-abbrev-color "red"
        skk-cursor-jisx0208-latin-color "red"
        skk-cursor-jisx0201-color "purple"
        skk-cursor-latin-color "Yellow3"))

;; 自分で個別に設定するのでC-jの機能を別のキーに割り当て
(setq skk-kakutei-key          (kbd "C-c @ C-z"))
(define-key skk-j-mode-map     (kbd "C-j") nil)
(define-key skk-latin-mode-map (kbd "C-j") nil)
(define-key skk-latin-mode-map (kbd "C-x C-j") nil)

;; Do not use skk-setup.el
;; it override some global keys.(like C-x j key)
(require 'skk-autoloads)

(defadvice do-auto-fill
    (around ad-prevent-auto-fill activate)
  "Do not use auto-fill function in Japanese input mode.
Use DDSKK's auto fill instead."
  (when (or (bound-and-true-p skk-latin-mode)
            (null (bound-and-true-p skk-mode)))
    ad-do-it))

;; 文章系のバッファを開いた時には自動的に英数モード(「SKK」モード)に入る
(cl-dolist (hook '(find-file-hooks
                   mail-setup-hook
                   message-setup-hook
                   dired-mode-hook))
  (add-hook hook
            #'(lambda ()
                (cl-case major-mode
                  ;; ((magit-log-mode mew-summary-mode) nil)
                  (t (skk-latin-mode-on))))))

;; 10 分放置すると個人辞書が自動的に保存される設定
(defvar skk-auto-save-jisyo-interval 600)
(run-with-idle-timer skk-auto-save-jisyo-interval
                     skk-auto-save-jisyo-interval
                     'skk-save-jisyo)

;; SKK便利関数
(require 'init_skk-b)

;; ;; look コマンドを使った検索をする
;; (setq skk-use-look t)

;; (when skk-use-look
;;   ;; look が見つけた語を見出し語として検索する
;;   (setq skk-look-recursive-search t)
;;   ;; ispell を look と一緒に使うのはやめる
;;   (setq skk-look-use-ispell nil)
;;   ;; look に渡すコマンドラインオプションの設定。補完時と検索時それぞれに
;;   ;; ついて設定できる。
;;   ;; look で case を見るときは、それ専用の辞書を sort コマンドで作る必要
;;   ;; がある (look の引数 -d, -f は sort の引数 -d, -f と一致させておく必
;;   ;; 要がある)。
;;   ;; (*) 補完時には引数 -d を指定すると dcomp との併用時に問題あることが
;;   ;; 報告されているため、-d を指定しないことをお勧めします。
;;   (setq skk-look-completion-arguments "%s /usr/share/dict/words")
;;   (setq skk-look-conversion-arguments "-df %s /usr/share/dict/words")
;;   ;; `skk-abbrev-mode' で skk-look を使った検索をしたときに確定情報を
;;   ;; 個人辞書に記録しないようにする
;;   (add-hook 'skk-search-excluding-word-pattern-function
;;             ;; KAKUTEI-WORD を引数にしてコールされるので、不要でも引数を取る
;;             ;; 必要あり
;;             #'(lambda (kakutei-word)
;;                 (and skk-abbrev-mode
;;                      (save-match-data
;;                        ;; `skk-henkan-key' が "*" で終わるとき、または
;;                        ;; `skk-henkan-key' が数字のみのとき
;;                        (or (string-match "\\*$" skk-henkan-key)
;;                            (string-match "^[0-9]*$" skk-henkan-key)))))))

(provide 'init_skk)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_skk.el ends here
