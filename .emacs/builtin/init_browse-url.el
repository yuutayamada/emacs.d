;;; init_browse-url.el --- init file for browse-url.el
;;; Commentary:
;;; Code:
;; See

(require 'browse-url)

;; http://askubuntu.com/questions/590265/clicking-link-in-emacs-no-longer-opens-page-in-browser
(defadvice browse-url-firefox (around Y/fix-remote-option activate)
  "Apply firefox version 36 which was removed --remote option."
  ;; assign nil to use-remote of `browse-url-firefox'
  (let ((system-type 'windows-nt))
    ad-do-it))
(advice-add 'browse-url-mozilla :override 'browse-url-firefox)

(provide 'init_browse-url)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_browse-url.el ends here
