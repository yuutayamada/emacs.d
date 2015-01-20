;;; init_jedi.el --- init file for jedi.el
;;; Commentary:
;; Python server (jediepcserver.py) installation
;; As of Jedi.el v0.2.0, jediepcserver.py installation is done by
;; running Emacs command jedi:install-server, i.e., typing M-x
;; jedi:install-server RET in Emacs. The same command can be used to
;; update Python packages used by Jedi.el. So, running this command
;; after updating Jedi.el each time is recommended.
;;; Code:

;; Standard Jedi.el setting
(require 'jedi)
(setq jedi:complete-on-dot t)


(provide 'init_jedi)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_jedi.el ends here
