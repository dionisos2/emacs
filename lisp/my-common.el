;;; my-common.el --- stuffs that I use everywhere	 -*- lexical-binding: t -*-
;;; Commentary:
;;; Nothing special.

;;; Code:
(require 'use-package)

(customize-set-variable 'printer-name "EPSON_WF-2750") ;; House
(set-face-attribute 'default nil :height 120)

;; Avoid hiding any file (ex : avoid to hide backup file)
(customize-set-variable 'completion-ignored-extensions nil)

;; See : compilation-next-error-function and compilation-goto-locus
;; (setq display-buffer-alist '(
;; 														 (".*" display-buffer-reuse-window)
;; 														 )
;; 			)

(setq display-buffer-alist nil)

;; (use-package org-latex-impatient
;;   :defer t
;;   :hook (org-mode . org-latex-impatient-mode)
;;   :init
;;   (setq org-latex-impatient-tex2svg-bin
;;         ;; location of tex2svg executable
;;         "~/node_modules/mathjax-node-cli/bin/tex2svg"))


;; (use-package savehist
;; 	:custom
;; 	()
;; 	)

(use-package frame
	:custom
	(blink-cursor-blinks 3)
	)

(use-package shr-tag-pre-highlight
  :ensure t
  :after shr
  :custom
  (shr-external-rendering-functions '((pre . shr-tag-pre-highlight))) ;;;; Syntax highlighting for ement.el
  )

(use-package multisession
	:demand
	;; See http://xahlee.info/emacs/emacs_manual/elisp/Multisession-Variables.html, used, by example, for emoji--recent
	:custom
	(multisession-directory (concat user-emacs-directory "private/multisession/"))
	(multisession-storage 'files)
)

(use-package window
	:custom
	(pop-up-windows nil)
	)

(use-package face-remap
	:bind
	(
	 ("C-+" . text-scale-increase)
	 ("C--" . text-scale-decrease)
	 ("C-0" . text-scale-set)
	 ("C-*" . text-scale-set)
	 )
	)

(use-package help
	:bind (
				 :map help-mode-map
							("q" . my-kill-buffer)
				 )
	)

(use-package info
	:bind (
				 :map Info-mode-map
							("q" . my-kill-buffer)
         )
	)


(use-package man
	:bind (
				 :map Man-mode-map
							("q" . Man-kill)
				 )
	:custom
	(Man-notify-method 'pushy)
	:custom-face
	(Man-overstrike ((nil :inherit 'bold :foreground "orange red")))
	(Man-underline ((nil :inherit 'underline :foreground "forest green")))
	)

(use-package vdiff
	:ensure
	:demand
	:bind (
				 :map vdiff-mode-map
				 ("C-c h" . vdiff-hydra/body)
				 ("C-t C-q" . vdiff-quit)
				 )
	)

(use-package elfeed
	:ensure
	:demand
	:bind (
				 ("C-p C-s" . elfeed)
				 :map elfeed-search-mode-map
				 ("U" . elfeed-update)
				 ("q" . my-quit-elfeed)
				 )
	:custom
	(elfeed-feeds '(
									"https://astralcodexten.substack.com/feed"
									"https://www.dragonball-multiverse.com/flux.rss.php?lang=fr"
									"https://www.fdn.fr/feed/"
									"https://noob-tv.com/includes/flux_rss.xml"
									"https://archlinux.org/feeds/news/"
									))
	(elfeed-enclosure-default-dir "/home/dionisos/a_trier") ;; don’t know what it is, but don’t want it in my main directory

	)

(use-package sendmail
	:demand
	:custom
	(message-send-mail-function 'message-send-mail-with-sendmail)
	(send-mail-function 'sendmail-send-it)
	(sendmail-program "msmtp")
	(mail-specify-envelope-from t)
  (mail-envelope-from 'header)
  (message-sendmail-envelope-from 'header)
	(message-sendmail-f-is-evil t)
	;; (message-sendmail-extra-arguments '("--read-envelope-from"))
	(mail-host-address "gmail.com")
	(user-full-name "Denis Baudouin")
	(user-mail-address "denis.baudouin@gmail.com")
	)


(defun my-notmuch-delete(&optional beg end)
	(interactive)
	(notmuch-search-add-tag '("+deleted"))
	)

(defun my-notmuch-unread-down()
	(interactive)
	(notmuch-search-add-tag '("+unread"))
	(forward-line)
	)

(defun my-notmuch-delete-down()
	(interactive)
	(my-notmuch-delete)
	(forward-line)
	)

(use-package notmuch
	:ensure
	:demand
	:bind (
				 ("C-p n" . notmuch)
				 :map notmuch-search-mode-map
				 ("<deletechar>" . my-notmuch-delete)
				 ("d" . my-notmuch-delete-down)
				 ("u" . my-notmuch-unread-down)
				 ("U" . notmuch-refresh-this-buffer)
				 ("gg" . beginning-of-buffer)
				 ("G" . end-of-buffer)
				 )
	:custom
	(notmuch-search-oldest-first nil)
	)

(use-package xonsh-mode
	:ensure
	:demand
	)

(use-package man
	:demand
	)

(use-package xterm-color
	:ensure
	:demand
	)

(use-package emacs-pager
	:demand
	:config
	(add-to-list 'auto-mode-alist '("\\.emacs-pager$" . emacs-pager-mode))
	)

																				;(setq auto-mode-alist (delete '("\\.emacs-pager$" . text-mode) auto-mode-alist))

(use-package appt
	:bind (
				 ("C-p C-M-c" . appt-add)
				 )
	:custom
	(appt-message-warning-time 1)
	(appt-display-interval appt-message-warning-time)
	(appt-disp-window-function 'my-appt-notification)
	;; (appt-delete-window-function always)
	)

(use-package with-editor
	:ensure
	:demand
	:bind (
				 :map with-editor-mode-map
				 ("C-t C-s" . with-editor-finish)
				 ("C-t C-k" . with-editor-cancel)
				 )
	)
(use-package org
	:demand
	:bind (
				 ("<f4>" . my-dwim-done)
				 :map org-mode-map
				 ("C-c h" . my-copy-heading-org)
				 ("C-c C-l" . nil)
				 ("C-c C-M-l" . nil)
				 ("M-<right>" . nil)
				 ("M-<left>" . nil)
				 ("C-c C-t" . transpose-mark)
				 )
	:config
	(electric-indent-local-mode -1)
	:custom
	(org-agenda-files '("~/organisation/agenda.org" "~/organisation/birthdays.org" "~/organisation/todo.org"))
	)

(use-package org-agenda
	:bind (
				 :map org-agenda-mode-map
				 ("h" . my-copy-heading)
				 ("C-c h" . my-copy-heading-org)
				 ("<f6>" . my-org-set-time-today)
				 )
	)

(use-package transpose-mark
	:ensure
	:demand
	:bind (
				 ("C-c C-t" . transpose-mark)
				 )
	)

(use-package bookmark
	:bind (
				 :map override-global-map
				 ("C-t C-b" . bookmark-set)
				 ("C-t C-l" . bookmark-jump)
				 )
	:custom
	(bookmark-set-fringe-mark nil)
)

(use-package bind-key
	:bind (
				 :map override-global-map
				 ("C-h k" . describe-key)
				 ("C-M-x" . eval-expression)
				 ("M-x" . execute-extended-command)
				 ("C-t C-k" . my-kill-buffer)
				 ("C-t k" . my-kill-buffer-and-maybe-window)
				 ("C-t C-t" . switch-to-buffer)
				 ("C-p C-s" . save-some-buffers)
				 ("C-p r" . revert-buffer)
				 ("C-p C-M-r" . my-revert-all-buffers)
				 ("C-p q" . my-kill-boring-buffer)
				 ("C-p C-q" . kill-matching-buffers)
				 ("C-p c" . org-timer-set-timer)
				 ("C-p C-c" . org-timer-start)
				 ("C-p M-c" . org-timer-stop)
				 ("C-p w" . org-agenda-list)
				 ("C-p C-w" . org-agenda)
				 ("C-c C-c" . comment-region)
				 ("C-c c" . uncomment-region)
				 )
	)

(ido-mode -1)

(use-package use-package-chords
	:ensure
	:demand
	:config
	(key-chord-mode 1)
	:custom
	(key-chord-two-keys-delay 0.05)
	(key-chord-one-key-delay 0.10)
	)



(use-package undo-tree
	:ensure
	:demand
	:init
	(defun undo-tree-overridden-undo-bindings-p () nil);; To fix some bug
	:bind (
				 ("C-é" . undo-tree-undo)
				 ("C-S-é" . undo-tree-redo)
				 ("C-M-é" . undo-tree-visualize)
				 ("C-z" . undo-tree-undo)
				 ("C-S-z" . undo-tree-redo)
				 ("C-M-z" . undo-tree-visualize)
				 )
	:config
	(global-undo-tree-mode 1)
	:custom
	(undo-tree-history-directory-alist `(("." . ,(concat user-emacs-directory "private/undo-tree-save/"))))
	)

(use-package avy
	:ensure
	:demand
	:bind* (
				 ("C-d" . avy-goto-word-0)
				 ("C-M-d" . avy-goto-char)
				 ("C-S-d" . avy-goto-line)
				 ("C-," . avy-goto-line)
				 )
	:custom
	(avy-keys '(?a ?u ?i ?e ?p ?o ?n ?r ?s ?t ?d ?v ?g ?x))
	)

(use-package magit
	:ensure
	:bind (
				 ("C-p m" . magit-status)
				 )
	:config
	(bind-key "q" #'(lambda () "Completely quit magit." (interactive) (magit-mode-bury-buffer 16)) magit-status-mode-map)
	)

(use-package openwith
	:ensure
	:custom
	(openwith-associations '(("\\.pdf" "evince" (file)) ("\\.docx" "libreoffice" (file))))
	(openwith-mode t)
	)



;; (defun compile-goto-error (&optional event)
;;   "Visit the source for the error message at point.
;; Use this command in a compilation log buffer."
;;   (interactive (list last-input-event))
;;   (if event (posn-set-point (event-end event)))
;;   (or (compilation-buffer-p (current-buffer))
;;       (error "Not in a compilation buffer"))
;;   (compilation--ensure-parse (point))
;;   (if (get-text-property (point) 'compilation-directory)
;;       (dired-other-window
;;        (car (get-text-property (point) 'compilation-directory)))
;;     (setq compilation-current-error (point))
;;     (next-error-internal)))


(defun my-compile-goto-error (&optional event)
  "Visit the source for the error message at point.
Use this command in a compilation log buffer."
  (interactive (list last-input-event))
	(message "START")
  (if event (posn-set-point (event-end event)))
  ;; (or (compilation-buffer-p (current-buffer))
  ;;     (error "Not in a compilation buffer"))
  (compilation--ensure-parse (point))
	(message "before if")
  (if (get-text-property (point) 'compilation-directory)
      (message (car (get-text-property (point) 'compilation-directory)))
    (setq compilation-current-error (point))
    (next-error-internal)
			)
	(message "END")
	)



(use-package wgrep
	:ensure
	:bind (
				 ("C-c w" . wgrep-change-to-wgrep-mode)
				 :map wgrep-mode-map
				 ("C-t C-s" . wgrep-finish-edit)
				 ("C-c w" . wgrep-change-to-wgrep-mode)
				 )
	)

(use-package multiple-cursors
	:ensure
	:bind (
				 ("C-c l" . mc/mark-all-dwim)
				 ("C-c C-l" . mc/mark-all-in-region-regexp)
				 ("C-c C-M-l" . mc/edit-lines) ;; Add a cursors on each lines
				 )
	)

(use-package phi-search
	:ensure
	)

;; Obsolete and too much bug, maybe try dirvish
;; (use-package ranger
;; 	:ensure
;; 	:custom
;; 	(ranger-cleanup-eagerly t)
;; 	(ranger-excluded-extensions '("mkv" "iso" "mp4" "bin" "exe" "msi" "pdf"))
;; 	(ranger-format-regexp '("^\\.?#\\|^\\.$\\|^\\.\\.$"))
;; 	(ranger-override-dired 'ranger)
;; 	(ranger-override-dired-mode t)
;; 	(ranger-return-to-ranger t)
;; 	(ranger-show-hidden 'hidden)
;; 	(ranger-show-literal nil)
;; 	(ranger-width-preview 0.5)
;; 	:bind (
;; 				 :map ranger-mode-map
;; 				 ("M-t" . ranger-up-directory)
;; 				 ("M-r" . ranger-find-file)

;; 				 ("t" . ranger-up-directory)
;; 				 ("r" . ranger-find-file)
;; 				 ("d" . ranger-prev-file)
;; 				 ("s" . ranger-next-file)
;; 				 ("H" . ranger-toggle-dotfiles)
;; 				 ("SPC" . ranger-toggle-mark)
;; 				 ("C-d" . avy-goto-word-0)
;; 				 ("C-M-d" . avy-goto-char)

;; 				 ("v" . dired-toggle-marks)
;; 				 ("C-v" . dired-mark-sexp)

;; 				 ("cc" . ranger-copy)
;; 				 ("CC" . ranger-cut)
;; 				 ("C-t p" . ranger-copy-filename)

;; 				 ("<delete>" . dired-do-delete)
;; 				 )
;; 	)

(use-package image-mode
	:mode "\\.svg$"
	)

(use-package winner
	:ensure
	:demand
	:bind (
				 :map winner-mode-map
				 ("C-c <left>" . nil)
				 ("C-c <right>" . nil)
				 )
	:custom
	(winner-mode t)
	)

(use-package all-the-icons
	:demand
	:ensure
	;; (all-the-icons-install-fonts t)
	)

(use-package all-the-icons-dired
	:demand
	:ensure
	:after (all-the-icons)
	:hook (dired-mode-hook . all-the-icons-dired-mode)
	)

(use-package markdown-mode
	:ensure
	:bind (
				 :map markdown-mode-map
							("C-p C-t" . markdown-preview)
							("C-<return>" . markdown-follow-thing-at-point)
				 )
	;; :config
	;; (markdown-open-command )
	)

(use-package hydra
	:ensure
	:demand
	:config
	(defhydra hydra-zoom (global-map "C-t")
		"winner"
		("<left>" winner-undo)
		("<right>" winner-redo)
		)
	)

(use-package abbrev
	:demand
	:hook
	((text-mode-hook prog-mode-hook erc-mode-hook LaTeX-mode-hook org-mode-hook) . abbrev-mode)
	:config
	(if (file-exists-p abbrev-file-name)
			(quietly-read-abbrev-file))
	)


(use-package company
	:ensure
	:demand
	:config
	(setcdr company-active-map	nil) ;; I don’t want any keybinding.
	(company-keymap--bind-quick-access company-active-map) ;; But still want M-0, M-1, etc shortcut.
	:bind (
				 ("C-f" . company-complete)
				 ("C-M-f" . company-complete-selection)
				 :map company-active-map
				 ("C-g" . company-abort)
				 ("C-n" . company-select-next-or-abort)
				 ("C-M-n" . company-select-previous-or-abort)
				 ("<down>" . company-select-next-or-abort)
				 ("<up>" . company-select-previous-or-abort)
				 ;; ("C-h c" . company-show-location)
				 )
	:custom
	(global-company-mode t)
	(company-continue-commands t)
	(company-idle-delay 0.2)
	(company-show-numbers t)
	(company-backends '(
											(:separate ;; company-jedi 
																 company-files :separate company-keywords :separate company-capf :separate company-abbrev :separate company-dabbrev)
											)
										)
	)

;; (add-hook 'minibuffer-setup-hook 'my/company-mode-maybe)

;; (defun my/company-mode-maybe ()
;;     (company-mode 1))

(use-package consult-lsp
	:ensure
	)


(use-package company-dabbrev
	:demand
	:after (company)
	:custom
	(company-dabbrev-char-regexp "\\(\\sw\\|[-$_]\\)")
	(company-dabbrev-downcase nil)
	(company-dabbrev-ignore-case nil)
	(company-dabbrev-minimum-length 3)
	)

;; (use-package company-statistics
;;		:ensure
;;		:demand
;;		:after (company)
;;		:custom
;;		(company-statistics-mode t)
;; )


(use-package prescient
	:ensure
	)


(use-package company-prescient
	:ensure
	:config
	(company-prescient-mode 1) ;; See company-transformers
	(prescient-persist-mode 1)
	:custom
	(prescient-save-file (concat user-emacs-directory "private/prescient-save.el"))
	)

(use-package company-quickhelp
	:ensure
	:after (company)
	:custom
	(company-quickhelp-mode t)
	(company-quickhelp-color-background "black")
	(company-quickhelp-color-foreground "white")
	(company-quickhelp-delay 0.1)
	)

(use-package proced
	:ensure
	:custom
	(proced-auto-update-flag t)
	(proced-auto-update-interval 1)
	)

(use-package which-key
	:ensure
	:demand
	:custom
	(which-key-frame-max-height 100)
	(which-key-idle-delay 0.2)
	(which-key-mode t)
	(which-key-paging-prefixes '("C-c"))
	)


(use-package vertico
	:ensure
	:demand
	:init
	(vertico-mode)
	;; (setq vertico-cycle t)
	:bind (
				 :map minibuffer-local-map
				 ("M-d" . previous-line)
				 ("M-s" . next-line)
				 :map vertico-map
				 ("C-f" . vertico-insert)
				 ("<tab>" . vertico-insert)
				 ("M-g" . vertico-quick-insert)
				 ("<return>" . vertico-directory-enter)
				 ("^" . my-up-directory)
				 )
	:custom
	(vertico-count 20)
	)


(use-package emoji
	:bind (
				 ("C-c e" . emoji-search)
				 ("C-c C-e" . emoji-insert)
				 )
	:custom-face ;; 👌 : not working because of something about font-lock
	(emoji ((t :Height 3.0)))
	)

;;;; No idea what it does or even if it does something
;; (setf use-default-font-for-symbols nil)
;; (set-fontset-font t 'unicode "Noto Emoji" nil 'append)


(use-package htmlize ;; Used to improve display of ement messages
	:ensure
	:demand
	)

(defun my-ement-panta-connect ()
  (interactive)
  (ement-connect :uri-prefix "http://localhost:8010" :user-id "@dionisos:matrix.org"))

(use-package ement
	:ensure
	:bind (
				 ("C-t m" . ement-room-view)
				 ("C-t C-m" . ement-notifications)
				 ("C-t C-M-m" . ement-list-rooms)
				 :map ement-room-mode-map
				 ("M-s" . next-line)
				 ("d" . ement-room-scroll-down-command)
				 ("s" . ement-room-scroll-up-mark-read)
				 ("t" . ement-room-goto-prev)
				 ("r" . ement-room-goto-next)
				 ("P" . beginning-of-buffer)
				 ("RET" . ement-room-send-message)
         ("S-RET" . ement-room-write-reply)
         ("M-RET" . ement-room-compose-message)
         ("o e" . ement-room-edit-message)
         ("o d d" . ement-room-delete-message)
         ("o r" . ement-room-send-reaction)
				 ("o c" . my-ement-room-send-common-reaction)
         ("o m" . ement-room-send-emote)
         ("o f" . ement-room-send-file)
         ("o i" . ement-room-send-image)
				 ("a t" . ement-tag-room)
				 ("a s" . ement-room-set-topic)
				 ("a n" . ement-room-set-notification-state)
				 ("a m" . ement-room-set-display-name)
				 :map ement-room-minibuffer-map
				 ("TAB" . completion-at-point)
				 ("C-f" . completion-at-point)
				 ("M-RET" . ement-room-compose-from-minibuffer)
				 )
	:custom
	(ement-view-room-display-buffer-action '(display-buffer-reuse-mode-window))
	(ement-room-send-message-filter nil)
	;; (ement-room-send-message-filter 'ement-room-send-org-filter)
	(ement-room-retro-messages-number 100)
	(ement-room-prism 'both) ;; Different color for different people
	(ement-sessions-file (concat user-emacs-directory "private/ement.el"))
	(ement-save-sessions t)
	;; (ement-notify-ignore-predicates nil)
	;; :init
	;; (setq ement-notify-dbus-p nil)
	)

(use-package browse-url
	:custom
	(browse-url-handlers '(("https?://localhost.*matrix" . w3m-download)))
	(browse-url-browser-function 'browse-url-generic)
	(browse-url-generic-program "firefox-developer-edition")
)

(use-package orderless
	:ensure
	:demand
	:init
	(setq completion-styles '(orderless)
				completion-category-defaults nil
				completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
	;; Enable richer annotations using the Marginalia package
	:ensure
	;; Either bind `marginalia-cycle` globally or only in the minibuffer
	:bind (("M-A" . marginalia-cycle)
				 :map minibuffer-local-map
				 ("M-A" . marginalia-cycle))
	:init
	(marginalia-mode))

(use-package consult
	:ensure
	:demand
	:bind (;; C-c bindings (mode-specific-map)
				 ;; ("C-c h" . consult-history)
				 ;; ("C-c m" . consult-mode-command)
				 ("M-SPC" . consult-mark)
				 :map override-global-map
				 ("C-t C-r" . consult-recent-file)
				 ("C-M-s" . consult-line)
				 ("C-t C-l" . consult-bookmark)
				 ;; ("C-c C-b" . consult-kmacro)
				 ;; C-x bindings (ctl-x-map)
				 ;; ("C-x M-:" . consult-complex-command)			;; orig. repeat-complex-command
				 ("C-t C-t" . consult-buffer)

				 ("C-t C-g" . consult-register)

				 ("M-." . consult-yank-pop)								 ;; orig. yank-pop
				 ("<help> a" . consult-apropos)						 ;; orig. apropos-command

				 ;; ("M-g e" . consult-compile-error)
				 ;; ("M-g f" . consult-flymake)								;; Alternative: consult-flycheck
				 ("C-c g" . consult-goto-line)						 ;; orig. goto-line
				 ;; ("M-g o" . consult-outline)								;; Alternative: consult-org-heading
				 ;; ("M-g i" . consult-imenu)
				 ;; ("M-g I" . consult-project-imenu)

				 ("C-p f" . consult-find)
				 ("C-p l" . consult-locate)
				 ;; ("M-s G" . consult-git-grep)
				 ("C-p g" . consult-ripgrep)
				 ("C-p C-g" . (lambda () (interactive) (consult-ripgrep t)))
				 ;; ("M-s m" . consult-multi-occur)

				 ;; Isearch integration
				 :map isearch-mode-map
				 ("M-e" . consult-isearch-history)
				 :map minibuffer-local-map
				 ("M-SPC" . vertico-next)
				 ;; ("C-s" . isearch-forward)
				 )

	:init
	;; Optionally configure the register formatting. This improves the register
	;; preview for `consult-register', `consult-register-load',
	;; `consult-register-store' and the Emacs built-ins.


	(advice-add #'register-preview :override #'consult-register-window)
	;; (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

	;; (setq xref-show-xrefs-function #'consult-xref
	;;			 xref-show-definitions-function #'consult-xref)


	;; :config
	;; (setq consult-preview-key 'any)
	;; (setq consult-narrow-key "<")

	(consult-customize
	 consult-ripgrep consult-git-grep consult-grep
	 consult-bookmark consult-recent-file consult-xref
	 ;; consult--source-file consult--source-project-file consult--source-bookmark
	 consult-buffer
	 :preview-key "M-v")

	:custom
	(consult-find-command "find . -ipath *ARG* OPTS")
	)

(use-package consult-company
	:ensure
	)

(use-package embark
	:ensure

	:bind
	(("C-." . yank)
	 ("M-o" . embark-act)					;; pick some comfortable binding
	 ("C-M-o" . embark-dwim)				;; good alternative: M-.
	 ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

	:init

	;; Optionally replace the key help with a completing-read interface
	(setq prefix-help-command #'embark-prefix-help-command)

	:config

	;; Hide the mode line of the Embark live/completions buffers
	;; (add-to-list 'display-buffer-alist
	;; 						 '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*" nil (window-parameters (mode-line-format . none))))

	(setq embark-action-indicator
				(lambda (map _target)
					(which-key--show-keymap "Embark" map nil nil 'no-paging)
					#'which-key--hide-popup-ignore-command)
				embark-become-indicator embark-action-indicator)
	)

(use-package embark-consult
	:ensure
	:after (embark consult)
	:demand
	:hook
	(embark-collect-mode-hook . consult-preview-at-point-mode)
	)


;; (use-package visual-regexp
;; 	:ensure
;; 	)

;;;; Removed because bug and seem abandonned
;; (use-package visual-regexp-steroids
;; 	:ensure
;; 	:demand
;; 	:init
;; 	;; Add advise for case insensitivity
;; 	(defadvice vr--isearch (around add-case-insensitive (forward string &optional bound noerror count) activate)
;; 		(when (and (eq vr/engine 'python) case-fold-search)
;; 			(setq string (concat "(?im)" string)))
;; 		ad-do-it)
;; 	:bind
;; 	(
;; 	 ;; :map override-global-map
;; 	 ("C-s" . vr/isearch-forward)
;; 	 ("C-r" . vr/isearch-backward)
;; 	 ("C-M-r" . vr/query-replace)
;; 	 )
;; 	:custom
;; 	;; See https://docs.python.org/3/library/re.html#re.I
;; 	;; I:IGNORECASE, M:MULTILINE (^ and $ match for each line)
;; 	(vr/default-regexp-modifiers '(:I t :M t :S nil :U nil)) ;;
;; 	)

(use-package kiwix
	:ensure
	:custom
	(kiwix-default-browser-function 'w3m-browse-url)
	(kiwix-default-data-dir "/stockage/kiwix/data")
	(kiwix-default-library-dir "/stokage/kiwix/lib")
	(kiwix-server-port 8080)
	)

(use-package w3m
	:ensure
	:custom
	(w3m-default-display-inline-images t)
	)

(customize-set-variable 'explicit-shell-file-name "/usr/bin/xonsh")

(provide 'my-common)
;;; my-common.el ends here
