;;; my-mode.el --- configuration of the diverses emacs modes
;;; Commentary:

;;; Code:
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$" . nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.svg$" . image-mode))
(add-to-list 'auto-mode-alist '("\\.feature$" . behave-mode))
(add-to-list 'auto-mode-alist '("\\.beancount$" . org-mode))
(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))
(add-to-list 'auto-mode-alist '("CMake*" . cmake-mode))

;; (autoload 'lua-mode "lua-mode" "Lua editing mode." t)


(define-minor-mode latex-my-mode
  "quelques configurations personnelles pour le latex"
  :lighter " latex-my-mode"
  (if latex-my-mode
      (progn
        ;; (gtags-mode 1)
        (with-current-buffer (current-buffer) (setq compile-command (concatenate 'string "latex " (buffer-file-name))))
        ;; (with-current-buffer (current-buffer) (setq execute-command (concatenate 'string "xdvi " (replace-extention buffer-file-name ".dvi"))))
				)))


(add-hook 'python-mode-hook
          (lambda ()
			;; (setq-default indent-tabs-mode 1)
			;; (setq-default tab-width 4)
			;; (setq-default python-indent-offset 4)
			;; (setq-default python-indent-guess-indent-offset nil)

			;; (setq indent-tabs-mode 1)
			;; (setq tab-width 4)
			;; (setq python-indent-offset 4)

			;; (setq python-indent-guess-indent-offset nil)
            ))



(add-hook 'julia-mode-hook
          (lambda ()
            ))

(add-hook 'dired-mode-hook
          (lambda ()
            (local-set-key "/" 'dired-narrow)
            ))

(add-hook 'web-mode-hook
          (lambda ()
            (flycheck-mode 't)
            ))

(add-hook 'org-mode-hook
          (lambda ()
            ))


(provide 'my-mode)
;;; my-mode.el ends here
