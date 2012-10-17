(setq auto-mode-alist(append '(("\\.h$" . c++-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("SConstruct" . python-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("SConscript" . python-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("CMake*" . cmake-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("\\.cmake$" . cmake-mode)) auto-mode-alist))
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(setq auto-mode-alist(append '(("\\.php$" . nxhtml-mumamo-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("\\.tpl$" . nxhtml-mumamo-mode)) auto-mode-alist))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(setq c-default-style '((c-mode . "haypo") (c++-mode . "haypo")))


(define-minor-mode c++-my-mode
  "quelques configurations personnelles pour le c++"
  :lighter " c++-my-mode"
  (if c++-my-mode
			(progn
				(gtags-mode 1)
				(auto-complete-mode 1)
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
				(auto-complete-mode 1)
				(local-unset-key "\C-c\C-s")
				(with-current-buffer (current-buffer) (setq compile-command (concatenate 'string "latex " (buffer-file-name))))
				(with-current-buffer (current-buffer) (setq execute-command (concatenate 'string "xdvi " (replace-extention buffer-file-name ".dvi")))))))


(add-hook 'cmake-mode-hook
					(lambda ()(auto-complete-mode 1)))

(add-hook 'LaTeX-mode-hook
					(lambda ()(latex-my-mode 1)))

(add-hook 'emacs-lisp-mode-hook
					(lambda ()(gtags-mode 1)
										 (auto-complete-mode 1)
										 (srecode-minor-mode 1)))

(add-hook 'conf-space-mode-hook
					(lambda ()(gtags-mode 1)
										 (auto-complete-mode 1)))

(add-hook 'c-mode-hook
					(lambda () (c++-my-mode 1)
											(auto-complete-mode 1)
											(srecode-minor-mode 1)))

(add-hook 'c++-mode-hook
					(lambda () (c++-my-mode 1)
											(auto-complete-mode 1)
											(srecode-minor-mode 1)))

(add-hook 'python-mode-hook
					(lambda () (local-unset-key "\C-c\r")
						(local-unset-key "\C-c\C-c")
						(auto-complete-mode 1)))

(add-hook 'LaTeX-mode-hook
					(lambda () (local-unset-key (kbd "C-M-e"))
											(auto-complete-mode 1)
											(srecode-minor-mode 1)))

(add-hook 'dired-mode-hook
					(lambda () (local-unset-key (kbd "C-o"))
											(auto-complete-mode 1)))

(add-hook 'php-mode-hook
					(lambda () (local-unset-key (kbd "C-."))
											(local-unset-key "\C-c\C-u")
											(auto-complete-mode 1)))

(add-hook 'fundamental-mode-hook
					(lambda () (auto-complete-mode 1)
											(srecode-minor-mode 1)))

(add-hook 'org-mode-hook
					(lambda () (auto-complete-mode 1)))

