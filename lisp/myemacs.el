;;; myemacs.el --- global configuration file for emacs
;;; Commentary:
;; a mettre dans le fichier .emacs
;; (add-to-list 'load-path "~/.emacs.el")
;; (load "myemacs.el")

;;------------------load elisp file--------------------

;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/diff_region")


;;f5 pour un acces rapide aux fichiers, voir key.el pour tout les autres raccourcie clavier.
;;../README.org
;;../template/

(load "mypackage.el")

(elpy-enable)
(require 'behave-mode)
(require 'magit)
(require 'helm-config)
(helm-mode 1)

(load "langtoolconfig.el")
(load "autosaveconfig.el")
(load "haypo_style.el")
(load "myfunction.el")
(load "cedetconfig.el")
(load "miscellaneous.el")
;; (load "myauto-complete.el")
(load "orgconfig.el")
(load "mycustom.el")
;; (load "auctexconfig.el")
;; (load "myhtml.el")
(load "mywebmode.el")
;; (load "anchored-transpose.el")
;; ;; (load "gebenconfig.el")
(load "yamlconfig")
(load "myflycheck.el")
(load "mymode.el")
(load "mytrash.el")
(load "mymacro.el")
;; (load "myw3m.el")
(load "diff_region.el")
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(load "mypylint.el")
(load "myspray.el")
(load "beancount.el")
(load "myace-jump.el")
(load "mypdf-tool.el")
(load "myhelm-dash.el")
(load "myein.el")
(load "key.el")

;; (load "myhabitrpg.el")
;;(load "fullscreen.el") ;; non utilisé car sous awesome
;;(load "ecbconfig.el")

(provide 'myemacs.el)
;;; myemacs.el ends here
