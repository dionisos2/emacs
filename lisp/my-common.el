;;; my-common.el --- stuffs that I use everywhere  -*- lexical-binding: t -*-
;;; Commentary:
;;; Nothing special.

;;; Code:
(require 'use-package)

(customize-set-variable 'printer-name "EPSON_WF-2750") ;; House


(use-package xterm-color
	:ensure
	:demand
)

(use-package emacs-pager
	:demand
	:config
	(add-to-list 'auto-mode-alist '("\\.emacs-pager$" . emacs-pager-mode))
)

;(setq auto-mode-alist (delete '("\\.emacs-pager$" . text-mode) auto-mode-alist))

(use-package appt
	:bind (
				 ("C-p C-M-c" . appt-add)
				 )
	:custom
	(appt-message-warning-time 1)
	(appt-display-interval appt-message-warning-time)
	(appt-disp-window-function 'my-appt-notification)
	(appt-delete-window-function (lambda () t))
)

(use-package with-editor
	:ensure
	:demand
	:bind (
				 :map with-editor-mode-map
				 ("C-t C-s" . with-editor-finish)
				 ("C-t C-k" . with-editor-cancel)
				 )
)
(use-package org
	:demand
	:bind (
				 ("<f4>" . my-dwim-done)
				 :map org-mode-map
				 ("C-c h" . my-copy-heading-org)
				 :map org-agenda-mode-map
				 ("h" . my-copy-heading)
				 )
)

(use-package transpose-mark
	:ensure
	:demand
	:bind (
				 ("C-c C-t" . transpose-mark)
				 )
)

(use-package bind-key
	:bind (
				 :map override-global-map
							("C-h k" . describe-key)
							("C-M-x" . eval-expression)
							("M-x" . execute-extended-command)
							("C-t C-k" . my-kill-buffer)
							("C-t k" . my-kill-buffer-and-maybe-window)
							("C-t C-t" . switch-to-buffer)
							("C-t C-b" . bookmark-set)
							("C-t C-l" . bookmark-jump)
							("C-p C-s" . save-some-buffers)
							("C-p r" . revert-buffer)
							("C-p C-M-r" . my-revert-all-buffers)
							("C-p q" . my-kill-boring-buffer)
							("C-p C-q" . kill-matching-buffers)
							("C-p c" . org-timer-set-timer)
							("C-p C-c" . org-timer-start)
							("C-p M-c" . org-timer-stop)
							("C-p w" . org-agenda-list)
							("C-p C-w" . org-agenda)
							("C-c C-c" . comment-region)
							("C-c c" . uncomment-region)
				 )
	)

(use-package abyss-theme
	:ensure
	:demand
	:custom
	(custom-safe-themes '("3d4df186126c347e002c8366d32016948068d2e9198c496093a96775cc3b3eaa" default))
	:config
	(load-theme 'abyss)
	)


;; (unless (display-graphic-p)
;; 	(disable-theme 'abyss)
;; 	(load-theme 'tango-dark)
;;   )

;; Seem like abyss-theme activate ido-mode, this is very weird
(ido-mode -1)

(use-package use-package-chords
  :ensure
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
	:init
	(setq org-roam-v2-ack t)
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
	:custom
	(avy-keys '(?a ?u ?i ?e ?p ?o ?n ?r ?s ?t ?d ?v ?g ?x ?q))
)

(use-package magit
	:ensure
	:bind (
				 ("C-p m" . magit-status)
				 )
	:config
	(bind-key "q" '(lambda () "Completely quit magit." (interactive) (magit-mode-bury-buffer 16)) magit-status-mode-map)
)

(use-package openwith
	:ensure
	:custom
	(openwith-associations '((".pdf" "evince" (file)) (".docx" "libreoffice" (file))))
	(openwith-mode t)
)


(use-package yasnippet
	:demand
	:ensure
	:bind (
				 ("C-p C-y" . yas-new-snippet)
				 ("C-p y" . yas-visit-snippet-file)
				 :map yas-minor-mode-map
				 ("<tab>" . nil)
				 ("TAB" . nil)
				 ("C-M-f" . yas-expand-from-trigger-key)
				 :map yas-keymap
				 ("<tab>" . yas-next-field)
				 )
	:chords (
					 ("ae" . yas-insert-snippet)
					 )
	:config
	(yas-global-mode 1)
	(yas-reload-all)
	:custom
	(yas-indent-line 'fixed)
	(yas-snippet-dirs '("/home/dionisos/.emacs.d/snippets/private-snippets" "/home/dionisos/.emacs.d/snippets/yasnippet-snippets/snippets" "/home/dionisos/.emacs.d/snippets/my-snippets"))
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
	:ensure
	;; (all-the-icons-install-fonts t)
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
	:demand
  :hook
  ((text-mode-hook prog-mode-hook erc-mode-hook LaTeX-mode-hook org-mode-hook) . abbrev-mode)
  :config
  (if (file-exists-p abbrev-file-name)
      (quietly-read-abbrev-file))
)


(use-package company
	:ensure
	:demand
	:config
	(setcdr company-active-map  nil) ;; I don’t want any keybinding.
	(company-keymap--bind-quick-access company-active-map) ;; But still want M-0, M-1, etc shortcut.
	:bind (
				 :map company-active-map
							("C-g" . company-abort)
							("C-f" . company-complete)
							("C-n" . company-select-next-or-abort)
							("C-M-n" . company-select-previous-or-abort)
							("<down>" . company-select-next-or-abort)
							("<up>" . company-select-previous-or-abort)
							;; ("C-h c" . company-show-location)
							)
	:custom
	(global-company-mode t)
	(company-continue-commands t)
	(company-idle-delay 0.2)
	(company-show-numbers t)
	)

(use-package company-dabbrev
	:demand
	:after (company)
	:custom
	(company-dabbrev-char-regexp "\\(\\sw\\|[-$_]\\)")
	(company-dabbrev-downcase nil)
	(company-dabbrev-ignore-case nil)
	(company-dabbrev-minimum-length 3)
)

(use-package company-statistics
	:ensure
	:demand
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

(use-package proced
	:ensure
	:custom
	(proced-auto-update-flag t)
	(proced-auto-update-interval 1)
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


(use-package vertico
	:ensure
	:demand
  :init
  (vertico-mode)
  ;; (setq vertico-cycle t)
	:bind (
				 :map minibuffer-local-map
				 ("M-d" . previous-line)
				 ("M-s" . next-line)
				 :map vertico-map
				 ("C-f" . vertico-insert)
				 ("<return>" . vertico-directory-enter)
				 ("^" . vertico-directory-up)
				 )
  )

(use-package orderless
	:ensure
	:demand
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
	;; Enable richer annotations using the Marginalia package
	:ensure
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package consult
	:ensure
	:demand
  :bind (;; C-c bindings (mode-specific-map)
         ;; ("C-c h" . consult-history)
         ;; ("C-c m" . consult-mode-command)
         ("M-SPC" . consult-mark)
				 :map override-global-map
         ("C-t C-r" . consult-recent-file)
				 ("C-M-s" . consult-line)
         ("C-t C-l" . consult-bookmark)
         ;; ("C-c C-b" . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ;; ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-t C-t" . consult-buffer)

         ("C-t C-g" . consult-register-load)
         ("C-M-SPC" . consult-register-store)

         ("M-." . consult-yank-pop)                ;; orig. yank-pop
         ("<help> a" . consult-apropos)            ;; orig. apropos-command

         ;; ("M-g e" . consult-compile-error)
         ;; ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("C-c g" . consult-goto-line)             ;; orig. goto-line
         ;; ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ;; ("M-g i" . consult-imenu)
         ;; ("M-g I" . consult-project-imenu)

         ("C-p f" . consult-find)
         ("C-p l" . consult-locate)
         ;; ("M-s G" . consult-git-grep)
         ("C-p g" . consult-ripgrep)
         ;; ("M-s m" . consult-multi-occur)

         ;; Isearch integration
         :map isearch-mode-map
         ("M-e" . consult-isearch)
         :map minibuffer-local-map
         ("M-SPC" . vertico-next)
         ;; ("C-s" . isearch-forward)
				 )

  :init
  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0
        register-preview-function #'consult-register-format)

  (advice-add #'register-preview :override #'consult-register-window)
  (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

  ;; (setq xref-show-xrefs-function #'consult-xref
  ;;       xref-show-definitions-function #'consult-xref)


  :config
  (setq consult-preview-key 'any)
  (setq consult-narrow-key "<")

	(consult-customize
	 consult-ripgrep consult-git-grep consult-grep
	 consult-bookmark consult-recent-file consult-xref
	 consult--source-file consult--source-project-file consult--source-bookmark
	 consult-buffer
	 :preview-key (kbd "M-v"))

	:custom
	(consult-find-command "find . -ipath *ARG* OPTS")

  ;; Optionally configure a function which returns the project root directory.
  ;; There are multiple reasonable alternatives to chose from.
  ;;;; 1. project.el (project-roots)
  ;; (setq consult-project-root-function
  ;;       (lambda ()
  ;;         (when-let (project (project-current))
  ;;           (car (project-roots project)))))
  ;;;; 2. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-root-function #'projectile-project-root)
  ;;;; 3. vc.el (vc-root-dir)
  ;; (setq consult-project-root-function #'vc-root-dir)
  ;;;; 4. locate-dominating-file
  ;; (setq consult-project-root-function (lambda () (locate-dominating-file "." ".git")))
	)

(use-package embark
  :ensure

  :bind
  (("C-." . yank)
	 ("M-o" . embark-act)         ;; pick some comfortable binding
   ("C-M-o" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none))))
	(setq embark-action-indicator
				(lambda (map _target)
					(which-key--show-keymap "Embark" map nil nil 'no-paging)
					#'which-key--hide-popup-ignore-command)
				embark-become-indicator embark-action-indicator)
	)

(use-package embark-consult
  :ensure
  :after (embark consult)
  :demand
  :hook
  (embark-collect-mode-hook . consult-preview-at-point-mode)
	)

(use-package kiwix
	:ensure
	:custom
	(kiwix-default-browser-function 'w3m-browse-url)
	(kiwix-default-data-dir "/stockage/kiwix/data")
	(kiwix-default-library-dir "/stokage/kiwix/lib")
	(kiwix-server-port 8080)
)

(use-package w3m
	:ensure
	:custom
	(w3m-default-display-inline-images t)
)

(customize-set-variable 'explicit-shell-file-name "/usr/bin/xonsh")

(provide 'my-common)
;;; my-common.el ends here
