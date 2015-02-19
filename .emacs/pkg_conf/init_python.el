;;; init_python-mode.el --- init file for python mode
;;; Commentary:

;;; Code:

(require 'python)
(setq python-indent-offset 4)

(defadvice python-shell-send-buffer (around ad-python-popwin activate)
  (popwin:popup-buffer
   (get-buffer-create "*Python*")
   :stick t :width (/ (frame-width) 2) :position :right)
  ad-do-it)

(require 'mykie)
(when (require 'jedi nil t)
  (mykie:set-keys python-mode-map
    "C-i" jedi:complete))

(provide 'init_python)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_python.el ends here
