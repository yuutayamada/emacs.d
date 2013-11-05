;; key-chord configuration
(require 'key-chord)
(setq key-chord-two-keys-delay 0.03
      key-chord-one-key-delay  0.15)

(key-chord-mode t)

;; How to define
;; Example: execute function if push twice j promptly
;; (key-chord-define-global "jj"  'function-name)

(provide 'init_keychord)
