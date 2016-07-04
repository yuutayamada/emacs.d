;;; init_doc-view.el --- init file for doc-view.el

;;; Commentary:

;;; Code:

(require 'Y-autoload)

(el-get 'sync 'pdf-tools)

(defun Y/doc-view-maybe-pdf-tools (orig-fun &rest args)
  (if (not (member (file-name-extension (buffer-file-name))
                   '("pdf" "PDF")))
      (apply orig-fun args)
    (pdf-tools-install)
    (pdf-view-mode)
    (mykie:set-keys pdf-view-mode-map
      "g" pdf-view-goto-page)))

;; For lazy loading
(advice-add 'doc-view-mode-maybe :around 'Y/doc-view-maybe-pdf-tools)

(provide 'init_doc-view)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_doc-view.el ends here
