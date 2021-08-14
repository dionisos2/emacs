;;; my-functions.el --- Some helper function that use packages  -*- lexical-binding: t -*-
;;; Commentary:
;;; See ./my-basics.el and go to "Functions" to see others defined functions.

;;; Code:

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
;; 	"Probably useless."
;;   (interactive)
;;   (setq cur-mode (substring (prin1-to-string major-mode) 0 -5))
;;   (async-shell-command (cl-concatenate 'string "zeal " cur-mode ":"))
;;   )

(defun my-next-error (&optional reverse)
	"Find next (previous if REVERSE) error with flycheck, next langtool, and finally flyspell."
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


(provide 'my-functions)
;;; my-functions.el ends here
