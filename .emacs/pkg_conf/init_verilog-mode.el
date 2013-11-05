;;; init_verilog-mode.el --- my verilog configuration
;;; Commentary:
;; http://ameblo.jp/concello/theme-10028139067.html
;; Xilinx pdf
;; http://japan.xilinx.com/support/documentation/sw_manuals_j/xilinx11/sim.pdf
;;; Code:

(require 'verilog-mode)
(require 'cl-lib)

;;;;;;;;;;;;;;;;;
;; INDENTATION ;;
;;;;;;;;;;;;;;;;;
(setq verilog-indent-level             3 ; if else
      verilog-indent-level-module      3 ; after module declaration
      verilog-indent-level-declaration 3 ; ?
      verilog-indent-level-behavioral  3 ; ?
      verilog-indent-level-directive   1 ; ?
      verilog-case-indent              2
      ;; Close parentheses' indentation of module
      verilog-cexp-indent              2
      ;; changed t -> nil to remove indentation during specifying module args
      verilog-indent-lists t; default is t
      )

(setq verilog-auto-newline             nil ; annoying
      verilog-auto-indent-on-newline   t
      verilog-tab-always-indent        t
      verilog-auto-endcomments         t
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if    t
      verilog-auto-lineup              'declarations
      verilog-highlight-p1800-keywords t
      verilog-highlight-grouping-keywords t
      verilog-highlight-modules t
      verilog-indent-declaration-macros t
      verilog-auto-delete-trailing-whitespace t
      ;; verilog-linter "iverilog"
      verilog-compiler "iverilog")

;; verilog-lib
(setq verilog-tool
      ;; Use directory name as output file name.
      `(cl-loop with d = (locate-dominating-file default-directory "top.v")
                with dirname = (split-string
                                (or (and d (directory-file-name d))
                                    (file-name-directory buffer-file-name))
                                "/")
                for name in (reverse dirname)
                if (string< "" name)
                do (cl-return (format "%s -o %s.vvp " verilog-compiler name))))

;; Colorize numbers
(font-lock-add-keywords
 'verilog-mode
 '(("\\(\\<[1-9][0-9_]*\\)?'h[0-9_a-fxz]+\\>" . font-lock-string-face)   ; hex
   ("\\(\\<[1-9][0-9_]*\\)?'d[0-9_xz]+\\>"    . font-lock-string-face)   ; decimal
   ("\\(\\<[1-9][0-9_]*\\)?'o[0-7_xz]+\\>"    . font-lock-string-face)   ; octal
   ("\\(\\<[1-9][0-9_]*\\)?'b[01_xz]+\\>"     . font-lock-string-face)   ; binary
   ("\\<[0-9][0-9_]*\\>"                      . font-lock-string-face))) ; none

;;;;;;;;;;;;;;
;; KEYBINDS ;;
;;;;;;;;;;;;;;
(require 'mykie)
(mykie:set-keys verilog-mode-map
  "C-c C-c" :default Y/verilog-compile-or-execute)

;; ;; GTKWave
;; (lookup-key verilog-mode-map (kbd "C-c C-c"))

(defun Y/verilog-compile-or-execute ()
  "Compile or execute test vvp file."
  (interactive)
  (let* ((vvp  (format "%s.vvp" (file-name-base buffer-file-name)))
         (file buffer-file-name)
         (exe (lambda ()
                (shell-command
                 (format "vvp %s" vvp) (get-buffer-create "*vvp*"))
                (pop-to-buffer (get-buffer "*vvp*")))))
    (if (and (file-exists-p vvp)
             (file-newer-than-file-p vvp file))
        (funcall exe)
      (compile (format "%s -o %s ./*.v" verilog-compiler vvp)))))

(defun Y/verilog-default-insert ()
  "Insert default string."
  (interactive)
  (when (= (point-max) 1)
    (let* ((timescale "`timescale 1ns/1ps")
           (filename (file-name-base buffer-file-name))
           (module   (format  "module %s();\n\nendmodule" filename)))
      (insert (mapconcat 'identity (list timescale module) "\n"))
      (re-search-backward filename)
      (re-search-forward "("))))

(add-hook 'verilog-mode-hook 'Y/verilog-default-insert)

;; setup AUTOINST?
;; http://0918.jp/ryusai/veri-mode2.htm
;; verilog-library-flags
;; verilog-library-directories
;; verilog-library-files
;; experimental variable
;; verilog-auto-declare-nettype ""
;; verilog-auto-wire-type
(provide 'init_verilog-mode)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_verilog-mode.el ends here
