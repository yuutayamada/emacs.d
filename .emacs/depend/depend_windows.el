;;; -*- coding: utf-8; mode: emacs-lisp; -*-
(require 'Y-function)

;; Windows 起動時設定画面
(if (string-match "mingw" system-configuration)
    (my-window-size-config 176 57 0 0))

;;;* font
;; default: "ＭＳ ゴシック-10"
(if (string-match "Yutapon coding" (font-family-list))
    (set-frame-font "ＭＳ ゴシック-10")
  (set-frame-font "Yutapon coding Bold-10"))

;; 警告音を消す*
(set-message-beep 'silent)

;;;* 背景半透明
;; (add-to-list 'default-frame-alist '(alpha . 85))

;;;* IMI toggle
;; (global-set-key (kbd "C-j")
;;                 (lambda () (interactive) (toggle-input-method)))

;;;* 画面の大きさ変える
(defvar my-window-change-char "max")
(global-set-key (kbd "C-\\")
                (lambda () (interactive)
                  (cond
                   ((equal my-window-change-char "max")
                    (my-window-size-config 176 55 0 0)
                    (split-window-horizontally)
                    (setq my-window-change-char "1/2")
                    t)
                   ((equal my-window-change-char "1/2")
                    (my-window-size-config 90 54 615 0)
                    (delete-other-windows)
                    (setq my-window-change-char "max")))))

;;;*i-searchで日本語入力がでるようにするパッチ
(unless (version<= "24.0.0" emacs-version)
  (defun w32-isearch-update ()
    (interactive)
    (isearch-update))
  (define-key isearch-mode-map [compend] 'w32-isearch-update)
  (define-key isearch-mode-map [kanji] 'isearch-toggle-input-method)
  (add-hook 'isearch-mode-hook
            (lambda () (setq w32-ime-composition-window (minibuffer-window))))
  (add-hook 'isearch-mode-end-hook
            (lambda () (setq w32-ime-composition-window nil))))

(provide 'depend_windows)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; depend_windows.el ends here
