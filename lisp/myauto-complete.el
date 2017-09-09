(require 'auto-complete)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
;; (ac-config-default)
(define-key ac-complete-mode-map [tab] 'ac-complete-with-helm)
