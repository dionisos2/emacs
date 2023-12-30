;;; my-yasnippet.el --- my way to configure yasnippet -*- lexical-binding: t -*-
;;; Commentary:
;;; A separate Lisp file for yasnippet, because it takes time to load.

;;; Code:

(use-package yasnippet-snippets
	:demand
	:ensure
	)

(use-package yasnippet
	:demand
	:ensure
	:bind (
				 ("C-<tab>" . yas-insert-snippet)
				 ("C-p C-y" . yas-new-snippet)
				 ("C-p y" . yas-visit-snippet-file)
				 :map yas-minor-mode-map
				 ("<tab>" . nil)
				 ("TAB" . nil)
				 ("M-f" . yas-expand-from-trigger-key)
				 :map yas-keymap
				 ("<tab>" . yas-next-field)
				 ("C-g" . yas-exit-snippet)
				 )
	:chords (
					 ("ae" . yas-insert-snippet)
					 )
	:config
	(yas-global-mode 1)
	(yas-reload-all)
	;; (add-to-list 'warning-suppress-types '(yasnippet backquote-change))
	:custom
	(yas-indent-line 'fixed)
	(yas-snippet-dirs `(,(concat user-emacs-directory "snippets/private-snippets")
											,(concat user-emacs-directory "snippets/my-snippets")
											,yasnippet-snippets-dir))
	)

(provide 'my-yasnippet)
;;; my-yasnippet.el ends here
