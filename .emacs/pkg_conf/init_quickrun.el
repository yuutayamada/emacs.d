;;; init_quickrun.el --- init file for quickrun.el -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(require 'quickrun)

(defun my/quickrun-dwim (&optional direction)
  "Do quickrun.
You can specify 'ask and 'compile-only as symbol to DIRECTION."
  (interactive)
  (let ((base-buffer (current-buffer))
        (cmdkey (gethash (quickrun/find-from-major-mode-alist)
                         quickrun/command-key-table))
        (adjust-key (lambda (cmdkey)
                      (cl-case (intern cmdkey)
                        (lisp "lisp/clisp")
                        (t cmdkey))))
        (q-run (lambda (cmdkey &optional direction)
                 (let ((current-prefix-arg
                        (cl-case direction
                          (ask '(4))
                          (compile-only '(16))
                          (t nil)))
                       (quickrun-option-cmdkey cmdkey))
                   (call-interactively 'quickrun)))))
    (funcall q-run (funcall adjust-key cmdkey) direction)
    (unless (eq (current-buffer) base-buffer)
      (switch-to-buffer-other-window base-buffer))))

;; override Java
(quickrun-add-command
 "java"
 '((:compile-only . "javac -encoding utf-8 -source 1.7 -target 1.7 -Werror %o %s")
   (:exec         . ("javac -encoding utf-8 -source 1.7 -target 1.7 %o %s" "%c %N %a")))
 :override t)

(quickrun-add-command "nim"
                      '((:remove . ("%n" "nimcache/%S.c" "nimcache/%S.o")))
                      :override t)

;; (quickrun-add-command
;;  "clojure"
;;  '((:command . "clojure")
;;    (:exec         . ("javac -source 1.6 -target 1.6 %o %s" "%c %N %a"))
;;    (:compile-only . "javac -source 1.6 -target 1.6 -Werror %o %s")))

(provide 'init_quickrun)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_quickrun.el ends here
