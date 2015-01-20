;;; package --- init file for android-mode -*- lexical-binding: t; -*-

;;; Commentary:


;;; Code:
;; android-start-emulator
;; -> (android-list-avd)の設定が設定される

(require 'android-mode)
(require 'cl-lib)

(defadvice android-mode (around prevent-android-mode activate)
  "Prevent android mode in specific buffer(s)."
  (unless (member major-mode '(git-commit-mode))
    ad-do-it))

(setq android-mode-sdk-dir (getenv "ANDROID_HOME")
      android-mode-key-prefix (kbd "C-c & C-c"))

(defvar Y/android-mode-install-command
  '((ant    . "ant -e debug && cd ./bin && adb install ./*-debug-unaligned.apk")
    (gradle . "gradlew build")))

(defun Y/android-mode-deploy (&optional update)
  "Deploy apk if you called with UPDATE, then delete previous apk."
  (interactive)
  (cl-loop initially (unless (shell-command "adb devices") (cl-return))
           with pwd = default-directory
           with uninstall = (format "adb uninstall %s && "
                                    (android-project-package))
           for (file . cmd) in '(("gradlew" . gradle)
                                 ("AndroidManifest.xml" . ant))
           if (locate-dominating-file pwd file)
           do (cl-return
               (progn (cd it)
                      (async-shell-command
                       (concat
                        (if update uninstall "")
                        (assoc-default cmd Y/android-mode-install-command)))
                      (cd pwd)))))

(defun Y/android-remove-apk ()
  "Remove apk which match current android project."
  (interactive)
  (let ((apk (android-project-package)))
    (if apk
        (shell-command (format "adb uninstall %s" apk))
      (shell-command (read-from-minibuffer "" (format "adb uninstall "))))))

(require 'flycheck-java)
(require 'helm)

(defvar Y/helm/android-source
  `((name . "android install")
    (init . (lambda () (defconst Y/android-current-apks
                    (flycheck-java-find "*.apk"))))
    (candidates . (lambda () Y/android-current-apks))
    (action . (lambda (apk)
                (async-shell-command
                 (format "adb install %s" apk))))))

(defun Y/android-install-apk ()
  "Install android apk."
  (interactive)
  (helm
   :sources Y/helm/android-source
   :buffer "*helm android install*"))

(defun Y/android-mode-browse-docs (&optional offline)
  "Browse android function by using local android document from SDK directory.
If you set OFFLINE as boolean variable, then use offline resource."
  (interactive)
  ;; Do not use other browse function, they might encode # mark and
  ;; Firefox didn't support the encoded # mark in my environment.
  (cl-flet ((browse-url-url-encode-chars (text _) text))
    (let ((func (thing-at-point 'word))
          (sdk  (getenv "ANDROID_SDK_HOME")))
      (when sdk
        (browse-url-of-file
         (if offline
             (format "%s/docs/offline.html" sdk)
           (format "%s/docs/index.html#q=%s" sdk
                   (read-from-minibuffer "Search: " func))))))))

(require 'mykie)
(mykie:set-keys android-mode-map
  "C-c i"
  :default Y/android-install-apk
  :C-u     android-build-install
  "C-c d" :default Y/android-remove-apk
  "C-c p"
  :default Y/android-mode-browse-docs
  :C-u     (Y/android-mode-browse-docs t)
  "M-q"
  :default Y/android-mode-deploy
  :C-u     (Y/android-mode-deploy t))

(provide 'init_android-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_android-mode.el ends here
