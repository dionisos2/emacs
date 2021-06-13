;;; my-common.el --- stuffs that I use everywhere  -*- lexical-binding: t -*-
;;; Commentary:
;;; Nothing special.

;;; Code:
(require 'use-package)

(customize-set-variable 'printer-name "EPSON_WF-2750") ;; House
(customize-set-variable 'custom-safe-themes '("3d4df186126c347e002c8366d32016948068d2e9198c496093a96775cc3b3eaa" default))
(load-theme 'abyss)


(use-package use-package-chords
  :ensure t
	:demand
  :config
	(key-chord-mode 1)
	:custom
	(key-chord-two-keys-delay 0.05)
	(key-chord-one-key-delay 0.10)
)

(use-package org
	:config
	(electric-indent-local-mode -1)
	:custom
	(org-agenda-files '("~/organisation/agenda.org" "~/organisation/birthdays.org"))
)

(use-package org-roam
	:ensure
	:custom
	(org-roam-directory "~/projets/R&D/org_roam/")
	)


(use-package undo-tree
	:ensure
  :demand
	:init
	(defun undo-tree-overridden-undo-bindings-p () nil);; To fix some bug
  :bind (
				 ("C-é" . undo-tree-undo)
				 ("C-É" . undo-tree-redo)
				 ("C-M-é" . undo-tree-visualize)
				 )
  :config
	(global-undo-tree-mode 1)
)

(use-package avy
	:ensure
	:demand
	:bind (
				 ("C-d" . avy-goto-word-0)
				 ("C-M-d" . avy-goto-char)
				 )
)

(use-package magit
	:ensure
	:bind (
				 ("C-p m" . magit-status)
				 )
)

(use-package openwith
	:ensure
	:custom
	(openwith-associations '((".pdf" "evince" (file)) (".docx" "libreoffice" (file))))
	(openwith-mode t)
)

(use-package yasnippet
	:ensure
	:bind (
				 :map yas-minor-mode-map
							("<tab>" . nil)
							("C-M-f" . yas-expand-from-trigger-key))
	:chords (
					 ("ae" . yas-insert-snippet)
					 )
	:config
	(yas-global-mode 1)
	(yas-reload-all)
	:custom
	(yas-indent-line 'fixed)
	;; (yas-snippet-dirs '("/home/dionisos/.emacs.d/snippets/snippets" "/home/dionisos/.emacs.d/elpa/elpy-20210328.1852/snippets/"))
)

(use-package wgrep
	:ensure
)

(use-package multiple-cursors
	:ensure
)

(use-package phi-search
	:ensure
)

(use-package ranger
	:ensure
	:custom
	(ranger-cleanup-eagerly t)
	(ranger-excluded-extensions '("mkv" "iso" "mp4" "bin" "exe" "msi"))
	(ranger-format-regexp '("^\\.?#\\|^\\.$\\|^\\.\\.$"))
	(ranger-override-dired 'ranger)
	(ranger-override-dired-mode t)
	(ranger-return-to-ranger t)
	(ranger-show-hidden 'hidden)
	(ranger-show-literal nil)
	(ranger-width-preview 0.5)
)

(use-package image-mode
	:mode "\\.svg$"
	)

(use-package winner
	:ensure
	:demand
	:bind (
				 :map winner-mode-map
							("C-c <left>" . nil)
							("C-c <right>" . nil)
							)
	:custom
	(winner-mode t)
)

(use-package all-the-icons
	:demand
)

(use-package all-the-icons-dired
	:demand
	:ensure
	:after (all-the-icons)
	:hook (dired-mode-hook . all-the-icons-dired-mode)
	)

(use-package markdown-mode
	:ensure
	:bind (
				 :map markdown-mode-map
							("C-p C-t" . markdown-preview)
							)
	)

(use-package hydra
	:ensure
	:demand
  :config
	(defhydra hydra-zoom (global-map "C-t")
		"winner"
		("<left>" winner-undo)
		("<right>" winner-redo)
		)
	)

(use-package abbrev
  :hook
  ((text-mode prog-mode erc-mode LaTeX-mode) . abbrev-mode)
  :config
  (if (file-exists-p abbrev-file-name)
      (quietly-read-abbrev-file))
)

(use-package company
	:ensure
	:config
	(setcdr company-active-map  nil) ;; I don’t want any keybinding.
	:bind (
				 :map company-active-map
							("C-g" . company-abort)
							("C-h c" . company-show-location)
							)
	:custom
	(global-company-mode t)
	(company-continue-commands t)
	(company-idle-delay 0.2)
	(company-show-numbers t)
	)


(use-package company-dabbrev
	:after (company)
	:custom
	(company-dabbrev-char-regexp "\\(\\sw\\|[-$_]\\)")
	(company-dabbrev-downcase nil)
	(company-dabbrev-ignore-case nil)
	(company-dabbrev-minimum-length 3)
)

(use-package company-statistics
	:after (company)
	:custom
	(company-statistics-mode t)
)

(use-package company-quickhelp
	:ensure
	:after (company)
	:custom
	(company-quickhelp-mode t)
)

(use-package kiwix
	:ensure
	:custom
	(kiwix-default-browser-function 'w3m-browse-url)
	(kiwix-default-data-dir "/home/dionisos/.local/share/kiwix/")
	(kiwix-default-library-dir "/home/dionisos/.local/share/kiwix/")
	(kiwix-server-port 8080)
)

(use-package proced
	:ensure
	:custom
	(proced-auto-update-flag t)
	(proced-auto-update-interval 1)
)

(use-package w3m
	:ensure
	:custom
	(w3m-default-display-inline-images t)
)

(use-package which-key
	:ensure
	:demand
	:custom
	(which-key-frame-max-height 100)
	(which-key-idle-delay 0.2)
	(which-key-mode t)
	(which-key-paging-prefixes '("C-c"))
)

(use-package selectrum
	:ensure
	:demand
	:custom
	(selectrum-mode 1)
)

(provide 'my-common)
;;; my-common.el ends here
