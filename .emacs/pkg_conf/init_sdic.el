;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;;;*sdicの設定
;;popupのキー C-cp
(require 'sdic nil t)
(require 'popup nil t)
(require 'init_sdic-inline)

(setq sdic-waei-dictionary-list
      '((sdicf-client "~/Dropbox/dict/jedict.sdic"
                      (add-keys-to-headword t)))
      sdic-eiwa-dictionary-list
      '((sdicf-client "~/Dropbox/dict/gene.sdic")
        )
      ;;sdic-default-coding-system 'utf-8
      )

(defadvice skk-tooltip-show-1 (around
			       skk-tooltip-show-by-popup-tip
			       first
			       (text skk-params)
			       activate)
  "Docstring."
  (popup-tip text))

; http://d.hatena.ne.jp/supermassiveblackhole/20100708/1278553763

(defun temp-cancel-read-only (function &optional jaspace-off)
  "eval temporarily cancel buffer-read-only 
&optional t is turn of jaspace-mode"

  (let ((read-only-p nil)
        (jaspace-mode-p nil))
    (when (and jaspace-off jaspace-mode)
      (jaspace-mode)
      (setq jaspace-mode-p t))
    (when buffer-read-only
      (toggle-read-only)
      (setq read-only-p t))
    (eval function)
    (when read-only-p
      (toggle-read-only))
    (when jaspace-mode-p
      (jaspace-mode))))

(defun my-sdic-describe-word-with-popup (word &optional search-function)
  "Display the meaning of word."
  (interactive
   (let ((f (if current-prefix-arg (sdic-select-search-function)))
         (w (sdic-read-from-minibuffer)))
     (list w f)))
  (let ((old-buf (current-buffer))
        (dict-data))
    (set-buffer (get-buffer-create sdic-buffer-name))
    (or (string= mode-name sdic-mode-name) (sdic-mode))
    (erase-buffer)
    (let ((case-fold-search t)
          (sdic-buffer-start-point (point-min)))
      (if (prog1 (funcall (or search-function
                              (if (string-match "\\cj" word)
                                  'sdic-search-waei-dictionary
                                'sdic-search-eiwa-dictionary))
                          word)
            (set-buffer-modified-p nil)
            (setq dict-data (buffer-string))
            (set-buffer old-buf))
          (temp-cancel-read-only
           '(popup-tip dict-data :scroll-bar t :truncate nil))
        (message "Can't find word, \"%s\"." word)))))



(defadvice sdic-describe-word-at-point (around sdic-popup-advice activate)
  (letf (((symbol-function 'sdic-describe-word) (symbol-function 'my-sdic-describe-word-with-popup)))
    ad-do-it))

(global-set-key (kbd "C-\\") 'sdic-describe-word-at-point)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

;;;*sdic
;; (setq load-path (nconc load-path (list (concat "/usr/share/"
;;                                                (symbol-name flavor)
;;                                                "/site-lisp/sdic"))))

(autoload 'sdic-describe-word
  "sdic" "英単語の意味を調べる" t nil)
(autoload 'sdic-describe-word-at-point
  "sdic" "カーソルの位置の英単語の意味を調べる" t nil)
(setq sdic-eiwa-dictionary-list nil
      sdic-waei-dictionary-list nil)

;;sdic-edict
(cond ((file-exists-p "/usr/share/dict/edict.sdic")
       (setq sdic-eiwa-dictionary-list
	     (cons
	      '(sdicf-client "/usr/share/dict/edict.sdic")
	      sdic-eiwa-dictionary-list))))
(cond ((file-exists-p "/usr/share/dict/jedict.sdic")
       (setq sdic-waei-dictionary-list
	     (cons
	      '(sdicf-client "/usr/share/dict/jedict.sdic" (add-keys-to-headword t))
	      sdic-waei-dictionary-list))))

;;sdic-gene95
(cond ((file-exists-p "/usr/share/dict/gene.sdic")
       (setq sdic-eiwa-dictionary-list
	     (cons
	      '(sdicf-client "/usr/share/dict/gene.sdic")
	      sdic-eiwa-dictionary-list))))

;;edict-el
(setq load-path (cons (concat "/usr/share/"
                              (symbol-name flavor)
			      "/site-lisp/edict-el") load-path))

(autoload 'edict-search-english "edict" "Search an English word" t)
(autoload 'edict-search-kanji "edict" "Search for a Japanese word or compound" t)
(setq edict-dictionaries
      '(("/usr/share/edict/edict" . euc-jp)))

(provide 'init_sdic)
