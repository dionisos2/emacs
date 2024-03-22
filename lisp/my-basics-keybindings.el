;;; my-basics-keybindings.el --- anything that works without added package  -*- lexical-binding: t -*-
;;; Commentary:
;;; Create all basics keybindings.

;;; Code:

(require 'org)
(require 'org-agenda)
(require 'org-timer)
(require 'term)
(require 'abbrev)
(require 'custom)
(require 'auth-source)
(require 'doc-view)
(require 'view)
(require 'ido)


;; Define prefixes
;;; Files and buffers manipulation
(define-prefix-command 'file-move-prefix)
(global-set-key (kbd "C-t") 'file-move-prefix)
;;; Edition and navigation in buffer
(define-prefix-command 'edition-prefix)
(global-set-key (kbd "C-c") 'edition-prefix)
;;; Start a major mode or something big
(define-prefix-command 'projet-prefix)
(global-set-key (kbd "C-p") 'projet-prefix)


(my-transform-bindings
;; Macro/execution
(global-set-key (kbd "C-(") 'start-kbd-macro)
(global-set-key (kbd "C-)") 'end-kbd-macro)
(global-set-key (kbd "C-b") 'call-last-kbd-macro)
(global-set-key (kbd "C-M-x") 'eval-expression)
(global-set-key (kbd "C-M-x") 'eval-expression)
(define-key emacs-lisp-mode-map (kbd "C-M-x") 'eval-expression)
(global-set-key (kbd "C-M-b") 'my-shell-command-on-region)
(global-set-key (kbd "M-x") 'execute-extended-command)
(global-set-key (kbd "M-x") 'execute-extended-command)
(global-set-key (kbd "C-p e") 'my-eval-region)
(global-set-key (kbd "C-p C-e") 'my-eval-buffer)

(global-set-key (kbd "M-b") 'repeat)

;; Edition/navigation in buffers
(global-set-key (kbd "C-y") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-whole-line)

(global-set-key (kbd "C-é") 'undo)
;; Useless, TOSEE
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'undo)

;; To avoid deleting line by mistake.
(global-unset-key (kbd "C-d"))


(global-set-key (kbd "C-x x") 'copy-region-as-kill)
(global-set-key (kbd "C-x C-x") 'copy-region-as-kill)
(global-set-key (kbd "C-.") 'yank)
(global-set-key (kbd "M-.") 'yank-pop)

(global-set-key (kbd "C-l") 'my-select-line)
(global-set-key (kbd "M-l") 'my-select-word)
(global-set-key (kbd "C-M-l") 'my-select-symbol)
(global-set-key (kbd "C-c a") 'mark-whole-buffer)

(global-set-key (kbd "C-n") 'next-error)
(global-set-key (kbd "C-v") 'recenter)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "M-SPC") 'View-back-to-mark)

(global-set-key (kbd "C-M-SPC") 'point-to-register)
(global-set-key (kbd "C-t C-g") 'jump-to-register)

(global-set-key (kbd "C-c {") 'narrow-to-region)
(global-set-key (kbd "C-c }") 'widen)


(global-set-key (kbd "C-t w") 'man)

(define-key isearch-mode-map (kbd "C-h m") 'describe-mode)
(define-key isearch-mode-map (kbd "<DEL>") 'isearch-del-char)
(define-key isearch-mode-map (kbd "<C-right>") 'isearch-yank-word)
(define-key isearch-mode-map (kbd "C-.") 'isearch-yank-kill)
(define-key isearch-mode-map (kbd "<C-M-right>") 'isearch-yank-symbol-or-char)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-r") 'query-replace-regexp)

(global-set-key (kbd "<C-right>") 'forward-word)
(global-set-key (kbd "<C-left>") 'backward-word)
(global-set-key (kbd "<M-right>") 'forward-whitespace)
(global-set-key (kbd "<M-left>") 'my-backward-whitespace)

(global-set-key (kbd "<C-M-backspace>") 'backward-kill-sexp)
(define-key minibuffer-local-map (kbd "<C-M-backspace>") 'backward-kill-sexp)
(define-key isearch-mode-map (kbd "<C-M-backspace>") 'backward-kill-sexp)

(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<prior>") 'backward-paragraph)
(global-set-key (kbd "<next>") 'forward-paragraph)

(global-set-key (kbd "M-t") 'backward-char)
(global-set-key (kbd "M-r") 'forward-char)
(global-set-key (kbd "M-d") 'previous-line)
(global-set-key (kbd "M-s") 'next-line)

(global-set-key (kbd "C-c d") 'my-echo-date)
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c c") 'uncomment-region)
(global-set-key (kbd "C-c u") 'downcase-region)
(global-set-key (kbd "C-c U") 'upcase-region)

(global-set-key (kbd "C-f") 'completion-at-point)
(define-key minibuffer-local-must-match-map (kbd "C-f") 'minibuffer-complete)

;; Windows
(global-set-key (kbd "C-o") 'other-window)
;; (global-set-key (kbd "<C-kp-0>") 'delete-window)
(global-set-key (kbd "<C-kp-1>") 'delete-other-windows)
(global-set-key (kbd "<f2>") 'delete-window)
(global-set-key (kbd "<f1>") 'delete-other-windows)
(global-set-key (kbd "<C-kp-2>") 'split-window-vertically)
(global-set-key (kbd "<C-kp-3>") 'split-window-horizontally)

;; Files and buffers
(global-set-key (kbd "C-t C-f") 'find-file)
(global-set-key (kbd "C-t M-f") 'find-file-literally)
(global-set-key (kbd "<f9>") 'find-file-at-point)

(global-set-key (kbd "C-t C-M-f") 'write-file)
(global-set-key (kbd "C-t C-s") 'save-buffer)
(define-key edit-abbrevs-mode-map (kbd "C-t C-s") 'abbrev-edit-save-buffer)

(global-set-key (kbd "C-t C-k") 'my-kill-buffer)
(global-set-key (kbd "C-t k") 'my-kill-buffer-and-maybe-window)
(global-set-key (kbd "C-t C-k") 'my-kill-buffer)
(global-set-key (kbd "C-t k") 'my-kill-buffer-and-maybe-window)
(global-set-key (kbd "C-t C-c C-c") 'delete-frame)

(global-set-key (kbd "C-t C-r") 'recentf-open-files)

(global-set-key (kbd "C-t p") 'my-buffer-path-to-ring)
(global-set-key (kbd "C-t C-t") 'switch-to-buffer)
(global-set-key (kbd "C-t C-b") 'bookmark-set)
(global-set-key (kbd "C-t C-l") 'bookmark-jump)
(global-set-key (kbd "C-t C-t") 'switch-to-buffer)
(global-set-key (kbd "C-t C-b") 'bookmark-set)
(global-set-key (kbd "C-t C-l") 'bookmark-jump)

;; Start mode or big things
(global-set-key (kbd "C-p d") 'dired-jump) ;; Useful to rename file, use just R after
(global-set-key (kbd "C-p C-s") 'save-some-buffers)
(global-set-key (kbd "C-p r") 'revert-buffer)
(global-set-key (kbd "C-p C-M-r") 'my-revert-all-buffers)
(global-set-key (kbd "C-p C-s") 'save-some-buffers)
(global-set-key (kbd "C-p r") 'revert-buffer)
(global-set-key (kbd "C-p C-M-r") 'my-revert-all-buffers)

(global-set-key (kbd "C-p q") 'my-kill-boring-buffer)
(global-set-key (kbd "C-p C-q") 'kill-matching-buffers)
(global-set-key (kbd "C-p q") 'my-kill-boring-buffer)
(global-set-key (kbd "C-p C-q") 'kill-matching-buffers)

;; org-mode

;;; TODO : See if org-clock could be useful
(global-set-key (kbd "C-p c") 'org-timer-set-timer)
(global-set-key (kbd "C-p C-c") 'org-timer-start)
(global-set-key (kbd "C-p M-c") 'org-timer-stop)
(global-set-key (kbd "C-p c") 'org-timer-set-timer)
(global-set-key (kbd "C-p C-c") 'org-timer-start)
(global-set-key (kbd "C-p M-c") 'org-timer-stop)

(global-set-key (kbd "C-p C-w") 'org-agenda)
(global-set-key (kbd "C-p w") 'org-agenda-list)
(global-set-key (kbd "C-p C-w") 'org-agenda)

(define-key org-mode-map (kbd "<f5>") 'org-todo)
(define-key org-mode-map (kbd "<f6>") 'org-schedule)
(define-key org-mode-map (kbd "C-S-d") 'org-up-element)
(define-key org-mode-map (kbd "<backtab>") 'hide-subtree)
(define-key org-mode-map (kbd "C-t o") 'org-remove-occur-highlights)
(define-key org-mode-map (kbd "C-c C-o") 'org-toggle-ordered-property)
(define-key org-mode-map (kbd "C-c C-a") 'org-archive-to-archive-sibling)
(define-key org-mode-map (kbd "M-c") 'org-toggle-checkbox)
(define-key org-mode-map (kbd "C-c é") 'org-columns)
(define-key org-mode-map (kbd "C-c h") 'org-clock-in)
(define-key org-mode-map (kbd "C-c C-M-h") 'org-clock-cancel)
(define-key org-mode-map (kbd "C-M-<tab>") 'org-global-cycle)
;; (define-key org-mode-map (kbd "M-<right>") 'org-shiftmetaright)
;; (define-key org-mode-map (kbd "M-<left>") 'org-shiftmetaleft)
(define-key org-mode-map (kbd "C-c C-.") 'org-time-stamp)

;; term-mode
(global-set-key (kbd "C-p v") 'my-term)
(define-key term-mode-map (kbd "<f8>") 'my-term-toggle-mode)
(define-key term-raw-map (kbd "<f8>") 'my-term-toggle-mode)
(global-set-key (kbd "C-h k") 'describe-key)
(define-key term-raw-map (kbd "C-d") 'term-send-raw)
(define-key term-mode-map (kbd "C-d") 'avy-goto-word-0)

(define-key term-raw-map (kbd "C-o") 'other-window)
(define-key term-mode-map (kbd "C-o") 'other-window)

(define-key term-mode-map (kbd "C-q") 'my-term-insert-literal)
(define-key term-raw-map (kbd "C-q") 'my-term-insert-literal)
(define-key term-raw-map (kbd "C-r") 'term-send-raw)
(define-key term-raw-map (kbd "<C-left>") 'term-send-ctrl-left)
(define-key term-raw-map (kbd "<C-right>") 'term-send-ctrl-right)
;; Found with "bind" command in fish. Or C-v in bash
(define-key term-raw-map (kbd "<C-delete>") 'my-term-delete)
(define-key term-raw-map (kbd "<C-backspace>") 'my-term-bactkspace)
(define-key term-raw-map (kbd "M-t") 'term-send-left)
(define-key term-raw-map (kbd "M-r") 'term-send-right)
(define-key term-raw-map (kbd "M-s") 'term-send-down)
(define-key term-raw-map (kbd "M-d") 'term-send-up)


(define-key term-mode-map (kbd "M-t") 'backward-char)
(define-key term-mode-map (kbd "M-r") 'forward-char)
(define-key term-mode-map (kbd "M-s") 'next-line)
(define-key term-mode-map (kbd "M-d") 'previous-line)

(define-key term-raw-map (kbd "C-.") 'term-paste)
)

(provide 'my-basics-keybindings)
;;; my-basics-keybindings.el ends here
