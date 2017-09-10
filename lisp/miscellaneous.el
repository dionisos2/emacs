(recentf-mode 1)
(global-undo-tree-mode)
(global-company-mode 1)
(diredp-toggle-find-file-reuse-dir 1)
(helm-mode 1)
(elpy-enable)
(pdf-tools-install)

(setenv "IPY_TEST_SIMPLE_PROMPT" "1")

(setq custom-file "~/.emacs.d/lisp/my-custom.el")
(load custom-file)
(fset 'yes-or-no-p 'y-or-n-p)

(defvar first-open "non")
(if (equal first-open "non") (find-file "~/.emacs.d/lisp/myemacs.el"))
(setq first-open "oui")
;; (setq inhibit-message t)
