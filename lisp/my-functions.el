;;; my-functions.el --- Some helper function that use packages	-*- lexical-binding: t -*-
;;; Commentary:
;;; See ./my-basics.el and go to "Functions" to see others defined functions.

;;; Code:

(require 'ansi-color)
(require 'my-basics)

(defun my-org-set-time-today ()
	"Set time to today in `org-agenda'."
	(interactive)
	(org-agenda-schedule nil (format-time-string "%Y-%m-%d"))
	)

(defun my-python-eval-region ()
	(interactive)
	(if (not (python-shell-get-process))
			(progn
				(run-python nil nil 1)
				(sleep-for 1)
				)
		)
	(call-interactively 'python-shell-send-region)
	(python-shell-switch-to-shell)
	)

(defun my-python-eval-buffer ()
	(interactive)
	(if (not (python-shell-get-process))
			(progn
				(run-python nil nil 1)
				(sleep-for 1)
				)
	)
	(python-shell-send-buffer)
	(python-shell-switch-to-shell)
	)

(defun my-julia-eval-region ()
	(interactive)
	(julia-repl-activate-parent nil)
	(julia-repl-send-region-or-line)
	)

(defun my-julia-eval-buffer ()
	(interactive)
	(julia-repl-activate-parent nil)
	(julia-repl-send-buffer nil)
)

(defun my-create-julia-project (project-name)
	(interactive "s")
	(shell-command (cl-concatenate 'string "julia /home/dionisos/scripts/create_julia_project.jl " project-name))
	(find-file (cl-concatenate 'string "/home/dionisos/projets/programmation/julia/" project-name "/src/" project-name ".jl"))
	)

(defun my-up-directory ()
	(interactive)
	(unless (vertico-directory-up 1)
		(move-end-of-line nil)
		(backward-char)
		(re-search-backward "/")
		(forward-char)
		(delete-region (point) (line-end-position))
		)
	)

(defun my-add-interactive-time (time-to-add)
	"Utility function to add TIME-TO-ADD IN my today.org file."
	(interactive (list (read-string "Time to add (default=30): " nil nil "30")))

	(let ((the-time (delete-and-extract-region (line-beginning-position) (line-end-position))))
		(insert (my-add-time the-time time-to-add))
		)
	(re-search-forward "TODO\\|DONE")
	(forward-line 1)
	(move-beginning-of-line nil)
	)

(defun my-quit-elfeed ()
	"Quit elfeed"
	(interactive)
	(elfeed-search-quit-window)
	(kill-matching-buffers "^\\*elfeed-search\\*$" nil t)
	(kill-matching-buffers "^\\*elfeed-log\\*$" nil t)
)

(defun call-process-discard-output (program &rest args)
	"Execute program with args without saving any output.
In particular, no temp files are created. TOSEE : Why use eval?"
	(eval (append `(call-process ,program nil nil nil) args)))


(defun my-trash (filename)
	"Use trash-cli to trash file (with system-move-file-to-trash)"
	(call-process-discard-output "trash" filename)
	)

(defalias 'system-move-file-to-trash 'my-trash)

(defun my-show-appt ()
	(interactive)
	(with-output-to-temp-buffer "appt-notifications"
		(cl-loop for notif in appt-time-msg-list
						 do (print (nth 1 notif))
						 )
		)
	)

(defun my-display-ansi-colors ()
	(interactive)
	(ansi-color-apply-on-region (point-min) (point-max)))

(defun my-appt-notification (min-to-app new-time msg)
	(interactive)
	(start-process "my-appt-notification-app" nil "notify-send" "-u" "critical" msg)
	)

(defun my-delete-file-and-buffer ()
	"Kill the current buffer and deletes the file it is visiting."
	(interactive)
	(let ((filename (buffer-file-name)))
		(if filename
				(if (y-or-n-p (concat "Do you really want to delete file " filename " ?"))
						(progn
							(delete-file filename)
							(message "Deleted file %s." filename)
							(kill-buffer)))
			(message "Not a file visiting buffer!"))))

(defun my-dwim-done ()
	"Close stuffs like langtool and org-timer."
	(interactive)
	(cond
	 ((bound-and-true-p langtool-mode-line-message) (langtool-check-done))
	 ((bound-and-true-p org-timer-start-time) (org-timer-stop))
	 (t (message "Nothing to do."))
	 )
	)

(defun my-change-dictionary ()
	"Change dictionary between fr and en."
	(interactive)
	(if (and (boundp 'ispell-local-dictionary) (equal ispell-local-dictionary "fr"))
			(progn
				(my-set-dictionary "en")
				)
		(my-set-dictionary "fr")
		)
	)

(defun my-set-dictionary(lang)
	"Change dictionary for LANG (fr or en)."
	(interactive "s")
	(langtool-switch-default-language lang)
	(ispell-change-dictionary lang)
	(customize-set-variable 'flyspell-mode-line-string (format " Fly:(%s)" lang))
	(if (equal lang "fr")
		(progn
		 (setq google-translate-default-source-language "fr")
		 (setq google-translate-default-target-language "en")
		 )
		(progn
		 (setq google-translate-default-source-language "en")
		 (setq google-translate-default-target-language "fr")
		 )
		)
)

(defun my-wgrep-finish-and-save-buffers()
	"Finish edition in wgrep buffer and save all modified buffers."
	(interactive)
	(wgrep-finish-edit)
	(wgrep-save-all-buffers)
	;; Because wgrep-finish-edit quit wgrep mode
	(wgrep-change-to-wgrep-mode)
	)

;; (defun my-run-zeal ()
;;		"Probably useless."
;;	 (interactive)
;;	 (setq cur-mode (substring (prin1-to-string major-mode) 0 -5))
;;	 (async-shell-command (cl-concatenate 'string "zeal " cur-mode ":"))
;;	 )

(defun my-next-error (&optional reverse)
	"Find next (previous if REVERSE) error with flycheck, next langtool, and finally flyspell. (see js2-mode for javascript)"
	(interactive)
	(cond
	 ((bound-and-true-p flycheck-current-errors) (if reverse (flycheck-previous-error) (flycheck-next-error)))
	 ((bound-and-true-p langtool-mode-line-message) (if reverse (langtool-goto-previous-error) (langtool-goto-next-error)))
	 ((bound-and-true-p flyspell-mode) (if reverse (flyspell-check-previous-highlighted-word) (progn (flyspell-goto-next-error) (flyspell-correct-wrapper))))
	 (t (message "No error found."))
	 )
)

(defun my-previous-error ()
	"Correction with flycheck, next langtool, and finally flyspell (see my-next-error)."
	(interactive)
	(my-next-error t)
	)

(defun my-ement-panta-connect ()
  (interactive)
  (call-interactively #'ement-connect)
	(customize-set-variable 'show-trailing-whitespace nil)
	(cd "~/téléchargements/")
	)

(defun my-ement-panta-connect-new-session ()
  (interactive)
  (ement-connect :uri-prefix "http://localhost:8010" :user-id "@dionisos:matrix.org")
	(customize-set-variable 'show-trailing-whitespace nil)
	)

;; Voir : https://github.com/alphapapa/ement.el/issues/199#issuecomment-1806748506
(defun my-ement-room-send-common-reaction (key position &optional event)
  "Send a reaction."
  (interactive
   (let ((event (ewoc-data (ewoc-locate ement-ewoc))))
     (unless (ement-event-p event)
       (user-error "No event at point"))
     (list (minibuffer-with-setup-hook
               (lambda ()
                 (activate-input-method 'emoji)
                 (push ?r unread-command-events)
                 (call-interactively #'emoji-insert))
             (read-string "Reaction: "))
           (point)
           event)))
  (ement-room-send-reaction key position event))

(provide 'my-functions)
;;; my-functions.el ends here
