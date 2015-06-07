;;; init_info.el ---                                 -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(require 'info)
;; for libc info
(add-to-list 'Info-directory-list (format "%s/emacs/info/" (getenv "XDG_CACHE_HOME")))

(provide 'init_info)
;;; init_info.el ends here
