;;; myemacs.el --- global configuration file for emacs
;;; Commentary:
;; a mettre dans le fichier .emacs
;; (add-to-list 'load-path "~/.emacs.el")
;; (load "myemacs.el")
;; ../README.org

;;------------------load elisp file--------------------

;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'behave-mode)
(require 'magit)
(require 'helm)
(require 'helm-config)
(require 'find-dired)
(require 'thingatpt)
(require 'view)
(require 'recentf)
(require 'gtags)
(require 'php-mode)
(require 'web-mode)
(require 'langtool)
(require 'org-checklist)
(require 'french-holidays)
(require 'flycheck)
(require 'trash-settings.el)
(require 'spray)
(require 'undo-tree)
(require 'company-statistics)

(load "miscellaneous.el")
(load "haypo_style.el")
(load "diff_region.el")

(load "my-langtool.el")
(load "my-autosaveconfig.el")
(load "my-function.el")
(load "my-org-mode.el")
(load "my-web-mode.el")

(load "my-flycheck.el")
(load "my-mode.el")
(load "my-trash.el")
(load "my-pylint.el")
(load "my-ace-jump.el")
(load "my-custom.el")
(load "my-key.el")

;; (load "anchored-transpose.el")
;; (load "beancount.el")
;; (load "myhabitrpg.el")
;; (load "fullscreen.el") ;; non utilisé car sous awesome
;; (load "ecbconfig.el")

(provide 'myemacs.el)
;;; myemacs.el ends here
