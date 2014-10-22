(require 'org-install)

;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on

(setq org-clock-persist 'nil)
(org-clock-persistence-insinuate)
(setq org-clock-history-length 28)
(setq org-clock-in-resume t)
;(setq org-clock-in-switch-to-state (quote clock-in-to-next))

(setq org-agenda-files (list "~/.life.org"
                             "~/projet/programmation/c++/pong/TODOS.org"))