;;; my-functions.el --- Some helper function that use packages	-*- lexical-binding: t -*-
;;; Commentary:
;;; See ./my-basics.el and go to "Functions" to see others defined functions.

;;; Code:

(require 'ansi-color)
(require 'my-basics)
(require 'python)
(require 'julia-mode)
(require 'julia-repl)
(require 'elfeed-search)
(require 'appt)
(require 'langtool)
(require 'google-translate-default-ui)
(require 'wgrep)
(require 'flycheck)
(require 'flyspell)
(require 'notmuch)
(require 'magit-mode)

(defun my-org-set-time-today ()
	"Set time to today in `org-agenda'."
	(interactive)
	(org-agenda-schedule nil (format-time-string "%Y-%m-%d"))
	)

(defun my-python-eval-region ()
	"Eval a region with python."
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
	"Eval a buffer with python."
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
	"Eval a region with julia."
	(interactive)
	(julia-repl-activate-parent nil)
	(julia-repl-send-region-or-line)
	)

(defun my-julia-eval-buffer ()
	"Eval a buffer with julia."
	(interactive)
	(julia-repl-inferior-buffer)
	(julia-repl-activate-parent nil)
	(julia-repl-send-buffer nil)
)

(defun my-create-julia-project (project-name)
	"Create a new project PROJECT-NAME with create_julia_project.jl."
	(interactive "s")
	(shell-command (cl-concatenate 'string "julia /home/dionisos/scripts/create_julia_project.jl " project-name))
	(find-file (cl-concatenate 'string "/home/dionisos/projets/programmation/julia/" project-name "/src/" project-name ".jl"))
	)

(defun my-up-directory ()
	"Go up one directory in vertico."
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
	"Quit elfeed."
	(interactive)
	(elfeed-search-quit-window)
	(kill-matching-buffers "^\\*elfeed-search\\*$" nil t)
	(kill-matching-buffers "^\\*elfeed-log\\*$" nil t)
)

(defun call-process-discard-output (program &rest args)
	"Execute PROGRAM with ARGS without saving any output.
In particular, no temp files are created.  TOSEE : Why use eval?"
	(eval (append `(call-process ,program nil nil nil) args)))


(defun my-trash (filename)
	"Use trash-cli to trash FILENAME (with system-move-file-to-trash)."
	(call-process-discard-output "trash" filename)
	)

(defalias 'system-move-file-to-trash 'my-trash)

(defun my-show-appt ()
	"Show all current appt clocks."
	(interactive)
	(with-output-to-temp-buffer "appt-notifications"
		(cl-loop for notif in appt-time-msg-list
						 do (print (nth 1 notif))
						 )
		)
	)

(defun my-display-ansi-colors ()
	"I don't know what this is."
	(interactive)
	(ansi-color-apply-on-region (point-min) (point-max)))

(defun my-appt-notification (_min-to-app _new-time msg)
	"Function used for creating notifications with MSG message.
MIN-TO-APP NEW-TIME parameters not used."
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
	(if (and (boundp 'ispell-local-dictionary) (equal ispell-local-dictionary en-dict))
			(my-set-dictionary fr-dict)
		(my-set-dictionary en-dict)
		)
	)

(defun my-set-dictionary(lang)
	"Change dictionary for LANG (fr or en)."
	(interactive "s")
	(flyspell-mode)
	(ispell-change-dictionary lang)
	(customize-set-variable 'flyspell-mode-line-string (format " Fly:(%s)" lang))
	(if (equal lang fr-dict)
			(progn
				(langtool-switch-default-language "fr")
				(setq google-translate-default-source-language "fr")
				(setq google-translate-default-target-language "en")
				)
		(progn
			(langtool-switch-default-language "en")
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
	"Find next (previous if REVERSE) error with flycheck, langtool, and then flyspell.
See js2-mode for javascript."
	(interactive)
	(cond
	 ((bound-and-true-p flycheck-current-errors) (if reverse (flycheck-previous-error) (flycheck-next-error)))
	 ((bound-and-true-p langtool-mode-line-message) (if reverse (langtool-goto-previous-error) (langtool-goto-next-error)))
	 ((bound-and-true-p flyspell-mode) (if reverse (flyspell-check-previous-highlighted-word) (progn (flyspell-goto-next-error) (flyspell-correct-wrapper))))
	 (t (message "No error found."))
	 )
)

(defun my-previous-error ()
	"Correction with flycheck, langtool, and then flyspell (see my-next-error)."
	(interactive)
	(my-next-error t)
	)

(defun my-ement-change-directory ()
	"Default directory for ement."
	(cd "~/"))

(defun my-ement-panta-connect ()
	"Connect to Pantalaimon with Ement."
  (interactive)
  (call-interactively #'ement-connect)
	(customize-set-variable 'show-trailing-whitespace nil)
	)

(defun my-ement-panta-connect-new-session ()
	"Connect to Pantalaimon with Ement, creating a new session."
  (interactive)
  (ement-connect :uri-prefix "http://localhost:8010" :user-id "@dionisos:matrix.org")
	(customize-set-variable 'show-trailing-whitespace nil)
	)

;; Voir : https://github.com/alphapapa/ement.el/issues/199#issuecomment-1806748506
;; (defun my-ement-room-send-common-reaction (key position &optional event)
;;   "Send a reaction."
;;   (interactive
;;    (let ((event (ewoc-data (ewoc-locate ement-ewoc))))
;;      (unless (ement-event-p event)
;;        (user-error "No event at point"))
;;      (list (minibuffer-with-setup-hook
;;                (lambda ()
;;                  (activate-input-method 'emoji)
;;                  (push ?r unread-command-events)
;;                  (call-interactively #'emoji-insert))
;;              (read-string "Reaction: "))
;;            (point)
;;            event)))
;;   (ement-room-send-reaction key position event))

(defun my-previous-actionable-text ()
	"Fin the previous text with a keymap in text property."
	(interactive)
	(text-property-search-backward 'keymap)
	)

(defun my-next-actionable-text ()
	"Fin the next text with a keymap in text property."
	(interactive)
	(forward-char)
	(text-property-search-forward 'keymap)
	(backward-char)
	)

(defun my-ement-room-image-show (pos)
  "show image at pos in a new buffer."
  (interactive "d")
  (pcase-let* ((image (copy-sequence (get-text-property pos 'display)))
               (ement-event (ewoc-data (ewoc-locate ement-ewoc pos)))
               ((cl-struct ement-event id) ement-event)
               (buffer-name (format "*ement image: %s*" id)))
    (when (fboundp 'imagemagick-types)
      ;; only do this when imagemagick is supported.
      ;; fixme: when requiring emacs 27+, remove this (i guess?).
      (setf (image-property image :type) 'imagemagick))
    (setf (image-property image :scale) 1.0
          (image-property image :max-width) nil
          (image-property image :max-height) nil)
    (unless (get-buffer buffer-name)
      (with-current-buffer (get-buffer-create buffer-name)
        (erase-buffer)
        (insert-image image)
        (image-mode)))
		(switch-to-buffer buffer-name)
		))


(defun my-notmuch-delete(&optional beg end)
	"Add a deleted tag to item from BEG to END."
	(interactive)
	(notmuch-search-add-tag '("+deleted") beg end)
	)

(defun my-notmuch-unread-down()
	"Add a unread tag and then go down."
	(interactive)
	(notmuch-search-add-tag '("+unread"))
	(forward-line)
	)

(defun my-notmuch-delete-down()
	"Add a deleted tag and then go down."
	(interactive)
	(my-notmuch-delete)
	(forward-line)
	)

(defun my-quit-magit()
	"Completely quit magit."
	(interactive)
	(magit-mode-bury-buffer 16)
	)

(defun my-emoji-search()
	"Enable recursive minibuffer to allow inserting emoji."
	(interactive)
	(let ((enable-recursive-minibuffers t))
		(call-interactively #'emoji-search))
	)

(defun my-persp-remove-current-buffer ()
  "Remove current buffer from current perspective without prompting."
  (interactive)
  (persp-remove-buffer (current-buffer)))

(defvar my-tiddly-perso-path "~/projets/RD/tiddly_perso/Wikis/BobWiki/tiddlers/"
  "Tiddlers directory")

(defun my-tiddly-perso-open-tiddler-list ()
  "TiddlyPerso tiddlers directory."
  (directory-files my-tiddly-perso-path t "^[^.$].*")
	)

(defun my-tiddly-perso-open-tiddler ()
  "Find a tiddler by its filename."
  (interactive)
  (let* ((files (my-tiddly-perso-open-tiddler-list))
         (file (completing-read "Choisir un fichier : " (mapcar #'file-name-nondirectory files))))
    (when file
      (find-file (expand-file-name file my-tiddly-perso-path)))))

(defun my-tiddly-perso-grep-tiddler ()
  "Find tiddler by its contents"
  (interactive)
  (let (
				(consult-ripgrep-args (concat consult-ripgrep-args " --glob !*\\$*"))
				)
  (consult-ripgrep my-tiddly-perso-path))
	)

(defun my-current-timestamp ()
  "Current date in format :
year/month/day/hour/minute/seconde/milliseconde."
  (interactive)
  (let* ((now (current-time))
         (seconds (nth 1 now))
         (microseconds (nth 2 now))
         (milliseconds (/ microseconds 1000))
         (time-str (format-time-string "%Y%m%d%H%M%S" now)))
    (message "%s%03d" time-str milliseconds)))

(defun my-tiddly-perso-create-tiddler (tiddlername)
  "Create a tiddler."
  (interactive "sTiddler name: ")
	(let ((filename (concat tiddlername ".tid")))
		(when (string-match-p " " filename)
			(error "Name should not contain space"))
		(let ((full-path (expand-file-name filename my-tiddly-perso-path)))
			(when (file-exists-p full-path)
				(error "file '%s' already exists" filename))
			(find-file full-path)
			(insert (format "created: %s\nmodified: %s\ntitle: %s\nuuid : %s\ntags: Contenu Bordel\n\n! Description" (my-current-timestamp) (my-current-timestamp) tiddlername tiddlername))
			(save-buffer)
			(message "Tiddler '%s' created" tiddlername))
		)
	)

(provide 'my-functions)
;;; my-functions.el ends here
