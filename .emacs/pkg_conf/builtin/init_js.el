;;; init_js.el --- init file for js-mode
;;; Commentary:
;;; Code:

;;;* JavaScript
(require 'js)
;; Replace JavaScript-mode -> js2-mode
(setf (cdr (rassoc 'javascript-mode auto-mode-alist)) 'js2-mode)

(defadvice js-mode (around preload-for-js-mode activate)
  "Load init file for JavaScript."
  (if (string-match "\\(\\.json\\|\\.org$\\|\\.gold\\)" buffer-file-truename)
      ad-do-it
    (js2-mode)))

(provide 'init_js)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_js.el ends here
