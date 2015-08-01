;;; init_windows.el --- init file for windows.el -*- lexical-binding: t; -*-
;;; Commentary:
;; Prefix key + C-r -> select save, load, etc.
;;; Code:
;;;* windows.el configuration

;; Note that those variables should load before the `require windows' or
;; this configuration will fail.
(defconst win:switch-prefix (kbd "M-g"))
(defconst win:use-frame     nil)
(defconst win:base-key      (1- ?a))         ; starts from a of alphabet
(defconst win:max-configs   (+ (- ?z ?a) 2)) ; end at z of alphabet
(defconst win:quick-selection nil)
(defconst revive:ignore-buffer-pattern "^ \\*")

;; adjust variable of windows.el
(add-hook 'after-make-frame-functions
          '(lambda (frame)
             (select-frame frame)
             (defconst win:frames-in-nw (if (display-graphic-p) nil t))))

(require 'windows)
(require 'revive)
(require 'cl-lib)

;; init windows.el
(win:startup-with-window)

(defadvice win:adjust-window (around adjust-number-of-window activate)
  (if (not (and (daemonp) (eq 2 (length (frame-list)))
                (not (display-graphic-p))))
      ad-do-it
    ;; `save-buffer-kill-terminal' kills rest of
    ;; frames without daemon. So reset the configuration of killed frame.
    ;; and only terminal Emacs, occur problem which can not make new frame.
    (cl-loop for i from 2 to 26
             do (setf (aref win:configs i) nil))
    ad-do-it
    (setq win:current-config 1
          win:last-config 0)))

(defadvice win:set-window-configuration (around Y/make-pseudo-config activate)
  "Prevent config nil error."
  (unless (ad-get-arg 0)
    (ad-set-arg 0 (aref win:configs 1)))
  ad-do-it)

(require 'my_autoload)
(defadvice win-switch-to-window (around Y/win-switch-fixed-place activate)
  "Configure to move fixed place."
  (if (not (characterp last-input-event))
      ad-do-it
    (let* ((d default-directory)
           (key (char-to-string last-input-event))
           (keynum (string-to-char key))
           num)
      (when (string-match "^[a-z]$" key)
        ad-do-it
        (let ((c (char-to-string (+ win:current-config win:base-key))))
          (pcase c ; frame name of windows.el
            (`"e" (delete-other-windows) (call-interactively 'eww))
            ;; (`"d" (Y/lookup))
            ;; (`"s" (delete-other-windows) (magit-status d))
            ;; (`"j" (jazzradio))
            (`"l"
             (unless (string-match "lingr" (buffer-name))
               (apply
                (macroexpand
                 `(lingr-login ,@(Y/get-auth-info "lingr" :user :secret))))))
            (`"m" (delete-other-windows) (mew))
            ;; (`"o" (find-file "~/Dropbox/MobileOrg/todo.org"))
            ;; (`"t" (twit))
            ))))))

;; The merged keybinds precede left side argument than right side.
(setq goto-map (keymap--merge-bindings win:switch-map goto-map))
(global-set-key (kbd "M-g") goto-map) ; use M-g M-g


;;;###autoload
(defun Y/win-switch-window (char-a-to-z)
  (win:switch-window (1+ (- char-a-to-z ?a))))

(provide 'init_windows)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_windows.el ends here
