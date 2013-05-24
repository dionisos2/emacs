(setq auto-mode-alist(append '(("\\.h$" . c++-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("SConstruct" . python-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("SConscript" . python-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("CMake*" . cmake-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("\\.cmake$" . cmake-mode)) auto-mode-alist))
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(setq auto-mode-alist(append '(("\\.php$" . php-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("\\.tpl$" . nxhtml-mumamo-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("\\.twig$" . web-mode)) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(setq c-default-style '((c-mode . "haypo") (c++-mode . "haypo")))


(define-minor-mode auto-complete-my-mode
  "commentaire obligatoire /!\\"
  :lighter " auto-complete-my-mode"
  (if auto-complete-my-mode
	  (progn
		(auto-complete-mode 1)			  
		(local-set-key [backtab] 'ac-previous)
		(local-set-key [C-tab] 'ac-expand) 
		(local-set-key [M-tab] 'ac-expand)
		)))

(define-minor-mode c++-my-mode
  "quelques configurations personnelles pour le c++"
  :lighter " c++-my-mode"
  (if c++-my-mode
			(progn
				(gtags-mode 1)
				(local-unset-key "\C-c\C-c")
				(local-unset-key (kbd "C-M-e"))
				(setq compile-command "scons")
				(setq execute-command "./game&"))))


(define-minor-mode latex-my-mode
  "quelques configurations personnelles pour le latex"
  :lighter " latex-my-mode"
  (if latex-my-mode
			(progn
				(gtags-mode 1)
				(auto-complete-my-mode 1)
				(local-unset-key "\C-c\C-s")
				(with-current-buffer (current-buffer) (setq compile-command (concatenate 'string "latex " (buffer-file-name))))
				(with-current-buffer (current-buffer) (setq execute-command (concatenate 'string "xdvi " (replace-extention buffer-file-name ".dvi")))))))



(define-minor-mode pdf-my-mode
	:lighter "pdf-my-mode"
	(if pdf-my-mode
			(progn
				(local-unset-key "\C-t")
				(local-unset-key "n")
				(local-unset-key "p")
				(local-set-key (kbd "<C-right>") 'doc-view-next-page)
				(local-set-key (kbd "<C-left>") 'doc-view-previous-page))))


(add-hook 'geben-mode-hook
		  (lambda ()
			(define-key geben-mode-map "v" 'geben-eval-current-word)
			))

(add-hook 'cmake-mode-hook
					(lambda ()(auto-complete-my-mode 1)
						))

(add-hook 'LaTeX-mode-hook
					(lambda ()(latex-my-mode 1)))

(add-hook 'emacs-lisp-mode-hook
					(lambda ()(gtags-mode 1)
					  (auto-complete-my-mode 1)
										;(srecode-minor-mode 1)
					  ))

(add-hook 'conf-space-mode-hook
					(lambda ()(gtags-mode 1)
										 (auto-complete-my-mode 1)
						))

(add-hook 'c-mode-hook
					(lambda () (c++-my-mode 1)
											(auto-complete-my-mode 1)
											;(srecode-minor-mode 1)
						))

(add-hook 'c++-mode-hook
					(lambda () (c++-my-mode 1)
											(auto-complete-my-mode 1)
											;(srecode-minor-mode 1)
						))

(add-hook 'python-mode-hook
					(lambda () (local-unset-key "\C-c\r")
						(local-unset-key "\C-c\C-c")
						(auto-complete-my-mode 1)
						))

(add-hook 'LaTeX-mode-hook
					(lambda () (local-unset-key (kbd "C-M-e"))
											(auto-complete-my-mode 1)
											;(srecode-minor-mode 1)
						))

(add-hook 'dired-mode-hook
					(lambda () (local-unset-key (kbd "C-o"))
											(auto-complete-my-mode 1)
						))

(add-hook 'php-mode-hook
					(lambda () (local-unset-key (kbd "C-."))
					  (local-unset-key "\C-c\C-u")
					  (auto-complete-my-mode 1)
					  ))

(add-hook 'fundamental-mode-hook
		  (lambda () 
			(auto-complete-my-mode 1)
										;(srecode-minor-mode 1)
			))

(add-hook 'org-mode-hook
		  (lambda () 
			;; (auto-complete-my-mode 1)
			(local-unset-key "\C-y")
			(local-set-key "\C-c\M-d" 'outline-up-heading)
			(local-set-key "M-down" 'outline-next-visible-heading)))

(add-hook 'doc-view-mode
					(lambda () (pdf-my-mode 1)))
