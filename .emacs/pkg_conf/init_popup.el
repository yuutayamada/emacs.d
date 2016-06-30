;;; init_popup.el ---                                -*- lexical-binding: t; -*-

;;; Commentary:

;;

;;; Code:

(require 'popup)

;;;###autoload
(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  "See http://www.emacswiki.org/emacs/Yasnippet."
  (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t))


(provide 'init_popup)
;;; init_popup.el ends here
