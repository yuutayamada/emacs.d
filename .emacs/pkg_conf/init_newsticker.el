;;; -*- coding: utf-8; mode: emacs-lisp; -*-


(require 'Y-function)
(require 'newsticker)
(require 'init_w3m)

(setq newsticker-html-renderer 'w3m-region)

(set-face-attribute 'newsticker-treeview-selection-face nil
                    :background "tomato")

;; (setq newsticker-url-list
;;       (my/create-url-list :list
;;                           "~/bb/emacs.d/utils/Reader/subscriptions.xml"))


(provide 'init_newsticker)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_newsticker.el ends here
