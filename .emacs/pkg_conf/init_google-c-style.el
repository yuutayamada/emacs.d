;;; init_google-c-style.el ---                       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(require 'google-c-style)

;;;###autoload
(add-hook 'c-mode-common-hook 'google-set-c-style)

(provide 'init_google-c-style)
;;; init_google-c-style.el ends here
