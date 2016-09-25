;;; init_pangu-spacing.el --- init file for pangu-spacing
;;; Commentary:
;;; Code:

;; Minor-mode to add space between Chinese and English characters.
;; https://github.com/coldnew/pangu-spacing
;; http://rubikitch.com/2015/02/04/pangu-spacing/

(el-get 'sync 'pangu-spacing)
(require 'pangu-spacing)

(setq pangu-spacing-chinese-before-english-regexp
      (rx (group-n 1 (category japanese))
          (group-n 2 (in "a-zA-Z"))))

(setq pangu-spacing-chinese-after-english-regexp
      (rx (group-n 1 (in "a-zA-Z"))
          (group-n 2 (category japanese))))

;; TODO : fix typo
(setq pangu-spacing-real-insert-separtor t)

(provide 'init_pangu-spacing)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_pangu-spacing.el ends here
