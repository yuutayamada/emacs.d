;;; -*- coding: utf-8 -*-

;; android-start-emulator
;; -> (android-list-avd)の設定が設定される

(require 'android-mode)
(require 'cl-lib)

(setq android-mode-sdk-dir (getenv "ANDROID_HOME")
      android-mode-key-prefix "\C-c \C-c"
      android-mode-avd "AVD_for_android_4_2")

;; Note: To use adb command, you should add ./platform-tools/adb of sdk to PATH
(defun android-mode-install-to-real-machine ()
  (interactive)
  (let*
      ((base-directory default-directory)
       (build-dir (locate-dominating-file default-directory "build.xml")))
    (shell-command-to-string
     (concat "cd " build-dir " && "
             "rm -fr ./bin && "
             "ant debug && cd ./bin && adb install *.apk && "
             ;; " && ant release && cd ./bin && " adb " install -r *.apk && "
             "cd " base-directory))))

(defvar android-mode-ant-candidates
  '("r:elease" "d:ebug" "i:nstall -r ./bin/*.apk" "m:anuscript"))

(defun android-mode-query-build-setting ()
  (interactive)
  (read-minibuffer
   (mapconcat 'identity (android-mode-fontify android-mode-ant-candidates) " ")))

;; release
;; debug
;; install -r
;; manuscript
(defun android-mode-fontify (list)
  "Return fortified list of suffix"
  (let*
      ((fontify (lambda (string)
                  (put-text-property 0 1 'face
                                     'font-lock-function-name-face string))))
    (cl-loop for candidate in list
             collect (funcall fontify candidate)
             finally return list)))

;; (minibuffer-message
;;  (concat "select Ant build option\n "
;;          (mapconcat
;;           'identity
;;           (android-mode-fontify '("release" "debug" "manuscript")) " ")))

(provide 'init_android-mode)
