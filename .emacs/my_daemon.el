;;; my_daemon.el --- frame configuration  -*- lexical-binding: t; -*-
;;; Commentary:
;; Manipulate changing color, copying, pasting when Emacs creates
;; new frame (i.e., using emacsclient, editing git commit or etc.)

;; frame configuration variables memo:
;; `window-system-default-frame-alist' supersedes `default-frame-alist'
;; `initial-frame-alist' - first frame (can I use this for daemon frame?)
;; terminal-parameters? : https://www.gnu.org/software/emacs/manual/html_node/elisp/Terminal-Parameters.html

;;; Code:

(require 'my_util)
(require 'my_font)

;; You may need this config if you specified -Q option because
;; the option sets t to `inhibit-x-resources'.
;; Note that you shouldn't move this value to the another because
;; I failed to apply hiding menu bar when I set this in
;; `before-make-frame-hook'...
(setq inhibit-x-resources nil)

(add-hook 'after-make-frame-functions 'Y/frame-init-func)

;;;###autoload
(defun Y/frame-init-func (&optional frame)
  "Init function when Emacs connects new server with FRAME object."
  (let ((f (or frame (selected-frame))))
    (select-frame f)
    (if (< 2 (length (frame-list)))
        (Y/frame-set-window-config)
      (Y/init-fontset)
      (Y/apply-color-theme-by-display)
      ;; The second arg means "do not change face."
      (frame-set-background-mode f t))
    (Y/set-default-window-frame-alist f)))

(defun Y/frame-set-window-config ()
  "Set window configuration if the display graphic is the same type."
  (cl-loop for (fname _ wc) in (cdr (current-frame-configuration))
           if (and (not (eq (selected-frame) fname))
                   (eq (framep-on-display fname)
                       (framep-on-display (selected-frame))))
           do (cl-return (set-window-configuration wc))
           finally (Y/apply-color-theme-by-display)))

;;;###autoload
(defun Y/set-default-window-frame-alist (frame)
  "Set `window-system-default-frame-alist' of FRAME."
  (let ((ws (window-system frame)))
    (let* ((bg (frame-parameter frame 'background-color))
           (fg (frame-parameter frame 'foreground-color))
           (falist
            (append
             `((background-mode . ,(frame-terminal-default-bg-mode nil)))
             (when bg `((background-color . ,bg)))
             (when fg `((foreground-color . ,fg))))))
      (setq window-system-default-frame-alist `(,ws ,falist)))))

(provide 'my_daemon)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_daemon.el ends here
