;;; my-programming.el --- Everything to help programming  -*- lexical-binding: t -*-
;;; Commentary:
;;; Nothing special.

;;; Code:

(use-package flycheck
	:ensure
	:demand
	:custom
	(flycheck-emacs-lisp-load-path '("/home/dionisos/.config/emacs.new"))
	(global-flycheck-mode t)
	)

(use-package python
	:custom
	;; (python-indent-guess-indent-offset t)
	(python-indent-offset 4)
	(python-indent-trigger-commands '(indent-for-tab-command yas-expand))
	(python-shell-interpreter "python")
	(python-shell-interpreter-args "")
	(python-shell-virtualenv-root "/home/dionisos/.emacs.d/elpy/rpc-venv")
	)

(use-package realgud
	:ensure
	:custom
	(realgud:pdb-command-name "python -m pdb")
	)

(use-package haskell-mode
	:ensure
	)

(use-package lsp-mode
	:ensure
  :init
  (setq lsp-keymap-prefix "C-c l") ;; lsp-keymap-prefix is mostly for documentation of which-key integration only.
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (julia-mode-hook . lsp)
         (lsp-mode-hook . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
)


(use-package lsp-ui
	:ensure
	:commands lsp-ui-mode
	)

(use-package julia-repl
	:ensure
	)

;; (use-package eglot-jl
;;   :ensure t
;;   :defer  t)

(use-package julia-mode
  :ensure t
	:bind (
				 :map julia-mode-map
							("C-p e" . julia-repl-send-region-or-line)
							("C-p C-e" . julia-repl-send-buffer)
				 )
	)


;; ;; key bindings are arbitrary, ignore if you are ok with the defaults


;; this caused a timeout error with the default settings
;; (setq eglot-connect-timeout 300)

;; see Julia manual for the detailed description of this var
;; (setenv "JULIA_NUM_THREADS" "4")


(use-package dap-mode
	:ensure
)

(load "lsp-julia.el")

(setq lsp-julia-default-environment "~/.julia/environments/v1.7")

;; (use-package lsp-julia
;; 	:ensure
;;   :config
;;   (setq lsp-julia-default-environment "~/.julia/environments/v1.7")
;; 	)

;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration

(provide 'my-programming)
;;; my-programming.el ends here
