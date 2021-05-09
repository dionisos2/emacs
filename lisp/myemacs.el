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
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

(with-eval-after-load 'undo-tree (defun undo-tree-overridden-undo-bindings-p () nil))
(require 'undo-tree)
(global-undo-tree-mode)

;; (require 'behave-mode)
(require 'ivy)
(require 'counsel)
(require 'ivy-prescient)
(require 'magit)
(require 'find-dired)
(require 'thingatpt)
(require 'view)
(require 'recentf)
;;(require 'gtags)
(require 'php-mode)
(require 'web-mode)
(require 'langtool)
;; (require 'org-checklist)
(require 'french-holidays)
(require 'flycheck)

;; (require 'trash-settings.el)
(require 'spray)

(require 'company-statistics)
(require 'openwith)
(require 'dired-quick-sort)
(require 'yasnippet)
(require 'key-chord)
(require 'kmb)
(require 'wgrep)
(require 'multiple-cursors)
(require 'phi-search)

(load "miscellaneous.el")
(load "haypo_style.el")
;; (load "diff_region.el")

(load "my-langtool.el")
(load "my-autosaveconfig.el")
(load "my-function.el")
(load "my-org-mode.el")
(load "my-web-mode.el")

(load "my-flycheck.el")
(load "my-mode.el")
;; (load "my-trash.el")
(load "my-pylint.el")
(load "my-avy.el")
(load "my-custom.el")
(load "my-key.el")
(load "my-yasnippet.el")
(load "my-keychord.el")
(load "my-macro.el")

;; (load "anchored-transpose.el")
;; (load "beancount.el")
;; (load "myhabitrpg.el")
;; (load "fullscreen.el") ;; non utilisé car sous awesome
;; (load "ecbconfig.el")

(provide 'myemacs.el)
;;; myemacs.el ends here
