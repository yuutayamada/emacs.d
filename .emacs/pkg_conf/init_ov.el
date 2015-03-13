;;; init_ov.el --- my ov.el configuration
;;; Commentary:
;;; Code:

(require 'ov)
(defvar-local Y/http-overlay nil)

(defun Y/ov-toggle-http-overlay ()
  "Overlay https?:// link."
  (interactive)
  (if (member (car Y/http-overlay) (ov-all))
      (Y/ov-turn-off-http-overlay)
    (Y/ov-turn-on-http-overlay)))

(defun Y/ov-turn-off-http-overlay ()
  "Turn off overlay."
  (interactive)
  (cl-loop for overlay in Y/http-overlay
           do (delete-overlay overlay)))

(defun Y/ov-turn-on-http-overlay ()
  "Turn on overlay."
  (interactive)
  ;; should I use this? : http://swatmac.info/?p=1064
  (setq-local Y/http-overlay (ov-regexp "https?://[-#./+\\&!?=_:%[:alnum:]]+"))
  (ov-set Y/http-overlay 'display "http://..." 'face 'link))

(defun Y/ov-http-overlay-at-point-p ()
  "Whether the point is overlay-ed or not."
  (interactive)
  (member (ov-at) Y/http-overlay))

(provide 'init_ov)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_ov.el ends here
