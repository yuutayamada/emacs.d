
;;; Commentary:

;;; Code:
(deftheme my_pkg_colors "my pkg color theme.")

(custom-theme-set-faces
 'my_pkg_colors

 `(default ((t (:background
                ,(assoc-default 'background-color
                                (cadr window-system-default-frame-alist)))
               (:foreground
                ,(assoc-default 'foreground-color
                                (cadr window-system-default-frame-alist))))))

 ;; override manoj-dark's configuration
 '(font-lock-function-name-face ((t :height unspecified)))

 ;; grep or etc.
 '(success ((t :foreground "#00ffd7")))
 ;; shadow
 '(shadow  ((t :foreground "#505050")))

 ;;;;;;;;;;;;;;;;;;;;
 ;; PACKAGE COLORS ;;
 ;;;;;;;;;;;;;;;;;;;;
 ;; hl-line
 '(hl-line ((t :foreground unspecified)))

 ;; eshell
 '(eshell-prompt ((t :foreground "yellow" :weight bold :slant italic)))
 '(eshell-ls-executable ((t :foreground "#ff0000")))
 '(eshell-ls-product    ((t :foreground "#D7d700")))

 ;; skype
 '(skype--face-other-message ((t (:background "#D02090"))))
 '(skype--face-my-message    ((t (:background "#00008b"))))

 ;; CSS
 '(css-selector ((t (:foreground "#66D9EF"))))
 '(css-property ((t (:foreground "#FD971F"))))

 ;; nXML-mode
 ;; Tag name
 '(nxml-element-local-name ((t (:foreground "#F92672"))))
 ;; Attribute
 '(nxml-attribute-local-name ((t (:foreground "#66D9EF"))))
 ;; Powerline
 '(mode-line          ((t :background "#4169e1"
                          :foreground "#ffffff")))
 '(powerline-active1  ((t :foreground "white"
                          :background "#1a1eb2")))
 '(powerline-active2  ((t :foreground "white"
                          :background "#000080")))
 ;; Paren
 '(show-paren-match   ((t (:foreground "yellow" :background "#6a5acd"))))
 '(paren-face         ((t (:foreground "#A6E22A" :background nil))))
 '(nxml-tag-delimiter ((t (:foreground "#A6E22A"))))

 ;; DOCTYPE
 '(nxml-markup-declaration-delimiter ((t (:foreground "#74715D"))))

 ;; Dired
 '(dired-directory ((t (:foreground "#00ffff"))))
 '(dired-symlink   ((t (:foreground "#66D9EF"))))

 ;; Diff
 '(diff-context ((t :inherit shadow)))
 '(diff-changed ((t :background "#A0522D")))
 '(diff-added   ((t :foreground "#00BFFF" :background nil)))
 '(diff-removed ((t :foreground "#FF6A6A" :background nil)))
 '(diff-hunk-header-face ((t :foreground "#8B4513"
                             :background "#FFFFFF"
                             :weight     extra-bold
                             :underline  t
                             :inherit    nil)))

 '(diff-refine-change  ((t :inherit 'diff-changed)))
 `(diff-refine-added   ((t :inherit 'diff-added
                           :background ,(if (display-graphic-p)
                                            "#000080"
                                          "#00CDCD")
                           :foreground ,(if (display-graphic-p)
                                            "#FFFFFF"
                                          "#000000"))))
 `(diff-refine-removed ((t :inherit 'diff-removed
                           :background ,(if (display-graphic-p)
                                            "#FF0000"
                                          "#CD0000")
                           :foreground "#000000")))

 ;; eldoc
 '(eldoc-highlight-function-argument ((t :underline t
                                         :foreground "green"
                                         :weight bold)))

 ;; flyspell
 ;; Do not coloring duplicated word, draw underline instead.
 '(flyspell-duplicate  ((t :underline t)))

 ;; ;; flymake
 ;; '(flymake-errline  ((t :foreground nil)))
 ;; '(flymake-warnline ((t :foreground nil)))

 ;; Gnus
 '(gnus-group-mail-3       ((t :foreground "#87d7ff")))
 '(gnus-group-mail-3-empty ((t :foreground "#C6c6c6")))
 '(gnus-header-subject     ((t :foreground "#00afff" :weight bold)))
 '(gnus-header-name        ((t :foreground "#Cd0000")))
 '(gnus-header-content     ((t :foreground "#Cd4401")))

 ;; grammar.el
 '(grammar-error-face  ((t :background "#Ff6347"
                           :foreground "#000000")))
 ;; Ace jump
 '(ace-jump-face-foreground ((t :background "red"
                                :foreground "#Ffff00")))
 ;; Helm
 '(helm-source-header  ((t :background nil :foreground "#FFFF00")))
 '(helm-match          ((t :foreground "#Ff00ff")))
 '(helm-grep-match     ((t :foreground "#ff00ff")))
 '(helm-selection      ((t :background "#121212" :underline t
                           :inherit hl-line)))

 ;; isearch
 '(isearch-fail        ((t :background nil
                           :inherit font-lock-warning-face)))
 ;; lookup
 '(lookup-heading-1-face ((t :foreground "#87d7ff")))
 '(lookup-reference-face ((t :foreground "#Ffff87")))
 ;; navi2ch
 '(navi2ch-list-category-face
   ((t :foreground nil
       :inherit font-lock-function-name-face)))
 '(navi2ch-list-add-board-name-face
   ((t :foreground nil
       :inherit font-lock-function-name-face)))
 '(navi2ch-bm-updated-unread-face
   ((t :foreground nil
       :inherit font-lock-comment-face)))
 '(navi2ch-list-change-board-name-face
   ((t :foreground nil
       :inherit font-lock-comment-face)))
 '(navi2ch-bm-seen-unread-face
   ((t :foreground nil
       :inherit font-lock-comment-face)))
 '(navi2ch-bm-unread-face
   ((t :foreground nil
       :inherit font-lock-comment-face)))
 '(navi2ch-bm-new-unread-face
   ((t :foreground nil
       :inherit font-lock-comment-face)))
 '(navi2ch-bm-seen-update-face
   ((t :foreground nil
       :inherit font-lock-comment-face)))
 '(navi2ch-article-header-fusianasan-face
   ((t :foreground nil
       :inherit font-lock-constant-face)))
 '(navi2ch-bm-new-cache-face
   ((t :foreground nil
       :inherit font-lock-constant-face)))
 '(navi2ch-article-header-contents-face
   ((t :foreground nil
       :inherit font-lock-constant-face)))
 '(navi2ch-bm-cache-face
   ((t :foreground nil
       :inherit font-lock-constant-face)))
 '(navi2ch-bm-updated-cache-face
   ((t :foreground nil
       :inherit font-lock-constant-face)))
 '(navi2ch-bm-seen-cache-face
   ((t :foreground nil
       :inherit font-lock-constant-face)))
 '(navi2ch-list-board-name-face
   ((t :foreground nil
       :inherit font-lock-constant-face)))

 ;; Magit
 '(magit-log-sha1       ((t :foreground "#Ff0000")))
 '(magit-item-highlight ((t :inherit nil)))

 ;; Mew
 '(mew-face-body-comment ((t :foreground "#87afff")))

 ;; MMM-mode
 '(mmm-default-submode-face ((t (:foreground nil :background "#000000"))))

 ;; Org-mode
 '(org-document-info-keyword ((t :inherit 'org-meta-line)))

 ;; popup/popwin
 '(popup-menu-selection-face ((t :background "#5c5cff"
                                 :foreground "#E5e5e5")))
 '(popup-face                ((t :background "#E5e5e5"
                                 :foreground "#000000")))
 '(popup-isearch-match       ((t :background "#000080")))
 '(popup-menu-face           ((t :foreground "#00bfff"
                                 :background "#0a0a0a")))
 '(popup-menu-selection-face ((t :foreground "#000000"
                                 :background "#ffffff")))
 '(popup-tip-face            ((t :foreground "#000000"
                                 :background "#00ced1")))

 ;; highlight-indentation
 '(highlight-indentation-current-column-face ((t :background "grey40")))
 '(highlight-indentation-face                ((t :background "red")))

 ;; howm
 '(howm-reminder-normal-face ((t :foreground "#90ee90")))
 '(howm-reminder-today-face  ((t :foreground "#ffffff"
                                 :background "#Ee6363")))
 '(howm-mode-title-face      ((t :foreground "#00ff00")))
 '(howm-view-name-face       ((t :background "#4682b4")))
 '(howm-reminder-late-deadline-face ((t :foreground "#ffffff")))

 ;; Rainbow-delimiters
 '(rainbow-delimiters-depth-1-face ((t :foreground "#FFFFFF")))
 '(rainbow-delimiters-depth-2-face ((t :foreground "#FFFF00")))
 '(rainbow-delimiters-depth-3-face ((t :foreground "#00FF7F")))
 '(rainbow-delimiters-depth-4-face ((t :foreground "#00FFFF")))
 '(rainbow-delimiters-depth-5-face ((t :foreground "#FF00FF")))
 '(rainbow-delimiters-depth-6-face ((t :foreground "#FA8072")))
 '(rainbow-delimiters-depth-7-face ((t :foreground "#EEDD82")))
 '(rainbow-delimiters-depth-8-face ((t :foreground "#7FFFD4")))
 '(rainbow-delimiters-depth-9-face ((t :foreground "#1E90FF")))

 ;; SKK
 '(skk-henkan-face-default ((t :foreground "#ffffff"
                               :background "#0000d7")))

 ;; tabbar
 '(tabbar-default ((t :inherit 'tty-menu-disabled-face
                      ;; :background "black" :foreground "white"
                      )))
 '(tabbar-selected
   ((t :inherit 'tabbar-default
       :foreground "red"
       :background "white"
       :box '(:line-width 1 :color "red" :style pressed-button))))
 '(tabbar-unselected
   ((t :inherit 'tabbar-default
       :foreground nil
       :box '(:line-width 1 :color "white" :style relessed-button))))

 ;; undo-tree
 '(undo-tree-visualizer-active-branch-face
   ((t :foreground "#5fffff")))
 '(undo-tree-visualizer-unmodified-face
   ((t :foreground "#E5e5e5")))

 ;; w3m
 '(w3m-anchor ((t :foreground "#00d7ff")))

 ;; Whitespace-mode
 '(whitespace-tab             ((t :foreground "#0d0d0d")))
 '(whitespace-space           ((t :foreground "#7cfc00")))
 '(whitespace-trailing        ((t :foreground "#222222"
                                  :underline  "#222222")))
 '(whitespace-line            ((t :underline "#696969")))
 '(whitespace-space-after-tab ((t :background "#121212"
                                  :foreground "#Ff6347")))
 ;; wgrep.el
 '(wgrep-face ((t :bakground "#0000ff")))
 '(wgrep-file-face ((t :bakground "#0000ff")))
 '(wgrep-delete-face ((t :background "#0000ff")))
)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'my_pkg_colors)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; my_pkg_colors.el ends here
