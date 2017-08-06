;;; init_simple.el ---                               -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(require 'cl-lib)
(defadvice what-cursor-position (around Y/add-extra-info activate)
  "Add extra info."
  (message "%s\nsyntax: %s\nface: %s\ntext-prop: %s\nppss: %s" ad-do-it
           (let ((c (char-syntax (string-to-char (thing-at-point 'char)))))
             (format "(%c) - %s"
                     c
                     (cl-case c
                       (?-  "whitespace Character")
                       (?/  "character quote character")
                       (?w  "word constituent")
                       (?$  "paired delimiter")
                       (?_  "symbol constituent")
                       (?'  "expression prefix")
                       (?.  "punctuation character")
                       (?<  "comment starter")
                       (?>  "comment ender")
                       (?\( "open delimiter character")
                       (?\) "close delimiter character")
                       (?!  "generic comment delimiter")
                       (?\" "string quote character")
                       (?|  "generic string delimiter")
                       (?\\ "escape character")
                       (?@  "inherit from `standard-syntax-table'"))))
           (face-at-point)
           (text-properties-at (point))
           (cl-loop with desc = `("0. depth in parens."
                                  "1. character address of start of innermost containing list; nil if none."
                                  "2. character address of start of last complete sexp terminated."
                                  ,(concat
                                    "3. non-nil if inside a string."
                                    "(it is the character that will terminate the string,)"
                                    " or t if the string should be terminated by a generic string delimiter.)")
                                  ,(concat
                                    "4. nil if outside a comment, t if inside a non-nestable comment,"
                                    "else an integer (the current comment nesting).")
                                  "5. t if following a quote character."
                                  "6. the minimum paren-depth encountered during this scan."
                                  "7. style of comment, if any."
                                  "8. character address of start of comment or string; nil if not in one."
                                  "9. a list of currently open parenthesis positions, starting with the outermost parenthesis."
                                  ;; emacs-version: "26.0.50"
                                  "10. non-nil when the last character scanned might be the first character of a two character construct, i.e., a comment delimiter or escaped character.  Its value is the syntax of that last character."
                                  )
                    for p in (syntax-ppss (point))
                    for description = (car desc) do
                    (setq desc (cdr desc))
                    collect (format "%s: %s" p description) into ppss
                    finally return (mapconcat 'identity ppss "\n    "))))

(provide 'init_simple)
;;; init_simple.el ends here
