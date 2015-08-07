;;; init_simple.el ---                               -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(defadvice what-cursor-position (around Y/add-extra-info activate)
  "Add extra info."
  (message "%s syntax(%c)\nppss: %s" ad-do-it
           (char-syntax (string-to-char (thing-at-point 'char)))
           (syntax-ppss (point))))

(provide 'init_simple)
;;; init_simple.el ends here
