;;; init_mysql.el --- init file for mysql file

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
;; You can change database by (sql-set-product "mysql").
;;; Code:

(require 'sql)
(require 'sql-indent)

(setq sql-indent-maybe-tab nil
      sql-indent-offset 2
      sql-indent-debug nil)

(defadvice sql-indent-line
  (around ad-move-next-character activate)
  ad-do-it
  (while (not (or (looking-at "[^   ]")
                  (eolp)))
    (forward-char 1)))

(provide 'init_sql)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init_sql.el ends here
