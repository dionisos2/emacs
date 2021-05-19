(recentf-mode 1)

;; (diredp-toggle-find-file-reuse-dir 1)

(elpy-enable)

(company-statistics-mode)
;; (dired-quick-sort-setup)

;; activate desactivated function
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'upcase-region 'disabled nil)


(fset 'yes-or-no-p 'y-or-n-p)

;; M-x all-the-icons-install-fonts
(all-the-icons-ivy-setup)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(paradox-enable)
