;;; init_java.el --- init file for java-mode

;;; Commentary:
;; This file is loaded from java-mode-hook
;;; Code:

(require 'my_autoload)
(require 'cl-lib)
(require 'flycheck-java)

(defconst flymake-java-default-android-sdk-version "21")

(defun Y/java-init ()
  "Init function for `java-mode'."
  (c-set-style "my-java")
  (when (string-match "android" buffer-file-name)
    (require 'init_android-mode))
  (require 'init_javadoc-lookup)
  ;; To use auto-java-complete, you need to prepare ~/.java_base.tag file
  ;; See Install file in auto-java-complete.
  (require 'init_auto-java-complete))

(add-hook 'java-mode-hook 'Y/java-init)

;; Maybe I don't use eclim anymore...
;; (defun my/java-boot-eclim ()
;;   "Boot eclim."
;;   (when (and (not (string-match "^\\*Org Src .*\\*" (buffer-name)))
;;              (string-match "/src/.*\\.java$" buffer-file-truename)
;;              (my/boot-eclim)
;;              (eclim--project-name))
;;     (eclim-mode)
;;     (ac-emacs-eclim-config)))

(provide 'init_java)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_java.el ends here
