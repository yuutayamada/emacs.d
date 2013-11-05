;;;* for fold-dwim
(require 'fold-dwim)
(defvar my/fold-dwim-state nil)
(defadvice fold-dwim-show-hide
    (around my-fold-dwim-toggle-hide activate)
  (setq my/fold-dwim-state :hide)
  ad-do-it)

(defadvice fold-dwim-show-all
  (around my-fold-dwim-toggle-hide activate)
  (setq my/fold-dwim-state :show)
  ad-do-it)

(defun my/toggle-fold-dwim ()
  (case my/fold-dwim-state
    (:show (fold-dwim-show-hide))
    (:hide (fold-dwim-show-all))))

(provide 'init_fold_dwim)
