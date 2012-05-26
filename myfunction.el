(defun kill-buffer-and-maybe-window ()
	(interactive)
	(if (> (length (window-list)) 1) (kill-buffer-and-window) (kill-buffer)))


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
	(langtool-goto-previous-error)
	(langtool-show-message-at-point))

(defun my-next-error ()
	(interactive)
	(langtool-goto-next-error)
	(langtool-show-message-at-point))

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
	(find-file "~/.emacs.d/key.el"))


(setq recentf-path "~/.emacs.d/recentf")
(defun show-recentf()
	(interactive)
	(find-file recentf-path))

(defun add-file-to-recentf()
	(interactive)
	(shell-command (concatenate 'string "echo " (buffer-file-name) " >> " recentf-path)))


(defun base-name (file-name)
  (replace-regexp-in-string ".[a-z_-A-Z]*$" "" file-name))

(defun replace-extention (file-name extention)
	(concatenate 'string (base-name file-name) extention))

