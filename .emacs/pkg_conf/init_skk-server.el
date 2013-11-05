
;; SKK Server and setup google-ime-skk configuration
;; it's Ruby gem: http://hitode909.hatenablog.com/entry/20110421/1303274561
(require 'skk-vars)
(require 'skk-server)
(require 'vars)

(defconst skk-server-host "0.0.0.0")
(defconst skk-server-prog (concat yy/branch "misc/go-skkserv/go-skkserv"))
(defconst skk-server-portnum 55200)
(setq skk-server-inhibit-startup-server nil)

;; TODO: Use SKKSERVER, SKKSERV variable.
(defun my/boot-skk-server ()
  "Start SKK server."
  (unless (skk-server-live-p)
    (async-shell-command skk-server-prog (get-buffer-create "*goskk*"))
    (setq skkserv-process (skk-open-server-1))
    (when (skk-server-live-p)
      (set-process-coding-system skkserv-process 'utf-8 'utf-8))))

(defun my/skk-close-server ()
  (interactive)
  (when (skk-server-live-p)
    (skk-disconnect-server)
    (kill-process (get-buffer-process "*goskk*"))
    (message "Server disconnected")))

(provide 'init_skk-server)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_skk-server.el ends here
