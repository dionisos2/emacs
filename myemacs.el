;; a mettre dans le fichier .emacs
;; (add-to-list 'load-path "~/.emacs.el")
;; (load "myemacs.el")

;;------------------load elisp file--------------------

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/nxhtml/")


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
;(load "auto-completeconfig.el")
(load "mycustom.el")
(load "auctexconfig.el")
(load "key.el")
(load "myhtml.el")
(load "anchored-transpose.el")
(load "mymode.el")

;;(load "fullscreen.el") ;; non utilisé car sous awesome
;;(load "ecbconfig.el")
;;(load "w3.el")
