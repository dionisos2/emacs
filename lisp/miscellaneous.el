(recentf-mode 1)
(global-company-mode 1)
(diredp-toggle-find-file-reuse-dir 1)
(helm-mode 1)
(elpy-enable)
;; (pdf-tools-install)
(openwith-mode t)
(company-statistics-mode)

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'upcase-region 'disabled nil)

(setenv "IPY_TEST_SIMPLE_PROMPT" "1")

(setq custom-file "~/.emacs.d/lisp/my-custom.el")
(load custom-file)
(fset 'yes-or-no-p 'y-or-n-p)

(defvar first-open "non")
(if (equal first-open "non") (find-file "~/.emacs.d/lisp/myemacs.el"))
(setq first-open "oui")

(defun my-turn-on-undo-tree-mode (&optional print-message)
  "Enable `undo-tree-mode' in the current buffer, when appropriate."
  (interactive "p")
  (if (memq major-mode undo-tree-incompatible-major-modes)
      (when print-message
	(message "Buffer does not support undo-tree-mode;\
 undo-tree-mode NOT enabled"))
    (undo-tree-mode 1)))

(define-globalized-minor-mode my-global-undo-tree-mode undo-tree-mode my-turn-on-undo-tree-mode)
(my-global-undo-tree-mode)
;; (setq inhibit-message t)
