(setq auto-mode-alist(append '(("\\.h$" . c++-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("SConstruct" . python-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("SConscript" . python-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("CMake*" . cmake-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("\\.cmake$" . cmake-mode)) auto-mode-alist))
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
;; (setq auto-mode-alist(append '(("\\.php$" . php-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("\\.tpl$" . nxhtml-mumamo-mode)) auto-mode-alist))
(setq auto-mode-alist(append '(("\\.twig$" . web-mode)) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.svg$" . image-mode))
(add-to-list 'auto-mode-alist '("\\.feature$" . behave-mode))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(setq c-default-style '((c-mode . "haypo") (c++-mode . "haypo")))


(define-minor-mode w3m-my-mode
  "commentaire obligatoire /!\\"
  :lighter " w3m-my-mode"
  (if w3m-my-mode
	  (progn
		(local-set-key (kbd "M-t") 'backward-char)
		(local-set-key (kbd "M-d") 'previous-line)
		(local-set-key (kbd "M-r") 'forward-char)
		(local-set-key (kbd "M-s") 'next-line)
		(local-set-key (kbd "<down>") 'w3m-scroll-up)
		(local-set-key (kbd "<up>") 'w3m-scroll-down)
		(local-set-key (kbd "<left>") 'w3m-scroll-right)
		(local-set-key (kbd "<right>") 'w3m-scroll-left)
		(local-set-key "\C-t\C-f" 'w3m-find-file)
		(local-set-key (kbd "<M-left>") 'w3m-view-previous-page)
		(local-set-key (kbd "<M-right>") 'w3m-view-next-page)
		(local-set-key (kbd "M-f") 'w3m-lnum-goto)
		(local-set-key [C-return] 'w3m-view-this-url-new-session)
		(local-set-key (kbd "M-l") 'select-word)
		(local-set-key (kbd "C-M-<left>") 'w3m-previous-buffer)
		(local-set-key (kbd "C-M-<right>") 'w3m-next-buffer)
		)))


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
		;; (gtags-mode 1)
		(local-unset-key "\C-c\C-c")
		(local-unset-key (kbd "C-M-e"))
		(setq compile-command "scons")
		(setq execute-command "./game&"))))


(define-minor-mode latex-my-mode
  "quelques configurations personnelles pour le latex"
  :lighter " latex-my-mode"
  (if latex-my-mode
	  (progn
		;; (gtags-mode 1)
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


(add-hook 'after-init-hook
		  #'global-flycheck-mode)

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
		  (lambda ();; (gtags-mode 1)
			(auto-complete-my-mode 1)
										;(srecode-minor-mode 1)
			))

(add-hook 'conf-space-mode-hook
		  (lambda ();; (gtags-mode 1)
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
			(local-unset-key "\C-t\C-t")
			(local-set-key (kbd "M-s") 'next-line)
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
			(local-set-key (kbd "C-M-d") 'org-up-element)
			(local-set-key (kbd "<backtab>") 'hide-subtree)
			(local-set-key [S-iso-lefttab] 'hide-subtree)
			(local-set-key "\C-t\o" 'org-remove-occur-highlights)
			(local-set-key "\C-c\C-o" 'org-toggle-ordered-property)
			(local-set-key "\C-c\C-p" 'org-priority)
			(local-set-key "\C-c\C-a" 'org-archive-to-archive-sibling)
			(local-set-key "\C-c\é" 'org-columns) ;; use 'q' to quit columns view
			(local-set-key "\C-c\h" 'org-clock-in)
			(local-set-key "\C-c\C-h" 'org-clock-out)
			(local-set-key (kbd "C-c C-M-h") 'org-clock-cancel)
			))

(add-hook 'doc-view-mode
		  (lambda () (pdf-my-mode 1)))

(add-hook 'w3m-mode-hook
		  (lambda () (w3m-my-mode 1)))
