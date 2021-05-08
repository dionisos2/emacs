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

;; (flycheck-add-next-checker 'c/c++-cppcheck '(warning . cstyle))

;; (flycheck-define-checker my-php-checker
;;   "A PHP syntax checker using the PHP command line interpreter."
;;   :command ("php" "-l" "-d" "error_reporting=E_ALL" "-d" "display_errors=1"
;; 			"-d" "log_errors=0")
;;   :standard-input t
;;   :error-patterns
;;   ((error line-start (or "Parse" "Fatal" "syntax") " error" (any ":" ",") " "
;; 		  (message) " in - on line " line line-end))
;;   :modes (php-mode php+-mode web-mode)
;;   :next-checkers ((warning . my-php-phpcs)))

;; (flycheck-define-checker my-php-phpcs
;;   "A PHP style checker using PHP Code Sniffer."

;;   :command ("phpcs" "--report=checkstyle" "--standard=~/projets/programmation/http/private/communautheque/ruleset.xml"
;; 			(option "--standard=" flycheck-phpcs-standard concat)
;; 			;; Pass original file name to phpcs.  We need to concat explicitly
;; 			;; here, because phpcs really insists to get option and argument as
;; 			;; a single command line argument :|
;; 			(eval (when (buffer-file-name)
;; 					(concat "--stdin-path=" (buffer-file-name)))))
;;   :standard-input t
;;   :error-parser flycheck-parse-checkstyle
;;   :error-filter
;;   (lambda (errors)
;; 	(flycheck-sanitize-errors
;; 	 (flycheck-remove-error-file-names "STDIN" errors)))
;;   :modes (php-mode php+-mode web-mode)
;;   ;; phpcs seems to choke on empty standard input, hence skip phpcs if the
;;   ;; buffer is empty, see https://github.com/flycheck/flycheck/issues/907
;;   :predicate (lambda () (> (buffer-size) 0)))


;; (add-to-list 'flycheck-checkers 'my-php-phpcs)
;; (add-to-list 'flycheck-checkers 'my-php-checker)
