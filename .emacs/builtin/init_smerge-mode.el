;;; init_smerge-mode.el --- init file for smerge-mode.el

;;; Commentary:

;;; Code:
(require 'my_autoload)

;;;###autoload
(defun Y/smerge-mode-keep-at-point ()
  "Treat merging at point by smerge way."
  (interactive)
  (let* ((face (plist-get (text-properties-at (point)) 'face))
         (func (cl-typecase face
                 (list   (cond ((memq 'smerge-mine face)
                                'smerge-keep-mine)
                               ((memq 'smerge-other face)
                                'smerge-keep-other)))
                 (symbol (cl-case face
                           (smerge-mine  'smerge-keep-mine)
                           (smerge-other 'smerge-keep-other))))))
    (when func (call-interactively func))))

(mykie:set-keys smerge-mode-map
  "RET" Y/smerge-mode-keep-at-point)

(provide 'init_smerge-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_smerge-mode.el ends here
