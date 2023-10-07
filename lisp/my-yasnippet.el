;;; my-yasnippet.el --- my way to configure yasnippet -*- lexical-binding: t -*-
;;; Commentary:
;;; A separate Lisp file for yasnippet, because it takes time to load.

;;; Code:

(use-package yasnippet
	:demand
	:ensure
	:bind (
				 ("C-p C-y" . yas-new-snippet)
				 ("C-p y" . yas-visit-snippet-file)
				 :map yas-minor-mode-map
				 ("<tab>" . nil)
				 ("TAB" . nil)
				 ("M-f" . yas-expand-from-trigger-key)
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
	(yas-snippet-dirs `(,(concat user-emacs-directory "snippets/private-snippets") ,(concat user-emacs-directory "snippets/yasnippet-snippets/snippets") ,(concat user-emacs-directory "snippets/my-snippets")))
	)

(provide 'my-yasnippet)
;;; my-yasnippet.el ends here
