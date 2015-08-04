;;; init_crontab-mode.el ---                              -*- lexical-binding: t; -*-

;;; Commentary:
;;
;;; Code:
(require 'crontab-mode)

;;;###autoload
(add-to-list 'auto-mode-alist
             (cons "\\(\\.cron\\(tab\\)?\\|cron\\(tab\\)?\\.?\\)\\'"
                   'crontab-mode))

(provide 'init_crontab-mode)
;;; init_crontab-mode.el ends here
