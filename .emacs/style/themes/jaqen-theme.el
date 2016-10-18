;;; jaqen-theme.el --- a soft dark color theme which aimed to use both nox and gui versions' Emacs -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;; If you got weird faces on terminal, you may need to load this theme before
;; tty-setup-hook:
;;
;; (add-hook 'tty-setup-hook
;;           '(lambda () (set-terminal-parameter nil 'background-mode 'dark)))
;;
;; In terminal Emacs, always use transparent bg even though color
;; theme specify the background color.
;; (defconst window-system-default-frame-alist
;;   `((nil . ((background-color . "unspecified-bg")))))
;;
;;; Code:

(deftheme jaqen "Face colors similar to Nova color
scheme (http://www.trevordmiller.com/nova/).  The colors are
chosen to match terminal Emacs a.k.a Emacs-nox and GUI version's
Emacs")

(defvar jaqen-group-list
  '((:jon         . (:blue1 :fl-fun))
    (:sam         . (:blue2 :fl-var))
    (:sansa       . (:magenta1 :fl-kwd))
    (:arya        . (:magenta2))
    (:ned         . (:red1 :fl-neg))
    (:cat         . (:red2 :fl-war))
    (:robb        . (:orange :fl-doc))
    (:hodor       . (:yellow1 :fl-bui))
    (:bran        . (:yellow2 :fl-typ))
    (:reek        . (:green1 :fl-str))
    (:ramsay      . (:green2 :fl-con :success))
    (:dragon3     . (:bg-1))
    (:dragon2     . (:bg+1 :fl-comd :hl-bg :r-bg :shadow))
    (:dragon1     . (:bg+2 :fl-com :linum-fg))
    (:daenerys    . (:bg :linum-bg))
    (:tyrion      . (:fg-1 :fl-pre :ul))
    (:cersei      . (:fg))
    (:jaime       . (:fg+1))
    (:joffrey     . (:org-header-bg))
    ;; kind of /dev/null
    (:whiteWakers . (:r-fg :hl-fg))))

(defvar jaqen-face-colors
  ;; https://www.google.com/search?client=ubuntu&channel=fs&q=game+of+thrones+names&ie=utf-8&oe=utf-8
  '((:jon      . ("#83AFE5"))
    (:sam      . ("#5FAFFF"))
    (:sansa    . ("#9A93E1"))
    (:arya     . ("#AB82FF"))
    (:ned      . ("#D18EC2"))
    (:cat      . ("#DF8C8C"))
    (:robb     . ("#F2C38F"))
    (:hodor    . ("#DADA93"))
    (:bran     . ("#A8CE93"))
    (:reek     . ("#7FB1BA" . "#87CEEB"))
    (:ramsay   . ("#5FAF5F"))
    (:dragon3  . ("#1E272C" . "#1C1C1C")) ; Drogon
    (:dragon2  . ("#556873" . "#585858")) ; Rhaegal
    (:dragon1  . ("#6A7D89" . "#767676")) ; Viserion
    (:daenerys . ("#3C4C55" . "#444444"))
    (:tyrion   . ("#899BA6" . "#949494"))
    (:cersei   . ("#C5D4DD"))
    (:jaime    . ("#E6EEF3"))
    (:joffrey  . ("#005f87")) ; lannistar: tommen, myrcella
    ;; targaryen: viserys
    ;; stark: benjen
    ;; Tyrell: loras, margaery
    ))

(add-hook 'after-make-frame-functions 'jaqen-adapt-terminal-colors)
(defun jaqen-adapt-terminal-colors (frame)
  "Adjust `jaqen-face-colors' for terminal Emacs of FRAME."
  (unless (window-system frame) ; `nil' means nox
    (cl-loop with f = (lambda (color)
                        (cl-mapcar (lambda (x) (truncate (min 65535 (* 256 256 x))))
                                   (color-name-to-rgb color)))
             for (_ . (c1 . c2)) in jaqen-face-colors
             if c2 do
             (let* ((idxc1 (tty-color-translate c1))
                    (name1 (car (tty-color-by-index idxc1)))
                    (idxc2 (tty-color-translate c2)))
               (tty-color-define name1 idxc2 (funcall f c1) frame)))))

(defun jaqen-find (name-tag)
  "Find color which correspond to the NAME-TAG."
  (jaqen
   (cl-loop for (alias . member) in jaqen-group-list
            if (memq name-tag member)
            do (cl-return alias)
            finally return 'unspecified)))

(defun jaqen (keyword)
  "Return color which correspond to the KEYWORD.
Note this function is designed internal use only."
  (car (alist-get keyword jaqen-face-colors)))

(custom-theme-set-faces
 'jaqen

 ;; default
 `(default ((t :background ,(jaqen :daenerys) :foreground ,(jaqen :cersei))))

 ;; font lock
 `(font-lock-doc-face               ((t :foreground ,(jaqen-find :fl-doc))))
 `(font-lock-string-face            ((t :foreground ,(jaqen-find :fl-str))))
 `(font-lock-comment-face           ((t :foreground ,(jaqen-find :fl-com))))
 `(font-lock-comment-delimiter-face ((t :foreground ,(jaqen-find :fl-comd))))
 `(font-lock-keyword-face           ((t :foreground ,(jaqen-find :fl-kwd))))
 `(font-lock-builtin-face           ((t :foreground ,(jaqen-find :fl-bui))))
 `(font-lock-preprocessor-face      ((t :foreground ,(jaqen-find :fl-pre))))
 `(font-lock-function-name-face     ((t :foreground ,(jaqen-find :fl-fun))))
 `(font-lock-type-face              ((t :foreground ,(jaqen-find :fl-typ))))
 `(font-lock-constant-face          ((t :foreground ,(jaqen-find :fl-con))))
 `(font-lock-variable-name-face     ((t :foreground ,(jaqen-find :fl-var))))
 `(font-lock-negation-char-face     ((t :foreground ,(jaqen-find :fl-neg))))
 `(font-lock-warning-face           ((t :foreground ,(jaqen-find :fl-war))))

 `(region                           ((t :foreground ,(jaqen-find :r-fg)
                                        :background ,(jaqen-find :r-bg))))

 `(hl-line ((t :foreground ,(jaqen-find :hl-fg)
               :background ,(jaqen-find :hl-bg))))

 ;; term
 `(term-color-blue ((t :foreground ,(jaqen-find :blue1)
                       :background ,(jaqen-find :blue2))))

 `(term-color-red ((t :foreground ,(jaqen-find :red1)
                      :background ,(jaqen-find :red2))))

 `(term-color-green ((t :foreground ,(jaqen-find :green1)
                        :background ,(jaqen-find :green2))))

 `(term-color-yellow ((t :foreground ,(jaqen-find :yellow1)
                         :background ,(jaqen-find :yellow2))))

 `(term-color-magenta ((t :foreground ,(jaqen-find :magenta1)
                          :background ,(jaqen-find :magenta2))))

 ;; grep or etc.
 `(success ((t :foreground ,(jaqen-find :success))))

 ;; shadow
 `(shadow  ((t :foreground ,(jaqen-find :shadow))))

 ;; Linum
 `(linum ((t :foreground ,(jaqen-find :linum-fg)
             :background ,(jaqen-find :linum-bg))))

 
 ;; PACKAGE COLORS

 ;; eshell
 `(eshell-prompt ((t :foreground ,(jaqen :hodor) :weight bold :slant italic)))
 `(eshell-ls-executable ((t :foreground ,(jaqen :cat))))
 `(eshell-ls-product    ((t :foreground ,(jaqen :bran))))

 ;; skype
 `(skype--face-other-message ((t (:background ,(jaqen :reek)))))
 `(skype--face-my-message    ((t (:background ,(jaqen :jon)))))

 ;; CSS
 `(css-selector ((t (:foreground ,(jaqen :reek)))))
 `(css-property ((t (:foreground ,(jaqen :hodor)))))

 ;; nXML-mode
 ;; Tag name
 `(nxml-element-local-name ((t (:foreground ,(jaqen :robb)))))
 ;; Attribute
 `(nxml-attribute-local-name ((t (:foreground ,(jaqen :jon)))))
 `(nxml-tag-delimiter ((t :foreground ,(jaqen :hodor))))
 `(nxml-markup-declaration-delimiter ((t (:foreground ,(jaqen :robb)))))

 ;; Powerline
 `(mode-line          ((t :background ,(jaqen :sansa)
                          :foreground ,(jaqen :jaime))))
 `(powerline-active1  ((t :foreground ,(jaqen :jaime)
                          :background ,(jaqen :sansa))))
 `(powerline-active2  ((t :foreground ,(jaqen :jaime)
                          :background ,(jaqen :jon))))

 ;;;;;;;;;;;
 ;; Paren
 `(show-paren-match   ((t :background ,(jaqen :dragon2))))
 `(paren-face         ((t :foreground ,(jaqen :hodor) :background nil)))

 ;; Dired
 `(dired-directory ((t (:foreground ,(jaqen-find :green1)))))
 `(dired-symlink   ((t (:foreground ,(jaqen-find :blue1)))))

 ;; Diff
 '(diff-context ((t :inherit shadow)))
 `(diff-changed ((t :background ,(jaqen-find :orange))))
 `(diff-added   ((t :foreground ,(jaqen-find :blue1) :background nil)))
 `(diff-removed ((t :foreground ,(jaqen-find :red1) :background nil)))
 `(diff-hunk-header-face ((t :foreground ,(jaqen :daenerys)
                             :background ,(jaqen :jaime)
                             :weight     extra-bold
                             :underline  t
                             :inherit    nil)))

 '(diff-refine-change  ((t :inherit 'diff-changed)))
 `(diff-refine-added   ((t :inherit 'diff-added
                           :slant italic
                           :foreground ,(jaqen-find :green2))))
 `(diff-refine-removed ((t :inherit 'diff-removed
                           :slant italic
                           :foreground ,(jaqen-find :magenta2))))

 ;; eldoc
 `(eldoc-highlight-function-argument ((t :underline t
                                         :foreground ,(jaqen-find :success)
                                         :weight bold)))

 ;; flyspell
 ;; Do not colorize duplicated word, draw underline instead.
 '(flyspell-duplicate  ((t :underline t)))

 ;; grammar.el
 `(grammar-error-face  ((t :background ,(jaqen :cat)
                           :foreground ,(jaqen :dragon3))))

 ;; avy
 `(avy-lead-face   ((t :foreground ,(jaqen-find :bg+1) :background ,(jaqen-find :blue1))))
 `(avy-lead-face-0 ((t :foreground ,(jaqen-find :bg+1) :background ,(jaqen-find :magenta1))))
 `(avy-lead-face-1 ((t :foreground ,(jaqen-find :bg+1) :background ,(jaqen-find :green1))))
 `(avy-lead-face-2 ((t :foreground ,(jaqen-find :bg+1) :background ,(jaqen-find :yellow1))))

 ;; Company-mode
 ;; first part
 `(company-tooltip-common
   ((t :foreground ,(jaqen-find :fg)
       :background ,(jaqen-find :bg))))
 `(company-tooltip-common-selection
   ((t :foreground ,(jaqen-find :fg+1)
       :background ,(jaqen-find :bg+1))))

  ;; rest of completion
 `(company-tooltip-selection ((t :foreground ,(jaqen-find :fg+1)
                                 :background ,(jaqen-find :bg+1))))
 ;; rest of completion not selected
 `(company-tooltip ((t :foreground ,(jaqen-find :fg)
                       :background ,(jaqen-find :bg))))

 ;; type annotation (matched?)
 `(company-tooltip-annotation-selection
   ((t :foreground ,(jaqen-find :success)
       :background ,(jaqen-find :bg+1))))

 `(company-tooltip-annotation
   ((t :foreground ,(jaqen-find :fg-1)
       :background ,(jaqen-find :bg))))

 ;; Suggestion-box
 `(suggestion-box-face
   ((t :foreground ,(jaqen-find :blue1)
       :background ,(jaqen-find :shadow))))

 ;; Helm
 `(helm-source-header  ((t :background nil :foreground ,(jaqen :hodor))))
 `(helm-match          ((t :foreground ,(jaqen :sansa))))
 `(helm-grep-match     ((t :foreground ,(jaqen :sansa))))
 `(helm-selection      ((t :background ,(jaqen :dragon3) :underline t
                           :inherit hl-line)))

 ;; isearch
 '(isearch-fail        ((t :background nil
                           :inherit font-lock-warning-face)))

 ;; lookup
 `(lookup-heading-1-face ((t :foreground ,(jaqen :reek))))
 `(lookup-reference-face ((t :foreground ,(jaqen :hodor))))

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
 '(magit-item-highlight ((t :inherit nil)))
 '(magit-diff-removed ((t :foreground nil :background nil :inherit 'diff-removed)))
 '(magit-diff-added   ((t :foreground nil :background nil :inherit 'diff-added)))
 '(magit-diff-removed-highlight
   ((t :foreground nil :background nil :weight bold :inherit 'diff-removed)))
 '(magit-diff-added-highlight
   ((t :foreground nil :background nil :weight bold :inherit 'diff-added)))
 `(magit-log-sha1 ((t :foreground ,(jaqen :ned))))

 ;; Mew
 `(mew-face-body-comment ((t :foreground ,(jaqen :jon))))

 ;; Outline:
 ;; this is inherited from org level 4 face
 ;; `(outline-1 ((t :background ))) ; func, var, kwd, com, type, cos, bui, str
 ;; MEMO: you might not use :height and :slant simultaneously
 ;;
 `(org-document-title ((t :height 1.2 :foreground ,(jaqen-find :blue1))))
 `(outline-1 ((t :weight bold :slant italic :foreground
                 ,(jaqen-find :fl-fun) :background ,(jaqen-find :org-header-bg))))
 `(outline-2 ((t :weight bold :slant italic :foreground
                 ,(jaqen-find :fl-var) :background ,(jaqen-find :org-header-bg))))
 `(outline-3 ((t :weight bold :slant italic :foreground
                 ,(jaqen-find :fl-kwd) :background ,(jaqen-find :org-header-bg))))
 `(outline-4 ((t :weight bold :slant italic :foreground
                 ,(jaqen-find :fl-pre) :background ,(jaqen-find :org-header-bg))))
 `(outline-5 ((t :weight bold :slant italic :foreground
                 ,(jaqen-find :fl-typ) :background ,(jaqen-find :org-header-bg))))
 `(outline-6 ((t :weight bold :slant italic :foreground
                 ,(jaqen-find :fl-cos) :background ,(jaqen-find :org-header-bg))))
 `(outline-7 ((t :weight bold :slant italic :foreground
                 ,(jaqen-find :fl-bui) :background ,(jaqen-find :org-header-bg))))
 `(outline-8 ((t :weight bold :slant italic :foreground
                 ,(jaqen-find :fl-str) :background ,(jaqen-find :org-header-bg))))

 ;; Org-mode
 '(org-document-info-keyword ((t :inherit 'org-meta-line)))
 '(org-block ((t :inherit 'font-lock-doc-face)))
 '(org-code  ((t :inherit 'font-lock-builtin-face)))
 `(org-hide ((t :foreground ,(jaqen :daenerys))))

 ;; indent-guide
 `(indent-guide-face ((t :foreground ,(jaqen :reek))))

 ;; howm
 `(howm-reminder-normal-face ((t :foreground ,(jaqen :bran))))
 `(howm-reminder-today-face  ((t :foreground ,(jaqen :jaime)
                                 :background ,(jaqen :cat))))
 `(howm-mode-title-face      ((t :foreground ,(jaqen :bran))))
 `(howm-view-name-face       ((t :background ,(jaqen :jon))))
 `(howm-reminder-late-deadline-face ((t :foreground ,(jaqen :cersei))))

 ;; Rainbow-delimiters
 `(rainbow-delimiters-depth-1-face ((t :foreground ,(jaqen :reek))))
 `(rainbow-delimiters-depth-2-face ((t :foreground ,(jaqen :jon))))
 `(rainbow-delimiters-depth-3-face ((t :foreground ,(jaqen :sansa))))
 `(rainbow-delimiters-depth-4-face ((t :foreground ,(jaqen :ned))))
 `(rainbow-delimiters-depth-5-face ((t :foreground ,(jaqen :cersei))))
 `(rainbow-delimiters-depth-6-face ((t :foreground ,(jaqen :cat))))
 `(rainbow-delimiters-depth-7-face ((t :foreground ,(jaqen :jaime))))
 `(rainbow-delimiters-depth-8-face ((t :foreground ,(jaqen :apecial))))
 `(rainbow-delimiters-depth-9-face ((t :foreground ,(jaqen :bran))))

 ;; SKK
 `(skk-henkan-face-default ((t :foreground ,(jaqen :cersei)
                               :background ,(jaqen :jon))))

 ;; shell
 '(sh-quoted-exec ((t :inherit 'font-lock-preprocessor-face)))

 ;; tabbar
 `(tabbar-default ((t :foreground ,(jaqen :dragon2)
                      :background ,(jaqen :dragon1)
                      :underline nil)))
 `(tabbar-selected
   ((t :inherit 'tabbar-default
       :foreground ,(jaqen :reek) :background ,(jaqen :daenerys))))

 `(tabbar-unselected
   ((t :inherit 'tabbar-default :foreground ,(jaqen :dragon3))))

 ;; tool bar
 `(tool-bar ((t :foreground ,(jaqen :dragon1) :background ,(jaqen :dragon2))))

 ;; undo-tree
 `(undo-tree-visualizer-active-branch-face
   ((t :foreground ,(jaqen :reek))))
 `(undo-tree-visualizer-unmodified-face
   ((t :foreground ,(jaqen :jaime))))

 ;; w3m
 `(w3m-anchor ((t :foreground ,(jaqen :reek))))

 ;; Whitespace-mode
 `(whitespace-tab             ((t :foreground ,(jaqen :dragon3))))
 `(whitespace-space           ((t :foreground ,(jaqen :bran)
                                  :weight bold)))
 `(whitespace-trailing        ((t :foreground ,(jaqen :dragon2)
                                  :underline  ,(jaqen :dragon2))))
 `(whitespace-line            ((t :underline  ,(jaqen :tyrion))))
 `(whitespace-space-after-tab ((t :background ,(jaqen :dragon3)
                                  :foreground ,(jaqen :cat))))
 ;; wgrep.el
 `(wgrep-face        ((t :background ,(jaqen :sansa))))
 `(wgrep-file-face   ((t :background ,(jaqen :sansa))))
 `(wgrep-delete-face ((t :background ,(jaqen :sansa))))

 ;; beacon.el
 `(beacon-fallback-background ((t :background ,(jaqen :sansa))))
)

(with-eval-after-load "evil-states"
  (setq-default
   evil-default-cursor      'box ; You can specify: 'hbar or 'box
   evil-normal-state-cursor  `(,(jaqen :sansa) box)
   evil-insert-state-cursor  `(,(jaqen :jon)  (bar . 2))
   evil-emacs-state-cursor   `(,(jaqen :bran) (bar . 2))
   evil-replace-state-cursor `(,(jaqen :reek)  box)
   evil-visual-state-cursor  `(,(jaqen :hodor) hbar)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'jaqen)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; no-byte-compile: t
;; End:

;;; jaqen-theme.el ends here
