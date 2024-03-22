;;; my-basics.el --- anything that works without added package  -*- lexical-binding: t -*-
;;; Commentary:
;;; this will create a correct configuration even if something bug after it, or if I want to quickly debug a package by removing all other packages.
;;; lexical-binding is necessary for the lambda function.

;;; Code:

(require 'org)
(require 'org-agenda)
(require 'org-timer)
(require 'term)
(require 'abbrev)
(require 'custom)
(require 'cus-edit)
(require 'auth-source)
(require 'doc-view)
(require 'ido)
(require 'bookmark)


(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))

(make-directory user-temporary-file-directory t)

(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))

(setq backup-by-copying t)
(setq make-backup-files nil)
(setq auto-save-default nil)

(customize-set-variable 'backup-directory-alist
										 '(("." . "/home/dionisos/personnelle/records_and_save/emacs_backups/")))

(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

(customize-set-variable 'auto-save-default nil)
(customize-set-variable 'version-control t)

(customize-set-variable 'bookmark-save-flag 0)

;;; Delete excess backup silently
(customize-set-variable 'delete-old-versions t)


;; Miscellaneous
;;; Don’t show regiter preview
(customize-set-variable 'register-preview-delay nil)
;;; We don’t want customize to mess up with our init.el or emacs.el, but we will not use it.
(setq custom-file (expand-file-name "lisp/my-custom.el" user-emacs-directory))

;;; activate desactivated function
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'upcase-region 'disabled nil)

(recentf-mode 1)
(customize-set-variable 'recentf-max-saved-items 500)
(customize-set-variable 'recentf-max-menu-items 20)

(fset 'yes-or-no-p 'y-or-n-p)
(customize-set-variable 'current-language-environment "utf-8")
;;; Don’t save tramp password
(customize-set-variable 'auth-source-save-behavior nil)
;;; Load image as image
(customize-set-variable 'auto-image-file-mode t)
;;; Don't transform tabulation in space, just remove a character.
(customize-set-variable 'backward-delete-char-untabify-method nil)
;;; Don’t ignore case in searches and matches
(customize-set-variable 'case-fold-search t)
;;; Display line and column in the mode line
(customize-set-variable 'column-number-mode t)
(customize-set-variable 'line-number-mode t)

(customize-set-variable 'delete-by-moving-to-trash t)
(customize-set-variable 'trash-directory "/home/dionisos/.local/share/Trash/files")

;;; Delete selection when writing
(customize-set-variable 'delete-selection-mode 1)

(customize-set-variable 'doc-view-continuous t)

;;; Indentation stuffs
(customize-set-variable 'electric-indent-mode t)
;;; indent-tabs-mode is a variable defined in ‘C source code’.
(customize-set-variable 'indent-tabs-mode t)
(customize-set-variable 'standard-indent 2)
(customize-set-variable 'tab-width 2)

;;; Find file true name by fallowing symlinks
(customize-set-variable 'find-file-visit-truename t)


;;; Save minibuffer history in savehist-file periodically or when existing Emacs.
(customize-set-variable 'savehist-mode t)
(customize-set-variable 'history-length 10000)

;;; Remove it because it do bizarre stuff with find-file
(customize-set-variable 'ido-auto-merge-work-directories-length -1)

;;; TOSEE: It was to nil, unsure of it is good.
(customize-set-variable 'ido-enable-regexp t)

;;; Turn on Ido buffer and file behavior.
(customize-set-variable 'ido-mode 'both)

(customize-set-variable 'inhibit-startup-screen t)
(customize-set-variable 'kill-ring-max 100)

;;; Move point by visual instead of real lines.
(customize-set-variable 'line-move-visual t)

;;; If a line go off screen, still show it.
(customize-set-variable 'truncate-lines nil)

;;; wrap on words
(customize-set-variable 'word-wrap t)

;;; Add cursor-intangible property for the prompt, probably avoiding cursor to select it.
(customize-set-variable 'minibuffer-prompt-properties '(read-only t cursor-intangible t face minibuffer-prompt))

;;; Don’t recenter view.
(customize-set-variable 'scroll-conservatively 99)
(customize-set-variable 'scroll-step 1)

;;; cutting and pasting uses the clipboard.
(customize-set-variable 'select-enable-clipboard t)

;;; Visualization of matching parentheses.
(customize-set-variable 'show-paren-mode 't)

(customize-set-variable 'show-trailing-whitespace t)

;; ;;; Never split windows automatically (unsure of why it still splits sometime, but possible improvement here if splitting is messed-up).
;; ;;; Create problem with rgrep, this is why I removed it
;; (customize-set-variable 'split-window-preferred-function '(lambda (window) (nil)))

(customize-set-variable 'tool-bar-mode nil)

;;; Show selected region.
(customize-set-variable 'transient-mark-mode t)

;;; Unsure
;; (customize-set-variable 'truncate-partial-width-windows nil)

;;; Flash if I do something "wrong", so I learn.
(customize-set-variable 'visible-bell t)


;;; Don’t pass text properties, only the text.
(customize-set-variable 'yank-excluded-properties t)

;; org-mode
;;; TODO : Find what is useful and sort it
(customize-set-variable 'org-agenda-files
	 '("~/organisation/agenda.org" "~/organisation/birthdays.org" "~/organisation/todo.org"))

(customize-set-variable 'calendar-day-header-array ["Di" "Lu" "Ma" "Me" "Je" "Ve" "Sa"])
(customize-set-variable 'calendar-day-name-array
	 ["Dimanche" "Lundi" "Mardi" "Mercredi" "Jeudi" "Vendredi" "Samedi"])
(customize-set-variable 'calendar-week-start-day 1)

(add-to-list 'org-agenda-custom-commands
             '("p" "important tasks"
               tags-todo "PRIORITY=\"A\""))

(add-to-list 'org-agenda-custom-commands
             '("t" "todo tasks without schedule (todo.org)"
							 tags-todo "-SCHEDULED={.}-DEADLINE={.}" ((org-agenda-files '("~/organisation/todo.org"))))
						 )

(add-to-list 'org-agenda-custom-commands
             '("w" "periodic tasks without schedule (agenda.org)"
							 tags-todo "-SCHEDULED={.}-DEADLINE={.}" ((org-agenda-files '("~/organisation/agenda.org"))))
						 )


(customize-set-variable 'org-agenda-include-diary t)
(customize-set-variable 'org-agenda-restore-windows-after-quit t)
(customize-set-variable 'org-agenda-window-setup 'current-window)
(customize-set-variable 'org-closed-keep-when-no-todo nil)
(customize-set-variable 'org-columns-default-format "%TODO %ITEM %Effort{:}")
(customize-set-variable 'org-log-done nil)
(customize-set-variable 'org-log-repeat nil)
(customize-set-variable 'org-startup-truncated nil)
(customize-set-variable 'org-tags-column 100)
(customize-set-variable 'org-tags-exclude-from-inheritance '("ORDERED"))
(customize-set-variable 'org-timer-default-timer "4")
(customize-set-variable 'org-track-ordered-property-with-tag t)

(customize-set-variable 'explicit-shell-file-name "/usr/bin/fish")

;; Functions

;; (defun testi (&rest plop)
;; 	`(,`(,@plop) ,`(,plop) ,`(plop) ,'(plop))
;; )
;;; testi(:a :b :c) => ((:a :b :c) ((:a :b :c)) (plop) (plop))
;;; (eval :a) => :a
;;; (equal '("a" "b" "c") (list "a" "b" "c")) => t
;;; (equal '((> 1 2) "b") (list (> 1 2) "b")) => nil
;;; (equal `(,(> 1 2) ,"b") (list (> 1 2) "b")) => t
;;; (type-of [:a :b]) => vector
;;; (type-of '(:a :b)) => cons
;;; ''(:a) => '(:a)
;;; (equal (quote a) 'a) => t
;;; (equal (quote (a b)) '(a b)) => t
;;; (equal (quote (list a b)) '(a b)) => nil

;; (defmacro do-mostly-nothing (&rest expressions)
;; 	`(progn ,@expressions)
;; 	)
;; make-symbol could be useful in macro to avoid collisions

(defmacro my-transform-bindings (&rest expressions)
	"Remplace define-key and global-set-key by bind-key if bind-key package is present.
Should use kbd, this isn’t a smart macro so don’t try complex stuffs"
	(let (new-expressions old-expressions expr function key map command)
		(setq new-expressions (list))
		(setq old-expressions (copy-sequence expressions))
		(while expressions
			(setq expr (car expressions))

			(setq function (car expr))
			(cond
			 ((equal function (quote define-key))
				(setq map (nth 1 expr))
				(setq key (nth 1 (nth 2 expr)))
				(setq command (nth 3 expr))
				(push (list 'bind-key key command map) new-expressions)
				)
			 ((equal function (quote global-set-key))
				(setq key (nth 1 (nth 1 expr)))
				(setq command (nth 2 expr))
				(push (list 'bind-key key command) new-expressions)
				)
			 (t
				(push expr new-expressions)
				)
			 )
			(setq expressions (cdr expressions))
			)
		(setq new-expressions (reverse new-expressions))
		`(if (featurep 'bind-key) (progn ,@new-expressions) (progn ,@old-expressions))
		)
	)


(defun my-eval-buffer ()
  (interactive)
  (call-interactively 'eval-buffer)
  (message "Buffer has been evaluated"))

(defun my-eval-region ()
  (interactive)
  (call-interactively 'eval-region)
  (message "Region has been evaluated"))

(defun my-shell-command-on-region()
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "bash" t))

(defun my-echo-date()
	"Insert the current date."
  (interactive)
  (shell-command "date '+%Hh%M'" 't)
  (forward-word)
  (delete-char 1))

(defun my-save-buffer-always ()
  "Save the buffer even if it is not modified."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

(defun my-revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (let* ((list (buffer-list))
         (buffer (car list)))
    (while buffer
      (when (and (buffer-file-name buffer)
                 (not (buffer-modified-p buffer)))
        (set-buffer buffer)
        (revert-buffer t t t))
      (setq list (cdr list))
      (setq buffer (car list))))
  (message "Refreshed open files"))

;;; Useless and bad, but a example of macro
;; (defmacro my-if-secure (condition body &rest else_body)
;; 	"If the variable CONDITION is defined and not nil run BODY else run ELSE_BODY..."
;; 	`(if (and (boundp ',condition) ,condition)
;; 			 ,body
;; 		 ,@else_body
;; 		 )
;; 	)


(defun my-parse-time-string (time-string)
	"Parse TIME-STRING in format '10h35' '30' '-10h'."
	(let
			((time-list (cond
									 ((string-match "-\\([0-9]+\\)[hH:]\\([0-9]+\\)" time-string)
										`(,(- (string-to-number (match-string 1 time-string))) ,(- (string-to-number (match-string 2 time-string))))
										)
									 ((string-match "\\([0-9]+\\)[hH:]\\([0-9]+\\)" time-string)
										`(,(string-to-number (match-string 1 time-string)) ,(string-to-number (match-string 2 time-string)))
										)
									 ((string-match "\\(-?[0-9]\\)h" time-string)
										`(,(string-to-number (match-string 0 time-string)) 0)
										)
									 ((string-match "^\\(-?[0-9]+\\)$" time-string)
										`(0 ,(string-to-number (match-string 1 time-string)))
										)
									 (t
										(error "Format should be \\-?d+[hH:]\\d+ or -?\\d+")
										)
									 )
									)
			 )
		;; The ` evaluate every expression starting with , inside the list.
		(make-decoded-time :hour (nth 0 time-list) :minute (nth 1 time-list))
		)
	)

;; (nil nil 1 nil nil nil nil nil nil)
;; (0 0 2 1 1 1970 nil -1 nil)
;; (0 0 3 1 1 1970 nil -1 nil)


(defun my-add-time (time-string-1 time-string-2)
	"Add TIME-STRING-1 and TIME-STRING-2 (see my-parse-time-string for format)."
	(let* (
				 (ti1 (my-parse-time-string time-string-1))
				 (ti2 (my-parse-time-string time-string-2)))

		(format-time-string "%Hh%M" (encode-time (decoded-time-add (decoded-time-set-defaults ti1) ti2)))
		)
	)

(defun my-sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/doas:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/doas:root@localhost:" buffer-file-name))
		)
	)

(defun my-term-insert-literal ()
  "Take a keypress KEY and insert it literally into a terminal."
  (interactive)
	(let ((key (read-key)))
		(message (format "%s" key))
		(term-send-raw-string (format "%c" key))
		)
  )

(customize-set-variable 'explicit-shell-file-name "/usr/bin/bash")
(defun my-term ()
  "Run terminal without asking for shell."
  (interactive)
  (set-buffer (make-term "terminal" explicit-shell-file-name))
  (term-mode)
  (term-char-mode)
  (switch-to-buffer "*terminal*"))

(defun my-term-toggle-mode ()
  "Toggle term between line mode and char mode."
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(defun my-buffer-path-to-ring ()
  "Copy buffer's full path to kill ring."
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))))

(defun my-kill-boring-buffer()
	"Kill a lot of not really useful buffers."
  (interactive)
  (kill-matching-buffers "^\\*Bookmark List\\*$")
  (kill-matching-buffers "^\\*Flycheck error messages\\*$")
  (kill-matching-buffers "^\\*Help\\*$")
  (kill-matching-buffers "^\\*scratch\\*$")
  (kill-matching-buffers "^diary$")
  (kill-matching-buffers "^birthdays.org$")
  (kill-matching-buffers "^agenda.org$")
  (kill-matching-buffers "^diary$")
  (kill-matching-buffers "^\\*ein:log-all\\*$")
  (kill-matching-buffers "^\\*Calendar\\*$")
  (kill-matching-buffers "^\\*Completions\\*$")
  (kill-matching-buffers "^\\*Ido Completions\\*$")
  (kill-matching-buffers "^\\*Warnings\\*$")
  (kill-matching-buffers "^\\*Customize.*\\*$")
  (kill-matching-buffers "^\\*Man .*\\*$")
	(kill-matching-buffers "^\\*Geiser .*\\*$")
  )

(defun my-kill-buffer ()
  "Kill without asking."
  (interactive)
  (kill-buffer))

(defun my-kill-buffer-and-maybe-window ()
  "Kill the windows only if it isn’t the last."
  (interactive)
  (if (> (length (window-list)) 1) (kill-buffer-and-window) (kill-buffer)))


(defun my-select-line()
	"Select a line."
  (interactive)
  (move-beginning-of-line nil)
  (set-mark-command nil)
  (move-end-of-line nil))

(defun my-select-word()
	"Select a word."
  (interactive)
  (if (/= (point) (point-max)) (forward-char))
  (forward-word -1)
  (set-mark-command nil)
  (forward-word 1))

(defun my-select-symbol()
	"Select a symbol."
  (interactive)
  (if (/= (point) (point-max)) (forward-char))
  (forward-symbol -1)
  (set-mark-command nil)
  (forward-symbol 1))

(defun my-org-tags-view-only-todo()
	"Probably useless."
  (interactive)
  (org-tags-view t))

(defun my-backward-whitespace()
	"Voir 'forward-whitespace'."
	(interactive)
	(forward-whitespace -1)
	)

(defun my-term-delete()
	(interactive)
	(term-send-raw-string "\ed")
	)

(defun my-term-bactkspace()
	(interactive)
	(term-send-raw-string "\e\x7f")
	)

(provide 'my-basics)
;;; my-basics.el ends here

