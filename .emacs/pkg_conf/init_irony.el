;;; init_irony.el ---                           -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; I needed `apt-get install libclang-dev' when I got below error:
;; CMake Error at /usr/share/cmake-3.0/Modules/FindPackageHandleStandardArgs.cmake:136 (message):
;;   Could NOT find LibClang (missing: LIBCLANG_LIBRARY LIBCLANG_INCLUDE_DIR)

;; First time you might need `M-x irony-install-server' command'.

;;; Code:
(defconst irony-user-dir (concat (getenv "XDG_CACHE_HOME") "/emacs/irony"))
(defconst irony-server-install-prefix irony-user-dir)

(require 'irony)
(require 'company-irony)
(require 'company-arduino)
(require 'flycheck-irony)
(require 'irony-eldoc)
(require 'c-eldoc)

;;;###autoload
(add-hook 'c++-mode-hook 'irony-mode)
;;;###autoload
(add-hook 'c-mode-hook 'irony-mode)
;;;###autoload
(add-hook 'objc-mode-hook 'irony-mode)

;;;###autoload
(defun Y/irony-mode-setup ()
  "Setup irony-mode."
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (define-key irony-mode-map [remap completion-at-point] 'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol] 'irony-completion-at-point-async)
  ;; add irony backend
  (add-to-list 'company-backends 'company-irony)
  ;; eldoc
  (c-turn-on-eldoc-mode)
  (irony-eldoc t))

(add-hook 'irony-mode-hook 'Y/irony-mode-setup)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; company-irony.el ;;
;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; Company-Arduino
(add-hook 'irony-mode-hook 'company-arduino-turn-on) ; set this before loading irony)

(provide 'init_irony)
;;; init_irony.el ends here
