;;; my-programming.el --- Everything to help programming	-*- lexical-binding: t -*-
;;; Commentary:
;;; Nothing special.

;;; Code:

(defvar custom-tab-width 2)

(use-package rustic
  :ensure t
  :config
  (setq rustic-format-on-save nil)
  :custom
  (rustic-cargo-use-last-stored-arguments t))


(defun my-disable-tabs ()
	"Disable \"indent-tabs-mode\"."
	(setq indent-tabs-mode nil))

(defun my-enable-tabs ()
	"Enable \"indent-tabs-mode\"."
	(interactive)
	(local-set-key (kbd "TAB") 'indent-for-tab-command)
	(setq indent-tabs-mode t)
  (setq tab-width custom-tab-width)
	(setq sh-basic-offset tab-width)
	(setq smie-indent-basic tab-width)
	)


(use-package sh-script
	:hook
	(prog-mode-hook . my-enable-tabs)
	)

(use-package prog-mode
	:hook
	(prog-mode-hook . my-enable-tabs)
	)

(use-package lisp-mode
	:hook
	(lisp-mode-hook . my-enable-tabs)
	)

(use-package elisp-mode
	:hook
	(emacs-lisp-mode-hook . my-enable-tabs)
	)

(use-package term
	:bind (
				 :map term-raw-map
							("C-t" . nil)
							("C-t C-f" . find-file)
				 )
	)

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


;; Bugged for the moment
;; (use-package smart-tabs-mode
;; 	:ensure
;; 	:demand
;; 	:config
;; 	(smart-tabs-insinuate 'c 'c++ 'javascript 'python)
;;   )

(use-package flycheck
  :ensure
	:demand
	:custom
	(flycheck-emacs-lisp-load-path 'inherit)
	(global-flycheck-mode t)
	(indent-tabs-mode t)
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
												 (lsp)))
	)	; or lsp-deferred


;; (use-package dap-mode
;; 	:ensure
;; 	)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(use-package lsp-ui
	:ensure
	:commands lsp-ui-mode
	)

;; (use-package csharp-mode
;; 	:ensure
;;   )

(use-package python
	:ensure
	:custom
	(python-indent-guess-indent-offset nil)
	(python-indent-offset 2)
	;; (python-indent-trigger-commands '(indent-for-tab-command yas-expand))
  (python-indent-trigger-commands '(indent-for-tab-command))
	(python-shell-interpreter "python3")
	(python-shell-interpreter-args "")
	(python-shell-virtualenv-root (concat user-emacs-directory "elpy/rpc-venv"))

	:bind (
				 :map python-mode-map
				 ("C-p e" . my-python-eval-region)
				 ("C-p C-e" . my-python-eval-buffer)
				 ("C-c C-t" . transpose-mark)
				 )

	:hook
	(python-mode-hook . my-enable-tabs)
	)

;; (use-package company-jedi
;; 	:ensure
;; 	:demand
;; 	:custom
;; 	(jedi:server-command '("python3" "/home/dionisos/.config/emacs/elpa/jedi-core-20210503.1315/jediepcserver.py"))
;; )

;; (use-package realgud
;; 	:ensure
;; 	:custom
;; 	(realgud:pdb-command-name "python -m pdb")
;; 	)

(use-package haskell-mode
	:ensure t
	)

(use-package julia-repl
	:ensure t
	:bind (
				:map julia-repl-mode-map
				("C-t C-f" . find-file)
				)
	)

(use-package julia-mode
	:ensure t
	:bind (
				 :map julia-mode-map
				 ("C-p e" . my-julia-eval-region)
				 ("C-p C-e" . my-julia-eval-buffer)
				 )
	:custom
	(julia-indent-offset 2)

	)

(use-package lsp-julia
	:custom
	(lsp-julia-format-indent 2)
	:custom
	(lsp-julia-default-environment "~/.julia/environments/v1.11/")
	(lsp-julia-flags '("--project=/home/dionisos/.config/emacs/lisp/languageserver"
										 "--startup-file=no" "--history-file=no"))
 ;; 	(lsp-julia-flags '("--project=/home/dionisos/.config/emacs/lisp/languageserver"
 ;; "--startup-file=no" "--history-file=no -J /home/dionisos/logiciels/languageserver.so"))
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


(if (file-directory-p "/var/guix")
		(progn
			(use-package geiser
				:ensure nil
				)

			(use-package geiser-repl
				:ensure nil
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
				:ensure nil
				:bind (
							 :map geiser-mode-map
							 ("C-d" . nil)
							 ("C-." . nil)
							 ("C-p C-e" . geiser-load-current-buffer)
							 ("C-p e" . geiser-eval-region)
							 )
				)

			(use-package geiser-guile
				:ensure nil
				:custom
				(geiser-guile-load-init-file t)
				(geiser-guile-load-path '("/home/dionisos/.config/guix/current/share/guile/site/3.0/"))
				)

			(use-package guix
				:ensure nil
				)
			)
	)

;; (with-eval-after-load 'geiser-guile
;;   (add-to-list 'geiser-guile-load-path "/home/dionisos/.config/guix/"))

(use-package paredit
	:ensure
	:demand
	)

(use-package systemd
	:ensure
	:demand
	)

(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :ensure t
	:bind
	(
	 ("C-M-<tab>" . 'hydra-copilot/body)
	 )
	:custom
	(copilot-idle-delay nil)
	:config
	(defhydra hydra-copilot (:pre (copilot-complete))
		"copilot"
		("f" copilot-accept-completion "copilot-accept-completion" :exit t)
		("r" copilot-next-completion "copilot-next-completion")
		("t" copilot-previous-completion "copilot-previous-completion")
		("l" copilot-accept-completion-by-line "copilot-accept-completion-by-line")
		("w" copilot-accept-completion-by-word "copilot-accept-completion-by-word")
		("q" nil "Quit hydra")
		)
	)


(use-package copilot-chat
	:ensure t
	:bind
	(
	 ("C-p C-i" . 'hydra-copilot-chat/body)
	 )
	:config
	(defhydra hydra-copilot-chat (:color pink :hint nil)
  "
Copilot Chat:
  _c_: chat        _a_: ask         _l_: list         _p_: custom prompt
  _e_: explain     _f_: fix         _o_: optimize     _t_: test
  _v_: review      _d_: doc         _m_: commit msg   _y_: yank
  _r_: yank-pop    _L_: load        _s_: save         _Q_: quotas
  _q_: quit
"
  ;; Chat & Questions
  ("c" copilot-chat "chat" :exit t)
  ("a" copilot-chat-ask-and-insert "ask" :exit t)
  ("l" copilot-chat-list "list" :exit t)
  ("p" copilot-chat-custom-prompt-selection "custom prompt" :exit t)
  ;; Actions
  ("e" copilot-chat-explain "explain" :exit t)
  ("f" copilot-chat-fix "fix" :exit t)
  ("o" copilot-chat-optimize "optimize" :exit t)
  ("t" copilot-chat-test "test" :exit t)
  ("v" copilot-chat-review "review" :exit t)
  ("d" copilot-chat-doc "doc" :exit t)
  ("m" copilot-chat-insert-commit-message "commit msg" :exit t)
  ;; Yank
  ("y" copilot-chat-yank "yank")
  ("r" copilot-chat-yank-pop "yank-pop")
	;; Save
  ("s" copilot-chat-save "save" :exit t)
	("L" copilot-chat-load "load" :exit t)
  ;; Infos
  ("Q" copilot-chat-quotas "quotas" :exit t)
  ;; Quit
  ("q" nil "quit"))


	)

(provide 'my-programming)
;;; my-programming.el ends here
