;;; init_company-c-headers.el ---                    -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(require 'company-c-headers)

(require 'company-arduino)
;; User setting for company-arduino.el
;; (defun Y/company-c-headers-get-system-path ()
;; )
(setq company-c-headers-path-system
      (lambda ()
        "Return the system include path for the current buffer."
        (let ((default '("/usr/include/" "/usr/local/include/")))
          (company-arduino-append-include-dirs default t))))
;; Y/company-c-headers-get-system-path)

(provide 'init_company-c-headers)
;;; init_company-c-headers.el ends here
