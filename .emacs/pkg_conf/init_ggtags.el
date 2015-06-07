;;; init_ggtags.el --- init file for  ggtags.el -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(require 'cl-lib)
(advice-add 'ggtags-find-tag-dwim :before
            '(lambda (&rest args)
               (cl-case major-mode
                 ((arduino-mode c-mode c++-mode)
                  (when (company-arduino-sketch-directory-p)
                    (setenv "GTAGSLIBPATH" (getenv "ARDUINO_HOME")))))))

(provide 'init_ggtags)
;;; init_ggtags.el ends here
