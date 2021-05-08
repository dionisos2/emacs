(recentf-mode 1)

(setq custom-file "~/.emacs.d/lisp/my-custom.el")
(load custom-file)

(diredp-toggle-find-file-reuse-dir 1)

(elpy-enable)

(company-statistics-mode)
(dired-quick-sort-setup)

;; activate desactivated function
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'upcase-region 'disabled nil)


(fset 'yes-or-no-p 'y-or-n-p)

(defvar first-open "non")
(if (equal first-open "non") (find-file "~/.emacs.d/lisp/myemacs.el"))
(setq first-open "oui")

