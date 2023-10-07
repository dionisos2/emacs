;;; my-programming.el --- Everything to help programming	-*- lexical-binding: t -*-
;;; Commentary:
;;; Nothing special.

;;; Code:

(setq custom-tab-width 2)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs	()
	(local-set-key (kbd "TAB") 'indent-for-tab-command)
	(setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

(add-hook 'prog-mode-hook 'enable-tabs)
(add-hook 'lisp-mode-hook 'enable-tabs)
(add-hook 'emacs-lisp-mode-hook 'enable-tabs)

(use-package php-mode
	:ensure
  )

(use-package highlight-indent-guides
	:ensure
	:demand
	:config
	(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
	(setq highlight-indent-guides-method 'column)
  (setq highlight-indent-guides-auto-enabled nil)

  (set-face-background 'highlight-indent-guides-odd-face "white")
  (set-face-background 'highlight-indent-guides-even-face "green")
  (set-face-foreground 'highlight-indent-guides-character-face "blue")
  )

(use-package smart-tabs-mode
	:ensure
	:demand
	:config
	(smart-tabs-insinuate 'c 'c++ 'javascript 'python)
  )

(use-package flycheck
  :ensure
	:demand
	:custom
	(flycheck-emacs-lisp-load-path 'inherit)
	(global-flycheck-mode t)
	)

(use-package cc-mode
	:bind (
				 ("C-d" . avy-goto-word-0)
				 ("C-M-d" . avy-goto-char)
				 :map c-mode-map
				 ("C-d" . avy-goto-word-0)
				 ("C-M-d" . avy-goto-char)
				 :map c++-mode-map
				 ("C-d" . avy-goto-word-0)
				 ("C-M-d" . avy-goto-char)
				 )
  )



(use-package lsp-mode
	:ensure
	:init
	(setq lsp-keymap-prefix "C-c l") ;; lsp-keymap-prefix is mostly for documentation of which-key integration only.
	:hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
				 (julia-mode-hook . lsp)
				 (lsp-mode-hook . lsp-enable-which-key-integration)
				 (lsp-mode-hook . (lambda() (lsp-headerline-breadcrumb-mode 1)))
				 )
	:commands lsp
	:config
	(define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
	)

(setq read-process-output-max (* 1024 1024))

 ;; (eval-after-load 'lsp-mode
 ;;   '(progn
 ;;      (require 'lsp-javascript)
 ;;      (lsp-dependency 'typescript-language-server '(:system ,"/home/dionisos/.npm/packages/bin/typescript-language-server"))
 ;;      (lsp-dependency 'typescript '(:system ,"/home/dionisos/.npm/packages/bin/tsc"))
 ;; 			(lsp-dependency 'javascript-typescript-langserver '(:system ,"/home/dionisos/.npm/packages/bin/javascript-typescript-langserver"))
 ;; 			)
 ;; 	 )

(use-package lsp-haskell
	:ensure
	:demand
	:hook (
				 (haskell-mode-hook . lsp)
				 (haskell-literate-mode-hook . lsp)
				 )
	:custom
	(lsp-haskell-server-path "/home/dionisos/.ghcup/bin/haskell-language-server-wrapper")
	)

;; where tls-exe is the absolute path to the typescript-language-server
;; executable and ts-js is the absolute path to the typescript compiler
;; JavaScript file, tsserver.js (the *.js is required for Windows).
(use-package lsp-pyright
	:ensure t
	:hook (python-mode . (lambda ()
												 (require 'lsp-pyright)
												 (lsp))))	; or lsp-deferred


(use-package dap-mode
	:ensure
	)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(use-package lsp-ui
	:ensure
	:commands lsp-ui-mode
	)

;; (use-package csharp-mode
;; 	:ensure
;;   )

(use-package python
	:custom
	(python-indent-guess-indent-offset nil)
	(python-indent-offset 2)
	;; (python-indent-trigger-commands '(indent-for-tab-command yas-expand))
  (python-indent-trigger-commands '(indent-for-tab-command))
	(python-shell-interpreter "python")
	(python-shell-interpreter-args "")
	(python-shell-virtualenv-root (concat user-emacs-directory "elpy/rpc-venv"))

	:bind (
				 :map python-mode-map
				 ("C-p e" . my-python-eval-region)
				 ("C-p C-e" . my-python-eval-buffer)
				 )
	)

;; (use-package realgud
;; 	:ensure
;; 	:custom
;; 	(realgud:pdb-command-name "python -m pdb")
;; 	)

(use-package haskell-mode
	:ensure
	
	)

(use-package julia-repl
	:ensure
	)

(use-package julia-mode
	:ensure t
	:bind (
				 :map julia-mode-map
				 ("C-p e" . my-julia-eval-region)
				 ("C-p C-e" . my-julia-eval-buffer)
				 )
	:config
	(setq lsp-julia-default-environment "~/.julia/environments/v1.8/")
	(load "lsp-julia.el")
	)

(use-package js2-mode
	:ensure t
	:mode ("\\.js\\'")
	)

;; (use-package skewer-mode
;;    :ensure t
;;    :init (add-hook 'js2-mode-hook 'skewer-mode))

(use-package nodejs-repl
	:ensure t
	:bind (
				 :map js2-mode-map
				 ("C-p e" . nodejs-repl-send-region)
				 ("C-p C-e" . nodejs-repl-send-buffer)
				 )
	)

(use-package add-node-modules-path
	:ensure t
  :defer t
  :hook (((js2-mode) . add-node-modules-path))
	)

(use-package geiser
	:ensure
	:demand
	)

(use-package geiser-repl
	:bind (
				 :map geiser-repl-mode-map
							("<up>" . comint-previous-matching-input-from-input)
							("<down>" . comint-next-matching-input-from-input)
							("C-r" . comint-previous-matching-input)
							("C-d" . nil)
							("C-." . nil)
							)
	:custom
	(geiser-repl-history-filename (concat user-emacs-directory "private/geiser-history"))
	(geiser-repl-use-other-window nil)
	)

(use-package geiser-mode
	:bind (
				 :map geiser-mode-map
							("C-d" . nil)
							("C-." . nil)
							)
	)

(use-package geiser-guile
	:ensure
	:demand
	:custom
	(geiser-guile-load-init-file t)
	;; (geiser-guile-load-path "")
	)

(use-package paredit
	:ensure
	:demand
	)

(provide 'my-programming)
;;; my-programming.el ends here
