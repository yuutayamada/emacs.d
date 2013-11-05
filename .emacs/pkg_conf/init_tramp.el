;;; package --- summary

;;; Commentary:

;;; Code:
;; http://qiita.com/catatsuy/items/f9fad90fa1352a4d3161
;; (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
;; User host name completion:
;; https://www.gnu.org/software/emacs/manual/html_node/tramp/Customizing-Completion.html

;; Default host
;; http://www.gnu.org/software/emacs/manual/html_node/tramp/Default-Host.html
;; Using auth file
;; http://www.gnu.org/software/tramp/#Using-an-authentication-file-1

(require 'tramp)

(add-to-list 'tramp-methods
             `("pi"
               (tramp-login-program "ssh")
               (tramp-default-port 22)
               (tramp-login-args
                (;; Login name
                 ("-l" "%u")
                 ;; Port
                 ("-p" "%p")
                 ;; ?
                 ("%c")
                 ;;
                 ("-F" ,(concat (getenv "XDG_CONFIG_HOME") "/ssh/config"))
                 ;; escape char
                 ("-e" "none")
                 ;; force pseudo tty
                 ("-t" "-t")
                 ("%h")
                 ;;
                 ("/bin/bash")))
               (tramp-async-args (("-q")))
               (tramp-remote-shell "/bin/bash")
               (tramp-remote-shell-args ("-c"))
               (tramp-gw-args (("-o" "GlobalKnownHostsFile=/dev/null")
                               ("-o" "UserKnownHostsFile=/dev/null")
                               ("-o" "StrictHostKeyChecking=no")))))

(tramp-set-completion-function
 "pi"
 `((tramp-parse-sconfig "/etc/ssh_config")
   (tramp-parse-sconfig ,(concat (getenv "XDG_CONFIG_HOME")  "/ssh/config"))))

(provide 'init_tramp)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_tramp.el ends here
