(require 'recentf) 
(recentf-mode 1)

;;(require 'skeleton)

;;(require 'yasnippet)
;;(yas/initialize)
;;(yas/load-directory "~/.emacs.el/yasnippet-0.6.1c/snippets")

(require 'gtags)
(require 'eassist)
(require 'cmake-mode)

;;-----------------------config------------------------
;; (modify-syntax-entry ?_ "w" c-mode-syntax-table)
;; (modify-syntax-entry ?_ "w" c++-mode-syntax-table)
;; (modify-syntax-entry ?- "w" lisp-mode-syntax-table)
;; (modify-syntax-entry ?- "w" emacs-lisp-mode-syntax-table)
;; (modify-syntax-entry ?_"w" lisp-mode-syntax-table)
;; (modify-syntax-entry ?_ "w" emacs-lisp-mode-syntax-table)

;;(defvar first-time-fullscreen "non")
;;(if (equal first-time-fullscreen "non") (toggle-fullscreen))
;;(setq first-time-fullscreen "oui")

(setq custom-file "~/.emacs.d/mycustom.el")
(load "mycustom.el")

;;(set-frame-font "-unknown-LMRoman12-normal-normal-normal-*-15-*-*-*-*-0-iso10646-1")

;;(set-background-color "lightblue")

(fset 'yes-or-no-p 'y-or-n-p)

;(get 'yank 'delete-selection)
(put 'yank 'delete-selection 'yank)

(defvar first-open "non")
(if (equal first-open "non") (find-file "~/.emacs.d/myemacs.el"))
(setq first-open "oui")

