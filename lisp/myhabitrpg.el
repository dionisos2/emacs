;;; myhabitrpg.el --- base config for habitrpg.el
;;; Commentary:
;; Tag (in org-mode) your habits and dailys with `hrpghabit`,
;; `hrpgdaily`, and `hrpgreward` to get them in the corresponding
;; categories.

(require 'org-habit)
(load "~/.emacs.d/habitrpg/habitrpg/habitrpg.el")
;;; Code:
(add-hook 'org-after-todo-state-change-hook 'habitrpg-add 'append)

;; Status buffer - use C-h m to see the keybindings
;; C-c C-c - upvote task or buy reward
;; C-c C-d - downvote task
;; t - bring up manage menu, which adds or deletes tasks

;; Continuously update a habit attache to a clocking task
(add-hook 'org-clock-in-hook 'habitrpg-clock-in)
(add-hook 'org-clock-out-hook 'habitrpg-clock-out)
;; List of habits to check for when clocking a task
(add-to-list 'hrpg-tags-list "PROGRAMMING")
(add-to-list 'hrpg-tags-list "WORK")
(setq habitrpg-api-user "47409638-67db-46c4-9a1a-94dfbccd2748")
(setq habitrpg-api-token "6dd1ce40-9f35-4188-96c8-b9cf9f5a0ebf")

(provide 'myhabitrpg)
;;; myhabitrpg.el ends here
