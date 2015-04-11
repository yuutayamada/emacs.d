;;; init_eshell.el --- init file for eshell
;;; Commentary:
;; http://www.masteringemacs.org/article/complete-guide-mastering-eshell
;; C-c M-d : toggle delayed input and normal input
;;; Code:

(require 'eshell)

;; Manual
;; http://www.gnu.org/software/emacs/manual/html_mono/eshell.html

(defconst eshell-highlight-prompt t)
(defconst eshell-cmpl-cycle-completions nil)
(defconst eshell-cmpl-cycle-cutoff-length 0)
(defconst eshell-save-history-on-exit t)

(advice-add 'eshell :after
            '(lambda ()
               (cd default-directory)
               (goto-char (point-max))
               (eshell-bol)
               (kill-line)
               (insert "\n")
               (eshell-send-input)
               (eshell-redisplay)))

;; em-term
;; Configure this to show git log correctly.
(defconst eshell-visual-subcommands '(("git" "log" "diff" "show")))
(defconst eshell-visual-options '(("git" "--help")))

(add-hook 'eshell-mode-hook
          '(lambda ()
             (add-to-list 'eshell-visual-commands "vim")
             (mykie:set-keys eshell-mode-map
               "C-a"   eshell-bol
               "C-s"   helm-shell-history
               "M-t"   eshell-toggle-direct-send
               "C-M-p" (lambda () (interactive) (scroll-up-line   10))
               "C-M-n" (lambda () (interactive) (scroll-down-line 10)))))

;;; ESHELL-BETTER-PROMPT
(require 'eshell-better-prompt)
;; %Y - Year %m - numeric month %d - day of month
;; %H - hour %M -minute
(setq eshell-better-prompt-time-format "%Y/%m/%d %H:%M")

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

(provide 'init_eshell)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_eshell.el ends here
