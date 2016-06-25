;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;;; Code:

(require 'cl-lib)
(require 'ensime)

(setq ensime-auto-connect 'always)
(add-hook 'scala-mode-hook '(lambda ()
                              (when (locate-dominating-file default-directory ".ensime")
                                (ensime-scala-mode-hook))))

(defvar my/ensime-current-error-number 0
  "A number already searched error")

(defun my/ensime-goto-next-error ()
  (interactive)
  (when (equal major-mode 'scala-mode)
    (let*
        ((errors (ensime-all-notes))
         (convert-error-format
          (lambda (err)
            (cl-loop for i from 0 to (length err) by 2
                     for key = (nth i err)
                     for value = (nth (1+ i) err)
                     if (< i (1- (length err)))
                     collect (cons key value))))
         (converted-err-list
          (cl-loop for error in errors
                   for formatted-error = (funcall convert-error-format error)
                   if (equal buffer-file-name (assoc-default :file formatted-error))
                   collect formatted-error))
         (move
          (lambda (err-list)
            (let* ((err (nth my/ensime-current-error-number err-list))
                   (err-point (1+ (assoc-default :beg err))))
              (goto-char err-point)
              (popup-tip (assoc-default :msg err)
                         :point err-point))))
         (save-err-point
          (lambda ()
            (setq-local my/ensime-current-error-number
                        (if (equal my/ensime-current-error-number
                                   (1- (length converted-err-list)))
                            0
                          (1+ my/ensime-current-error-number))))))
      (when converted-err-list
        (funcall move converted-err-list)
        (funcall save-err-point)))))

(provide 'init_ensime)
