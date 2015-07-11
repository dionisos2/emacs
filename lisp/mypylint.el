;; ;; Configure flymake for Python
;; (setq pylint "epylint")
;; (when (load "flymake" t)
;;   (defun flymake-pylint-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list (expand-file-name pylint "") (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pylint-init)))

;; ;; Set as a minor mode for Python
;; (add-hook 'python-mode-hook '(lambda () (flymake-mode)))

;; ;; Configure to wait a bit longer after edits before starting
;; (setq-default flymake-no-changes-timeout '3)

;; ;; Keymaps to navigate to the errors
;; (add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-cn" 'flymake-goto-next-error)))
;; (add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-cp" 'flymake-goto-prev-error)))

;; (defadvice flymake-goto-next-error (after display-message activate compile)
;;   "Display the error in the mini-buffer rather than having to mouse over it"
;;   (show-fly-err-at-point))

;; (defadvice flymake-goto-prev-error (after display-message activate compile)
;;   "Display the error in the mini-buffer rather than having to mouse over it"
;;   (show-fly-err-at-point))
