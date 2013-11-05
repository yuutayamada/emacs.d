
;; eiji.el configuration
(require 'eiji)

(setq
 eiji:search-path-eiji  "~/share/dict/EIJIRO/EIJI-135.txt"
 eiji:search-path-reiji "~/share/dict/EIJIRO/REIJI135.txt"
 eiji:search-path-ryaku "~/share/dict/EIJIRO/RYAKU135.txt"
 eiji:search-path-waei  "~/share/dict/EIJIRO/WAEI135.txt"
 ;; Display by popwin if specified buffer
 eiji:popwin-buffer-list '("*w3m*.+"))

(provide 'init_eiji)
