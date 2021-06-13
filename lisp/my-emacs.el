;;; my-emacs.el --- main entry point to dionisos emacs config  -*- lexical-binding: t -*-
;;; Commentary:
;;; Nothing special.

;;; Code:

;; Everything that should load without packages
(load "my-basics.el")
(load "my-basics-keybindings.el")

;; A place to save named macro.
(load "my-macro.el")


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

;;; I install everything from melpa, but if there are some problems I can try this.
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)
(require 'use-package)
;;; Automatic add of hook suffix is uselessly confuging
(setq use-package-hook-name-suffix nil)

(load "my-common.el")
(load "my-writing.el")
(load "my-programming.el")
(load "my-functions.el")


(provide 'my-emacs)
;;; my-emacs.el ends here
