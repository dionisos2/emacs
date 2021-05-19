;;; myfunction.el --- useful personnal functions  -*- lexical-binding: t -*-
;;; Commentary:
;;; lexical-binding is necessary for the lambda function.

;;; Code:


(defun my-parse-time-string (time-string)
	"Parse TIME-STRING in format '10h35'."
	(interactive "s")
	(let* ((hour (nth 0 (s-split "h" time-string)))
				 (min (nth 1 (s-split "h" time-string))))
		;; The ` evaluate every expression starting with , inside the list.
		`(0 ,(string-to-number min) ,(string-to-number hour) 0 0 2000)
		)
	)

(defun my-add-time (time-string-1 time-string-2)
	"Add TIME-STRING-1 and TIME-STRING-2 in format '10h35'."
	(let* (
				 (ti1 (my-parse-time-string time-string-1))
				 (ti2 (my-parse-time-string time-string-2)))

		(format-time-string "%Hh%M" (time-add
																 (apply #'encode-time ti1)
																 (+
																	(* (nth 1 ti2) 60)
																	(* (nth 2 ti2) 3600)
																	)
																 )
												)
		)
	)

(defun my-sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


(defun my-term-insert-literal ()
  "Take a keypress KEY and insert it literally into a terminal."
  (interactive)
	(let ((key (read-key)))
		(message (format "%s" key))
		(term-send-raw-string (format "%c" key))
		)
  )

;; wgrep-change-to-wgrep-mode directly added in ivy-occur because ivy-exit-with-action seem to abort the function (TOFIX)
(defun my-ivy-occur-and-wgrep ()
  "Stop completion and put the current candidates into a new buffer.

The new buffer remembers current action(s).

While in the *ivy-occur* buffer, selecting a candidate with RET or
a mouse click will call the appropriate action for that candidate.

There is no limit on the number of *ivy-occur* buffers."
  (interactive)
  (if (not (window-minibuffer-p))
      (user-error "No completion session is active")
    (let* ((caller (ivy-state-caller ivy-last))
           (occur-fn (or (plist-get ivy--occurs-list caller)
                         #'ivy--occur-default))
           (buffer
            (generate-new-buffer
             (format "*ivy-occur%s \"%s\"*"
                     (if caller
                         (concat " " (prin1-to-string caller))
                       "")
                     ivy-text))))
      (with-current-buffer buffer
        (funcall occur-fn ivy--old-cands)
        (setf (ivy-state-text ivy-last) ivy-text)
        (setq ivy-occur-last ivy-last))
      (ivy-exit-with-action
       (lambda (_)
         (pop-to-buffer buffer)
         (setq next-error-last-buffer buffer)
         (setq-local next-error-function #'ivy-occur-next-error)
				 (wgrep-change-to-wgrep-mode)))
			)))

(defun my-wgrep-finish-and-save-buffers()
	(interactive)
	(wgrep-finish-edit)
	(wgrep-save-all-buffers)
	;; Because wgrep-finish-edit quit wgrep mode
	(wgrep-change-to-wgrep-mode)
	)

(defun my-term ()
  "My personal term command."
  (interactive)
  (set-buffer (make-term "terminal" explicit-shell-file-name))
  (term-mode)
  (term-char-mode)
  (switch-to-buffer "*terminal*"))

(defun my-term-toggle-mode ()
  "Toggles term between line mode and char mode"
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(defun my-run-zeal ()
  (interactive)
  (setq cur-mode (substring (prin1-to-string major-mode) 0 -5))
  (async-shell-command (cl-concatenate 'string "zeal " cur-mode ":"))
  )

(defun my-buffer-path-to-ring ()
  "copy buffer's full path to kill ring"
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))))

(defun my-kill-boring-buffer()
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
  )

;; (defun my-helm-company()
;;   (interactive)
;;   (if (equal (length company-candidates) 1)
;;       (company-complete-selection)
;;     (helm-company)))

(defun org-tags-view-only-todo()
  (interactive)
  (org-tags-view t))

(defun my-kill-buffer ()
  "Kill without asking."
  (interactive)
  (kill-buffer))

(defun kill-buffer-and-maybe-window ()
  "Kill the windows only if it isn’t the last."
  (interactive)
  (if (> (length (window-list)) 1) (kill-buffer-and-window) (kill-buffer)))

;; (defun my-next-line ()
;;   "Next-line or helm-next-line."
;;   (interactive)
;;   (if helm-alive-p
;;       (helm-next-line)
;;     (next-line)))


(defun my-previous-line ()
  "Next-line or helm-next-line."
  (interactive)
  (if helm-alive-p
      (helm-previous-line)
    (previous-line)))

(defun my-previous-error ()
  (interactive)
  (if langtool-mode-line-message
			(progn
				(langtool-goto-previous-error)
				(langtool-show-message-at-point))
		(progn
			(flycheck-previous-error)
			(flycheck-display-error-at-point))))

(defun my-next-error ()
  (interactive)
  (if langtool-mode-line-message
			(progn
				(langtool-goto-next-error)
				(langtool-show-message-at-point))
		(progn
			(flycheck-next-error)
			(flycheck-display-error-at-point))))

(defcustom execute-command (purecopy "./game&")
  "Last shell command used to do a execution; default for next execution."
  :type 'string
  :group 'execution)

(defun execute()
  (interactive)
  (start-process-shell-command "execution_process" "*execution*" execute-command))

(defun my-shell-command-on-region()
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "bash" t))

(defun my-deactivate-mark()
  (interactive)
  (deactivate-mark))

(defun select-line()
  (interactive)
  (move-beginning-of-line nil)
  (set-mark-command nil)
  (move-end-of-line nil))

(defun select-word()
  (interactive)
  (if (/= (point) (point-max)) (forward-char))
  (forward-word -1)
  (set-mark-command nil)
  (forward-word 1))

(defun select-symbol()
  (interactive)
  (if (/= (point) (point-max)) (forward-char))
  (forward-symbol -1)
  (set-mark-command nil)
  (forward-symbol 1))

(defun show-key-el()
  (interactive)
  (find-file "~/.emacs.d/lisp/my-key.el"))

(defun echo-date()
  (interactive)
  (shell-command "date '+%Hh%M'" 't)
  (forward-word)
  (delete-char 1))

(defun save-buffer-always ()
  "Save the buffer even if it is not modified."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

(defun revert-all-buffers ()
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


(defun my-ask-before-killing-buffer ()
  "Ask before killing user buffer."
  (interactive)
  (let ((user-buff-p (if (or
													(string-match  "^ \\|\\*" (buffer-name))
													(get-buffer-process (buffer-name))
													(buffer-file-name)) nil t)))

    ;; Ask to save modified buffer
    (if (and user-buff-p (buffer-modified-p))
        (when (y-or-n-p (format "`%s' was modified; still kill it? " (buffer-name))) 1)
      1)))

;; (add-to-list 'kill-buffer-query-functions 'my-ask-before-killing-buffer)


(provide 'myfunction)
;;; myfunction.el ends here
