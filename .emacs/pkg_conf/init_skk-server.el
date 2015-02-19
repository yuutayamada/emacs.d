;;; init_skk-server.el --- init file for skk-server.el
;;; Commentary:
;; Use local server which provides Google Japanese input via google
;; Japanese input API.
;; see also misc/go-skkserv
;;; Code:

;; SKK Server and setup google-ime-skk configuration
(require 'skk-vars)
(require 'skk-server)
(require 'my_paths)

;; Use environment variables
;; same as skk-server-host
(setenv "SKKSERVER" "0.0.0.0")
;; same as skk-server-prog
(setenv "SKKSERV" (concat yy/branch "misc/go-skkserv/go-skkserv"))
(defconst skk-server-portnum 55200)
(setq skk-server-inhibit-startup-server nil)

;; To use Google IME, use utf-8 encoding instead of euc.
(advice-add 'skk-open-server :after
            '(lambda () (set-process-coding-system skkserv-process 'utf-8 'utf-8)))

(provide 'init_skk-server)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_skk-server.el ends here
