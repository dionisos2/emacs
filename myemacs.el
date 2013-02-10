;; a mettre dans le fichier .emacs
;; (add-to-list 'load-path "~/.emacs.el")
;; (load "myemacs.el")

;;------------------load elisp file--------------------

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/cedet-1.1")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m")

(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
(load-file "~/.emacs.d/cedet-1.1/srecode/srecode.el")
(load-file "~/.emacs.d/cedet-1.1/semantic/semantic.el")
(load-file "~/.emacs.d/php-mode/php-mode.el")
(load-file "~/.emacs.d/web-mode/web-mode.el")


;;f5 pour un acces rapide aux fichiers, voir key.el pour tout les autres raccourcie clavier.
;;./README
;;./template/
;;./TODOS.org

(autoload 'magit-status "magit" nil t)
(load "langtoolconfig.el")
(load "autosaveconfig.el")
(load "haypo_style.el")
(load "myfunction.el")
(load "cedetconfig.el")
(load "miscellaneous.el")
(load "auto-completeconfig.el")
(load "mycustom.el")
(load "auctexconfig.el")
(load "key.el")
;(load "myhtml.el")
(load "anchored-transpose.el")
(load "gebenconfig.el")
(load "mymode.el")
(load "mypackage.el")
(load "mymacro.el")
(load "myw3m.el")


;;(load "fullscreen.el") ;; non utilisé car sous awesome
;;(load "ecbconfig.el")
;;(load "w3.el")
