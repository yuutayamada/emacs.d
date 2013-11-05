;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(require 'picture)

(defun picture-line-draw-str (h v str)
  (cond ((/= h 0) (cond ((string= str "|") "+")
                        ((string= str "+") "+")
                        (t "-")))
        ((/= v 0) (cond ((string= str "-") "+")
                        ((string= str "+") "+")
                        (t "|")))
        (t str)))

(defun picture-line-delete-str (h v str)
  (cond ((/= h 0) (cond ((string= str "|") "|")
                        ((string= str "+") "|")
                        (t " ")))
        ((/= v 0) (cond ((string= str "-") "-")
                        ((string= str "+") "-")
                        (t " ")))
        (t str)))

(defun picture-line-draw (num v h del)
  (let ((indent-tabs-mode nil)
        (old-v picture-vertical-step)
        (old-h picture-horizontal-step))
    (setq picture-vertical-step v)
    (setq picture-horizontal-step h)
    ;; (setq picture-desired-column (current-column))
    (while (>= num 0)
      (when (= num 0)
        (setq picture-vertical-step 0)
        (setq picture-horizontal-step 0))
      (setq num (1- num))
      (let (str new-str)
        (setq str
              (if (eobp) " " (buffer-substring (point) (+ (point) 1))))
        (setq new-str
              (if del (picture-line-delete-str h v str)
                (picture-line-draw-str h v str)))
        (picture-clear-column (string-width str))
        (picture-update-desired-column nil)
        (picture-insert (string-to-char new-str) 1)))
    (setq picture-vertical-step old-v)
    (setq picture-horizontal-step old-h)))

(defun picture-region-move (start end num v h)
  (let ((indent-tabs-mode nil)
        (old-v picture-vertical-step)
        (old-h picture-horizontal-step) rect)
    (setq picture-vertical-step v)
    (setq picture-horizontal-step h)
    (setq picture-desired-column (current-column))
    (setq rect (extract-rectangle start end))
    (clear-rectangle start end)
    (goto-char start)
    (picture-update-desired-column t)
    (picture-insert ?\  num)
    (picture-insert-rectangle rect nil)
    (setq picture-vertical-step old-v)
    (setq picture-horizontal-step old-h)))

(defun picture-region-move-right (start end num)
  "Move a rectangle right."
  (interactive "r\np")
  (picture-region-move start end num 0 1))

(defun picture-region-move-left (start end num)
  "Move a rectangle left."
  (interactive "r\np")
  (picture-region-move start end num 0 -1))

(defun picture-region-move-up (start end num)
  "Move a rectangle up."
  (interactive "r\np")
  (picture-region-move start end num -1 0))

(defun picture-region-move-down (start end num)
  "Move a rectangle left."
  (interactive "r\np")
  (picture-region-move start end num 1 0))

(defun picture-line-draw-right (n)
  "Draw line right."
  (interactive "p")
  (picture-line-draw n 0 1 nil))

(defun picture-line-draw-left (n)
  "Draw line left."
  (interactive "p")
  (picture-line-draw n 0 -1 nil))

(defun picture-line-draw-up (n)
  "Draw line up."
  (interactive "p")
  (picture-line-draw n -1 0 nil))

(defun picture-line-draw-down (n)
  "Draw line down."
  (interactive "p")
  (picture-line-draw n 1 0 nil))

(defun picture-line-delete-right (n)
  "Delete line right."
  (interactive "p")
  (picture-line-draw n 0 1 t))

(defun picture-line-delete-left (n)
  "Delete line left."
  (interactive "p")
  (picture-line-draw n 0 -1 t))

(defun picture-line-delete-up (n)
  "Delete line up."
  (interactive "p")
  (picture-line-draw n -1 0 t))

(defun picture-line-delete-down (n)
  "Delete line down."
  (interactive "p")
  (picture-line-draw n 1 0 t))

;;; Picture-mode key-binds
(setq picture-mode-map
      (let ((map (copy-keymap picture-mode-map)))
        (define-key map (kbd "h") 'picture-line-draw-left)
        (define-key map (kbd "j") 'picture-line-draw-down)
        (define-key map (kbd "k") 'picture-line-draw-up)
        (define-key map (kbd "l") 'picture-line-draw-right)
        (define-key map (kbd "H") 'picture-line-delete-left)
        (define-key map (kbd "J") 'picture-line-delete-down)
        (define-key map (kbd "K") 'picture-line-delete-up)
        (define-key map (kbd "L") 'picture-line-delete-right)
        (define-key map [(control ?c) C-right] 'picture-region-move-right)
        (define-key map [(control ?c) C-left]  'picture-region-move-left)
        (define-key map [(control ?c) C-up]    'picture-region-move-up)
        (define-key map [(control ?c) C-down]  'picture-region-move-down)
        map))

(provide 'init_picture)
