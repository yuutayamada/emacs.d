;;; init_popwin.el --- init file for popwin.el
;;; Commentary:
;;; Code:
(require 'init_windows) ; must load windows.el before loading popwin.el
(require 'popwin)

(setq popwin:popup-window-height 0.5
      popwin:popup-window-width 0.5)

(setq popwin:special-display-config
      (append
       `(("*Remember*" :stick t)
         ("*Org Agenda*")
         ("*helm gtags*" :position bottom :stick t)
         ("*helm-go*|godoc" :position right :stick t)
         ("*Go output*" :dedicated t :position right)
         ("*Backtrace*")

         ("*sdic*" :noselect t)
         (" *auto-async-byte-compile*" :position right)
         ("*Colors*")
         ("\*grep\*.*" :regexp t :stick t)
         ("*markdown-output*" :noselect)
         ("*Help*" :position right)
         ("*translated*" :position top :height 10)
         ("\*Man .+\*" :regexp t :position right)
         ;; ("\\\*e?shell\\\*" :position right :regexp t)
         ;; ("^\*helm.+\*$" :regexp t)
         ;; ("*quickrun*")
         (":home")
         ("*bpe*")
         ("*MozRepl*" :position bottom)
         ("*EIJIRO*" :position right)
         ("*ri(helm-rb)*")

         ;; Note:
         ;; `async shell command buffer' is not acceptable
         ;; when I use this buffer on popwin then this buffer is
         ;; closed immediately.
         )
       popwin:special-display-config))

(popwin-mode t)

(provide 'init_popwin)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_popwin.el ends here
