;;; init_java.el --- init file for java-mode

;;; Commentary:
;; This file is loaded from java-mode-hook
;;; Code:

(require 'cl-lib)
(require 'flycheck-java)
(require 'ajc-java-complete-config)

(defconst flymake-java-default-android-sdk-version "21")

(defun Y/java-init ()
  "Init function for `java-mode'."
  (c-set-style "my-java")
  (when (string-match "android" buffer-file-name)
    (require 'init_android-mode))
  (require 'init_javadoc-lookup)
  ;; To use auto-java-complete, you need to prepare ~/.java_base.tag file
  ;; See Install file in auto-java-complete.
  (when (file-exists-p "~/.java_base.tag")
    (ajc-java-complete-mode t)))

;;;###autoload
(add-hook 'java-mode-hook 'Y/java-init)

(provide 'init_java)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_java.el ends here
