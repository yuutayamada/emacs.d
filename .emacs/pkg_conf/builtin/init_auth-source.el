;;; init_auth-source.el ---                          -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'auth-source)

;;;###autoload
(defun Y/get-auth-info (machine &rest keywords)
  "Get auth info."
  (cl-loop with info = (car (auth-source-search :host machine :login :port))
           for kw in keywords
           for data = (plist-get info kw)
           if (functionp data)
           collect (funcall data)
           else collect data))

(provide 'init_auth-source)
;;; init_auth-source.el ends here
