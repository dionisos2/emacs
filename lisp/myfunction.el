;;; myfunction.el --- useful personnal functions
;;; Commentary:
;; nothing special

;;; Code:
(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))

(defadvice write-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))

(defun org-tags-view-only-todo()
  (interactive)
  (org-tags-view t))

(defun kill-buffer-and-maybe-window ()
	(interactive)
	(if (> (length (window-list)) 1) (kill-buffer-and-window) (kill-buffer)))

(defun cp_to_ukratio ()
  (interactive)
  (print (concatenate 'string "transfert for " buffer-file-truename))
  (start-process-shell-command "execution_process" "*transfert-to-ukratio*" (concatenate 'string "cp_to_ukratio " buffer-file-truename))
  (switch-to-buffer "*transfert-to-ukratio*"))




(defun find-next-tag ()
  (interactive)
	(find-tag last-tag 1))

(defun ecb-mylayout()(interactive)(ecb-layout-switch "mylayout"))

(defun ecb-dir-speedbar()(interactive)(ecb-layout-switch "left-dir-plus-speedbar"))
;(defun svn_my_commit()(interactive)(shell-command "svn cleanup")(shell-command "svn commit")) ;; bug :(
;(defun svn_my_update()(interactive)(shell-command "svn update"))


(setq preview-latex-prout nil)
(defun toggle-preview-latex()
	(interactive)
	(if preview-latex-prout
			(progn (preview-clearout)
						 (setq preview-latex-prout nil))
		(progn (preview-document)
					 (setq preview-latex-prout t))))


(defun my-previous-error ()
  (interactive)
  (if langtool-buffer-process
	  (progn
		(langtool-goto-previous-error)
		(langtool-show-message-at-point))
	(progn
	  (flycheck-previous-error)
	  (flycheck-display-error-at-point))))

(defun my-next-error ()
  (interactive)
  (if langtool-buffer-process
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

(defun my-shell-command-on-region() (interactive)(shell-command-on-region (region-beginning) (region-end) "bash" t))


(defun next-word()
	(interactive)
	(forward-word 1))


(defun previous-word()
	(interactive)
	(forward-word -1))


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


(defvar selection)

(defun go-qt4-help(&optional class_name)
	(interactive)
	(progn
		(select-word)
		(setq selection (buffer-substring-no-properties (region-beginning) (region-end)))
		(w3-find-file "/usr/share/qt4/doc/html/classes.html")
		(add-to-list 'search-ring selection)
		(isearch-forward)
		)
	)


(defun recentf-open-files-compl ()
	(interactive)
	(let* ((all-files recentf-list)
				 (tocpl (mapcar (function
												 (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
				 (prompt (append '("Recent File name: ") tocpl))
				 (fname (completing-read (car prompt) (cdr prompt) nil nil)))
		(find-file (or (cdr (assoc fname tocpl))
									 fname))))

(defun show-key-el()
	(interactive)
	(find-file "~/.emacs.d/lisp/key.el"))


(setq recentf-path "~/.emacs.d/recentf")
(defun show-recentf()
	(interactive)
	(find-file recentf-path))

(defun add-file-to-recentf()
	(interactive)
	(shell-command (concatenate 'string "echo " (buffer-file-name) " >> " recentf-path)))

(defun echo-date()
  (interactive)
  (shell-command "date '+%Hh%M'" 't)
  (next-word)
  (delete-forward-char 1))

(defun base-name (file-name)
  (replace-regexp-in-string ".[a-z_-A-Z]*$" "" file-name))

(defun replace-extention (file-name extention)
	(concatenate 'string (base-name file-name) extention))

(defun doc-view-rotate-current-page ()
  "Rotate the current page by 90 degrees.
Requires ImageMagick installation"
  (interactive)
  (when (eq major-mode 'doc-view-mode)
    ;; we are assuming current doc-view internals about cache-names
    (let ((file-name (expand-file-name (format "page-%d.png" (doc-view-current-page)) (doc-view-current-cache-dir))))
      ;; assume imagemagick is installed and rotate file in-place and redisplay buffer
      (call-process-shell-command "convert" nil nil nil "-rotate" "90" file-name file-name)
      (clear-image-cache)
      (doc-view-goto-page (doc-view-current-page)))))
