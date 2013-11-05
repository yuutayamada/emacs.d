;;; init_latex.el --- init file for org latex

;; Copyright (C) 2014 by Yuta Yamada

;; Author: Yuta Yamada <cokesboy"at"gmail.com>

;;; License:
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;; Commentary:

;;; Code:

(require 'ox-latex)

(setq org-latex-default-class "extract"
      org-latex-pdf-process
      '("platex -kanji=utf8 -no-shell-escape -src-specials -interaction=nonstopmode -output-directory %o %f"
        "dvipdfmx -r 1200 -o %b.pdf %b"))

(add-to-list 'org-latex-classes
             '("jarticle"
               "
\\documentclass[a4j]{jarticle}
\\usepackage{color}
\\pagecolor{black}
\\color{white}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; from here: https://gist.github.com/supermomonga/4244229
(add-to-list 'org-latex-classes
             '("thesis"
               "
\\documentclass[11pt,a4paper]{jarticle}
\\usepackage[dvipdfm]{graphicx}
\\usepackage{times} % Times Roman
\\usepackage{geometry} % 余白の調整パッケージ
\\usepackage{setspace} % 行間の倍率調整パッケージ
\\usepackage{slashbox} % 表の斜線パッケージ
\\usepackage{multirow} % 表縦連結パッケージ
\\usepackage{float}
\\usepackage{amsmath}
\\usepackage{color} % 文字色変更パッケージ
%\\usepackage[margin=2cm,nohead, nofoot] {geometry}
\\setlength{\\baselineskip}{30pt}
\\geometry{left=30mm,right=30mm,top=35mm,bottom=30mm} % 余白の微調整
\\setstretch{1.2} % ページ全体の行間を設定
\\setlength {\\textheight} {36\\baselineskip } % 1ページの行数調整
\\setlength {\\textwidth} {40zw } % 1行の文字数調整
\\usepackage{pifont}
\\bibliographystyle{jplain}
"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("extract"
               "
\\documentclass[9pt,twocolumn]{jsarticle}
%\\usepackage[dviout]{graphicx}
\\usepackage[dvipdfm]{graphicx}
\\usepackage{times} % Times Roman
\\usepackage{geometry} % 余白の調整パッケージ
\\usepackage{setspace} % 行間の倍率調整パッケージ
\\usepackage{slashbox} % 表の斜線パッケージ
\\usepackage{multirow} % 表縦連結パッケージ
\\usepackage{float}
\\usepackage{amsmath}
%\\usepackage[margin=2cm,nohead, nofoot] {geometry}
\\geometry{left=21.3mm,right=21.3mm,top=25.4mm,bottom=25.4mm} % 余白の微調整
\\setstretch{0.9} % ページ全体の行間を設定
%\\setlength {\textheight} {52\baselineskip } % 1ページの行数調整
%\\setlength {\textwidth} {50zw } % 1行の文字数調整
\\pagestyle{empty}
\\usepackage{pifont}
\\bibliographystyle{jplain}
"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(provide 'init_latex)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_latex.el ends here
