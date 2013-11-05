;;; init_org-trello.el --- init file for org-trello

;; Copyright (C) 2013 by Yuta Yamada

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

;;; This package depending on below packages
;; ((org "8.0.7") (dash "1.5.0") (request "0.2.0")
;;  (cl-lib "0.3.0") (json "1.2") (elnode "0.9.9.7.6") (esxml "0.3.0"))

(require 'org-trello nil t)
;; elnode didn't work at my machine, so I rewind it until d7e77a7.
(load "/home/ck/hotdog/elisp/el-get/elnode/elnode")
(setq *ORGTRELLO-PROXY-PORT* 9876
      *ORGTRELLO-CHECKLIST-UPDATE-ITEMS* t)

(provide 'init_org-trello)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_org-trello.el ends here
