;; (define-minor-mode my-overriding-mode
;;   "Overriding"
;;   :global t :init-value t)
;; ;; * Absolute key-binds that other mode can't override map.
;; (defvar my/global-mode-map (make-sparse-keymap))
;; (my/set-keybinds [134217787] (global-key-binding (kbd "C-;"))
;;                  [67108910]  (global-key-binding (kbd "C-\.")))
;; (easy-mmode-define-minor-mode my-global-mode "Grab keys" t "" my-global-mode-map)


;; (setq email (auth-source-user-or-password "login" "gmail.com" nil)
;;       passwd (auth-source-user-or-password
;;               "password" user-mail-address nil))

;; (defun my/setup-keybinds (keybind-and-function-alist &optional keymap)
;;   "Define keys from alist"
;;   (loop for (keybind function) in keybind-and-function-alist
;;         for key =  (if (vectorp keybind)
;;                        keybind
;;                      (kbd keybind))
;;         for func = (or function nil)
;;         if keymap
;;         do   (define-key keymap key func)
;;         else do (global-set-key key func)))

;; (setq gnus-check-new-newsgroups 'ask-server
;;       gnus-read-active-file 'some
;;       gnus-nov-is-evil nil)
;; (add-to-list 'gnus-secondary-select-methods '(nntp gnus-nntp-server))
;; http://www.dmoz.org/Computers/Usenet/Public_News_Servers/
;; http://www.dmoz.org/Computers/Internet/On_the_Web/Message_Boards/Google_Groups/

;; ;; TODO improve something
;; (defvar mykie:condition-list
;;   `((c-mode    ("<"  . ".h>"))
;;     (jade-mode ("#{" . "}"))
;;     (html-mode ("<"  . ">"))
;;     (t         ("\"" . "\""))))

;; (defun mykie:query-x-times (type)
;;   (when (equal type 'word&num)
;;     (string-to-number
;;      (read-from-minibuffer "Input x times: "))))

;; (defun mykie:backword (type)
;;   (let ((regexp
;;          (case type
;;            (:number "[0-9]")
;;            (:string "[a-zA-Z0-9ぁ-んァ-ン上-黑]"))))
;;     (if (looking-at "[ \n]")
;;         (backward-char))
;;     (while (looking-at regexp)
;;       (backward-char))
;;     (forward-char)))

;; (defun mykie:replace-string (word)
;;   (let* ((separator
;;           (loop for (mode . sep) in mykie:condition-list
;;                 if (or (equal major-mode mode) (equal t mode))
;;                 do (return (car sep)))))
;;     (mykie:backword :string)
;;     (kill-word 1)
;;     (insert (car separator) word (cdr separator))))

;; (defun mykie:replace-number (number)
;;   (mykie:backword :number)
;;   (kill-word 1)
;;   (insert (number-to-string number))
;;   (backward-char))

;; (defvar mykie:url
;;   "https://www.google.com/search?newwindow=1&q=")
