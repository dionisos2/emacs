;;; my-ivy.el --- summary -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; voir https://emacs.stackexchange.com/questions/36745/enable-ivy-fuzzy-matching-everywhere-except-in-swiper

;; (setq ivy-re-builders-alist
;;       '(
;; 				(swiper . ivy--regex-plus)
;;         (t      . ivy--regex-fuzzy)
;; 				))


;;; voir https://github.com/abo-abo/swiper/issues/2267
;; (use-package ivy
;;   :ensure t
;;   :defer nil
;;   :config
;;   (setq ivy-initial-inputs-alist '((counsel-minor . "^+")
;;                                    (counsel-package . "^+")
;;                                    (org-agenda-refile . "^")
;;                                    (org-capture-refile . "^")
;;                                    (Man-completion-table . "^")
;;                                    (woman . "^"))))


;;; voir https://github.com/abo-abo/swiper/issues/381
;; (defun ivy-yank-action (x)
;;   (kill-new x))

;; (defun ivy-copy-to-buffer-action (x)
;;   (with-ivy-window
;;     (insert x)))

;; (ivy-set-actions
;;  t
;;  '(("i" ivy-copy-to-buffer-action "insert")
;;    ("y" ivy-yank-action "yank")))

;; (defun re_digit(str)
;; 		"\\d→[0-9]."
;; 		(replace-regexp-in-string "\\\\d" "[0-9]" str 1)
;; )

;; (defun re_not_digit(str)
;; 		"\\D→[^0-9]."
;; 		(replace-regexp-in-string "\\\\D" "[^0-9]" str 1)
;; )

;; (defun my--regex(str)
;; 	"Convert STR as a regex but with my regex classes."
;; 	(ivy--regex-plus (re_digit (re_not_digit str)))
;; 	)

;; (setq ivy-re-builders-alist
;;       '(
;;         (t      . my--regex)
;; 				))

(provide 'my-ivy)

;;; my-ivy.el ends here
