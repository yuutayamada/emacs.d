
;;;* milkboy
(require 'milkboy)
(require 'ruby-mode)
(global-set-key (kbd "C-0") 'anything/milkboy-search-code)
(define-key ruby-mode-map (kbd "C-c C-v") 'anything/milkboy-search-code)

