;;; myfunction.el --- useful personnal functions
;;; Commentary:
;; nothing special

;;; Code:

;; (defun rename-ein-buffer()
;;   (interactive)
;;   ()

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
  )

(defun my-helm-company()
  (interactive)
  (if (equal (length company-candidates) 1)
      (company-complete-selection)
    (helm-company)))

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

(defun my-next-line ()
  "Next-line or helm-next-line."
  (interactive)
  (if helm-alive-p
      (helm-next-line)
    (next-line)))


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

(add-to-list 'kill-buffer-query-functions 'my-ask-before-killing-buffer)

;; (defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
;;   "Create parent directory if not exists while visiting file."
;;   (unless (file-exists-p filename)
;;     (let ((dir (file-name-directory filename)))
;;       (unless (file-exists-p dir)
;;         (make-directory dir)))))

;; (defadvice write-file (before make-directory-maybe (filename &optional wildcards) activate)
;;   "Create parent directory if not exists while visiting file."
;;   (unless (file-exists-p filename)
;;     (let ((dir (file-name-directory filename)))
;;       (unless (file-exists-p dir)
;;         (make-directory dir)))))


;; (defun cp_to_ukratio ()
;;   "Run the cp_to_ukratio command on this file."
;;   (interactive)
;;   (print (concatenate 'string "transfert for " buffer-file-truename))
;;   (start-process-shell-command "execution_process" "*transfert-to-ukratio*" (concatenate 'string "cp_to_ukratio " buffer-file-truename))
;;   (switch-to-buffer "*transfert-to-ukratio*"))


;; (defun phpcbf ()
;;   "Run phpcbf on the current file."
;;   (interactive)
;;   (progn
;;     (let
;;         ((my-command "phpcbf --standard=/home/dionisos/projets/programmation/http/private/communautheque/ruleset.xml "))
;;       (print (concatenate 'string  my-command buffer-file-truename))
;;       (call-process-shell-command (concatenate 'string my-command buffer-file-truename))
;;       (revert-buffer nil 't)
;;       (delete-trailing-whitespace)
;;       (save-buffer))))


;; (setq preview-latex-prout nil)
;; (defun toggle-preview-latex()
;;   (interactive)
;;   (if preview-latex-prout
;;       (progn (preview-clearout)
;;              (setq preview-latex-prout nil))
;;     (progn (preview-document)
;;            (setq preview-latex-prout t))))

;; (defvar selection)

;; (defun go-qt4-help(&optional class_name)
;;   (interactive)
;;   (progn
;;     (select-word)
;;     (setq selection (buffer-substring-no-properties (region-beginning) (region-end)))
;;     (w3-find-file "/usr/share/qt4/doc/html/classes.html")
;;     (add-to-list 'search-ring selection)
;;     (isearch-forward)
;;     )
;;   )

;; (defun recentf-open-files-compl ()
;;   (interactive)
;;   (let* ((all-files recentf-list)
;; 		 (tocpl (mapcar (function
;; 						 (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
;; 		 (prompt (append '("Recent File name: ") tocpl))
;; 		 (fname (completing-read (car prompt) (cdr prompt) nil nil)))
;; 	(find-file (or (cdr (assoc fname tocpl))
;; 				   fname))))


;; (setq recentf-path "~/.emacs.d/recentf")
;; (defun show-recentf()
;;   (interactive)
;;   (find-file recentf-path))

;; (defun add-file-to-recentf()
;;   (interactive)
;;   (shell-command (concatenate 'string "echo " (buffer-file-name) " >> " recentf-path)))


;; (defun base-name (file-name)
;;   (replace-regexp-in-string ".[a-z_-A-Z]*$" "" file-name))

;; (defun replace-extention (file-name extention)
;;   (concatenate 'string (base-name file-name) extention))


;; (defun doc-view-rotate-current-page ()
;;   "Rotate the current page by 90 degrees.
;; Requires ImageMagick installation"
;;   (interactive)
;;   (when (eq major-mode 'doc-view-mode)
;;     ;; we are assuming current doc-view internals about cache-names
;;     (let ((file-name (expand-file-name (format "page-%d.png" (doc-view-current-page)) (doc-view-current-cache-dir))))
;;       ;; assume imagemagick is installed and rotate file in-place and redisplay buffer
;;       (call-process-shell-command "convert" nil nil nil "-rotate" "90" file-name file-name)
;;       (clear-image-cache)
;;       (doc-view-goto-page (doc-view-current-page)))))

(provide 'myfunction)
;;; myfunction.el ends here
