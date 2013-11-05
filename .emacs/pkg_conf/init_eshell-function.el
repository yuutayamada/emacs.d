;;; init_eshell_function.el --- init file for eshell
;;; Commentary:

;;; Code:

(require 'em-hist)
(require 'em-prompt)

(defvar my/eshell-tmp-buffer nil)
(defun eshell-for-save-buffer (&optional not-new-buffer)
  (interactive)
  (let ((dir default-directory))
    (setq my/eshell-tmp-buffer (current-buffer))
    ;(eshell-prompt-initialize)
    (if not-new-buffer
        (eshell)
      (save-current-buffer
        (eshell 777)
        (cd dir)
        (eshell-interactive-print (concat "cd " dir "\n"))
        (eshell-emit-prompt)))))

(defun eshell-move-save-origin-buffer ()
  (if (version< "24.0.0" emacs-version)
      (switch-to-prev-buffer)
    (kill-this-buffer))
  (pop-to-buffer (get-buffer my/eshell-tmp-buffer)))

;;;*traverse history
(defun eshell-history-beginning-search-backward (arg)
  "arg で始まる履歴を検索して補完する．
zsh の history-beginning-search-backward にあたる機能．"
  (interactive "p")
  (if (equal eshell-history-index
          (1- (ring-length eshell-history-ring)))
      (progn
        (eshell-bol)
        (delete-region (point) (point-max)))
      (let ((cur (point)))
        (eshell-previous-matching-input-from-input arg)
        (delete-region (point) (point-max))
        (goto-char cur)
        (setq this-command
              'eshell-previous-matching-input-from-input))))

(defun eshell-history-beginning-search-forward (arg)
  "arg で始まる履歴を検索して補完する．
zsh の history-beginning-search-forward にあたる機能．"
  (interactive "p")
  (if (or (null eshell-history-index)
          (zerop eshell-history-index))
      (progn
        (eshell-bol)
        (delete-region (point) (point-max)))
      (let ((cur (point)))
        (eshell-next-matching-input-from-input arg)
        (delete-region (point) (point-max))
        (goto-char cur)
        (setq this-command
              'eshell-next-matching-input-from-input))))

(provide 'init_eshell-function)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_eshell-function.el ends here
