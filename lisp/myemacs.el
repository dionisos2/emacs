;;; myemacs.el --- global configuration file for emacs
;;; Commentary:
;; a mettre dans le fichier .emacs
;; (add-to-list 'load-path "~/.emacs.el")
;; (load "myemacs.el")

;;------------------load elisp file--------------------

;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/yaml-mode")
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete")
(add-to-list 'load-path "~/.emacs.d/lisp/emacs-w3m")
(add-to-list 'load-path "~/.emacs.d/lisp/diff_region")
(add-to-list 'load-path "~/.emacs.d/lisp/dash.el")
(add-to-list 'load-path "~/.emacs.d/lisp/magit")

;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m")

(load-file "~/.emacs.d/lisp/php-mode/php-mode.el")
(load-file "~/.emacs.d/lisp/web-mode/web-mode.el")


;;f5 pour un acces rapide aux fichiers, voir key.el pour tout les autres raccourcie clavier.
;;../README
;;../template/

(require 'dash)
(require 'magit)
(load "langtoolconfig.el")
(load "autosaveconfig.el")
(load "haypo_style.el")
(load "myfunction.el")
(load "cedetconfig.el")
(load "miscellaneous.el")
(load "auto-completeconfig.el")
(load "orgconfig.el")
(load "mycustom.el")
(load "auctexconfig.el")
(load "key.el")
(load "myhtml.el")
(load "anchored-transpose.el")
;; ;; (load "gebenconfig.el")
(load "yamlconfig")
(load "mymode.el")
(load "mypackage.el")
(load "mymacro.el")
(load "myw3m.el")
(load "diff_region.el")
(load "undo-tree-0.6.4.el")
(load "graphviz-dot-mode.el")
(load "mypylint.el")


;;(load "fullscreen.el") ;; non utilisé car sous awesome
;;(load "ecbconfig.el")

(provide 'myemacs.el)
;;; myemacs.el ends here