;;; init_idle-require.el --- init file for idle-require.el -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'idle-require)

;; Initial `idle-require' timer configuration.
(setq idle-require-idle-delay 3
      idle-require-load-break 0.3)

;; Do not load autoloads symbols
(advice-add 'idle-require-get-symbols :override '(lambda () nil))

(defun Y/idle-require-set-timer (delay break)
  "Set `idle-require' timer by DELAY time and BREAK time."
  (idle-require-mode 0)
  (setq idle-require-idle-delay delay
        idle-require-load-break break)
  (idle-require-mode 1))

(let ((delay-in  15)
      (break-in  3)
      (delay-out 1)
      (break-out 1))
  ;; Change idle-require's delay and break time.
  (add-hook 'after-make-frame-functions
            `(lambda (f)
               (when (< 1 (length (frame-list)))
                 (select-frame f)
                 (Y/idle-require-set-timer ,delay-in ,break-in))))
  (add-hook 'delete-frame-functions
            `(lambda (f)
               (run-with-timer 1 nil
                               #'(lambda ()
                                   (when (= 1 (length (frame-list)))
                                     (Y/idle-require-set-timer ,delay-out ,break-out))))))

  ;; New hooks `focus-in-hook', `focus-out-hook' of Emacs 24.4
  (when (version< "24.4" emacs-version)
    ;; only works on GUI Emacs???
    (add-hook 'focus-in-hook  `(lambda () (Y/idle-require-set-timer ,delay-in  ,break-in)))
    (add-hook 'focus-out-hook `(lambda () (Y/idle-require-set-timer ,delay-out ,break-out)))))

(provide 'init_idle-require)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_idle-require.el ends here
