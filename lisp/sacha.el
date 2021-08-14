; found here https://sachachua.com/dotemacs/#org44c0da3

(require 'dash)
(require 'dash-functional)
(defmacro my/convert-shell-scripts-to-interactive-commands (directory)
  "Make the shell scripts in DIRECTORY available as interactive commands."
  (cons 'progn
        (-map
         (lambda (filename)
           (let ((function-name (intern (concat "myshell/" (file-name-nondirectory filename)))))
             `(defun ,function-name (&rest args)
                (interactive)
                (cond
                 ((not (called-interactively-p 'any))
                  (shell-command-to-string (mapconcat 'shell-quote-argument (cons ,filename args) " ")))
                 ((region-active-p)
                  (apply 'call-process-region (point) (mark) ,filename nil (if current-prefix-arg t nil) t args))
                 (t
                  (apply 'call-process ,filename nil (if current-prefix-arg t nil) nil args))))))
         (-filter (-not #'file-directory-p)
                  (-filter #'file-executable-p (directory-files directory t))))))

(my/convert-shell-scripts-to-interactive-commands "~/scripts")
