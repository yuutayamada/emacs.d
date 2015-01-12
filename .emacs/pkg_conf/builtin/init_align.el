

;;; Commentary:
;;; Code:

(require 'align)

;; オプションの詳しい説明については、
;; f| v align-rules-list

;; @を基準にしてalignする。

(add-to-list 'align-rules-list
             '(atmark-assignment
               (regexp . "\\( *\\)@")    ; 基準を定義する正規表現
               (modes  . '(text-mode)))) ; ルールを適用するモード

;; \\(\\s-*\\)をregexpの末尾においておくことによって、パターンの後ろにあるスペースを調整してalignすることができる。

(add-to-list 'align-rules-list
             '(yaml-assignment
               (regexp . ":\\(\\s-*\\)") ; 末尾に \\(\\s-*\\)
               (modes  . '(yaml-mode))))

;; 例: 1行に複数回ルールを適用する

;; repeatにnon-nilを指定すると、1行に複数回ルールを適用できる。

(add-to-list 'align-rules-list
             '(camma-assignment
               (regexp . ",\\( *\\)")
               (repeat . t)              ; 複数回適用を有効に
               (modes  . '(perl-mode))))

;; tab-stopにnon-nilを指定すると、tab-widthの整数倍の位置にそろえられる。

(add-to-list 'align-rules-list
             '(tab-stop-assignment
               (regexp   . "\\(\\s-+\\)")
               (tab-stop . t)              ; タブ位置でそろえる
               (modes    . '(text-mode))))


;; columnに列数を指定しておくと、その列でそろえられる。

(add-to-list 'align-rules-list
             '(column-assignment
               (regexp . "\\(\\s-+\\)")
               (column . 10)            ; そろえる列数
               (modes . '(text-mode))))
(add-to-list 'align-rules-list
             '(custom-separete-assignment
               (regexp . ",\\(\\s-*\\)")
               (separate . "\\(===\\)")  ; 段落の切れ目
               (modes . '(text-mode))))

(provide 'init_align)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_align.el ends here
