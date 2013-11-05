;;; -*- coding: utf-8; mode: emacs-lisp; -*-
(eval-when-compile (require 'cl))
(require 'my_autoload)
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)
(setq zencoding-indentation 2)

(defun my/insert-zencoding-from-minibuffer ()
  (interactive)
  (lexical-let* ((statement (read-from-minibuffer "zencoding: ")))
    (insert (replace-regexp-in-string
             "[\n ]" ""
             (zencoding-transform (car (zencoding-expr statement)))))))

(defun my/zencoding-expand ()
  "Execute zencoding if current point is in string and
you can execute from minibuffer if you push C-u before this command"
  (interactive)
  (lexical-let*
      ((quote "['\"]")
       (statement "")
       (correct-condition-p
        (lambda ()
          (and (flyspell-generic-progmode-verify)
               (case (face-at-point)
                 (font-lock-string-face t)
                 (font-lock-comment-face nil)
                 (font-lock-comment-delimiter-face nil)
                 (t nil)))))
       (move-start-point
        (lambda ()
          (if (funcall correct-condition-p)
              (while (and (funcall correct-condition-p)
                          (search-backward-regexp quote))))
          (forward-char 1)))
       (move-end-point
        (lambda ()
          (while (flyspell-generic-progmode-verify)
            (forward-char 1))
          (backward-char 2)))
       (set-statement
        (lambda ()
          (funcall move-start-point)
          (set-mark-command nil)
          (funcall move-end-point)
          (kill-region (region-beginning) (region-end))
          (setq statement (car kill-ring))))
       (do-zencoding-from-minibuffer
        (lambda ()
          (setq statement (read-from-minibuffer "zencoding: "))
          (insert (zencoding-transform (car (zencoding-expr statement))))))
       (flyspell-state (if flyspell-mode t nil)))
    (when (and (funcall correct-condition-p)
               (case major-mode
                 (js2-mode t)
                 (javascript-mode t)
                 (t nil)))
      (if current-prefix-arg
          (funcall do-zencoding-from-minibuffer)
        (when flyspell-state (turn-off-flyspell))
        (funcall move-start-point)
        (set-mark-command nil)
        (funcall move-end-point)
        (funcall set-statement)
        (insert (replace-regexp-in-string
                 "[\n ]" ""
                 (zencoding-transform (car (zencoding-expr statement)))))
        (when flyspell-state (turn-on-flyspell))))))

(provide 'init_zencoding)
