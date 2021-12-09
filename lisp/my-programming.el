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

(use-package julia-mode
	:ensure
)

(use-package haskell-mode
	:ensure
)

(provide 'my-programming)
;;; my-programming.el ends here
