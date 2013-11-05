;;; init_yim.el --- init file for yim.el

;;; Commentary:

;;; Code:
(require 'my_autoload)

(defadvice skk-latin-mode-on (around ad-trash-un-kakutei-string activate)
  ad-do-it
  (my/trash-un-kakutei-string))

(defun my/trash-un-kakutei-string ()
  (skk-erase-prefix 'clean))

(defadvice yim-convert (around ad-boot-server activate)
  (if (skk-server-live-p)
      ad-do-it
    (my/boot-skk-server)))

(defadvice yim-convert (around yim-convert-ad activate)
  ad-do-it
  (skk-j-mode-on))

(provide 'init_yim)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_yim.el ends here
