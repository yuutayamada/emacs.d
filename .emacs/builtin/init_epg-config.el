;;; Code:

;; gpg
(require 'epg-config)
(setq epg-gpg-home-directory (getenv "GNUPGHOME")
      epg-gpg-program "gpg2")

(require 'epa)
(setq epa-pinentry-mode 'loopback)

(provide 'init_epg-config)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_epg-config.el ends here
