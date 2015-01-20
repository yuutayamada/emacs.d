;;; init_windows.el --- init file for windows.el -*- lexical-binding: t; -*-
;;; Commentary:
;; Prefix key + C-r -> select save, load, etc.
;;; Code:
;;;* windows.el configuration

;; Note that those variables should load before the `require windows' or
;; this configuration will fail.
(defconst win:switch-prefix (kbd "M-g")) ; fake prefix
(defconst win:use-frame     nil)
(defconst win:base-key      (- (string-to-char "a") 1))
(defconst win:max-configs   27)
(defconst win:quick-selection nil)
(defconst revive:ignore-buffer-pattern "^ \\*")

(require 'windows)
(require 'revive)

;; For emacsclient
(add-hook 'after-make-frame-functions
          '(lambda (frame) (win:startup-with-window)))

;; For normal Emacs
(when (and (not (daemonp))
           (zerop win:current-config)
           (= (length (frame-list)) 1))
  (win:startup-with-window))

(require 'my_autoload)
(defadvice win-switch-to-window (around Y/win-switch-fixed-place activate)
  "Configure to move fixed place."
  (let* ((d default-directory)
         (key (char-to-string last-input-event))
         (keynum (string-to-char key))
         num)
    (when (string-match "^[a-z]$" key)
      (setq num (- keynum win:base-key))
      (when (null (elt win:configs num))
        (setf (elt win:configs num) (or (elt win:configs 0)
                                        (elt win:configs 1)))))
    ad-do-it
    (let ((c (char-to-string (+ win:current-config win:base-key))))
      (pcase c ; frame name of windows.el
        (`"d" (Y/lookup))
        (`"s" (magit-status d) (delete-other-windows))
        (`"j" (jazzradio))
        (`"l"
         (unless (string-match "lingr" (buffer-name))
           (apply
            (macroexpand
             `(lingr-login ,@(Y/get-auth-info "lingr" :user :secret))))))
        (`"m" (delete-other-windows) (mew))
        (`"o" (find-file "~/Dropbox/MobileOrg/todo.org"))
        (`"t" (my/twit t))))))

;; The merged keybinds precede left side argument than right side.
(setq goto-map (keymap--merge-bindings win:switch-map goto-map))
(global-set-key (kbd "M-g") goto-map)

(provide 'init_windows)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_windows.el ends here
