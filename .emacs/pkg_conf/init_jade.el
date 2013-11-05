(require 'sws-mode)
(require 'jade-mode)

(define-key jade-mode-map (kbd "<f5>")
  ;; compile to HTML
  '(lambda ()
     (interactive)
     (shell-command (concat "jade --pretty " buffer-file-truename))))

(provide 'init_jade)
