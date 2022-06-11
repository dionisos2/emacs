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
(customize-set-variable 'use-package-hook-name-suffix nil)

;;; Choose theme here, to avoid blink at eval in my-common.el
(use-package abyss-theme
	:ensure
	:demand
	:custom
	(custom-safe-themes '("3d4df186126c347e002c8366d32016948068d2e9198c496093a96775cc3b3eaa" default))
	:config
	(load-theme 'abyss)
	)
;; (unless (display-graphic-p)
;;		(disable-theme 'abyss)
;;		(load-theme 'tango-dark)
;;		)

;; Seem like abyss-theme activate ido-mode, this is very weird

(load "my-common.el")
(load "my-yasnippet.el")
(load "my-writing.el")
(load "my-programming.el")
(load "my-functions.el")


(provide 'my-emacs)
;;; my-emacs.el ends here
