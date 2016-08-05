;;; key.el --- global keys binding configuration
;;; Commentary:
;; nothing special

;;; Code:
(define-prefix-command 'file-move)
(define-prefix-command 'edition)
(define-prefix-command 'projet)
(global-set-key (kbd "C-t") 'file-move)
(global-set-key (kbd "C-c") 'edition)
(global-set-key (kbd "C-p") 'projet)
(global-unset-key "\C-x");; doen’t work :(
(local-unset-key "\C-x")


;; basic command
(global-set-key (kbd "M-y") 'execute-extended-command)
(global-set-key (kbd "C-M-y") 'eval-expression)
(global-set-key (kbd "C-(") 'start-kbd-macro)
(global-set-key (kbd "C-)") 'end-kbd-macro)
(global-set-key (kbd "C-b") 'call-last-kbd-macro)
(global-set-key (kbd "C-c m") 'nxhtml-mumamo-mode)

;; file/tab command (file-move = C-t)
(define-key 'file-move "\C-f" 'find-file)
(define-key 'file-move (kbd "C-M-f") 'write-file)
(define-key 'file-move "\C-s" 'save-buffer)
(define-key 'file-move "\C-t" 'switch-to-buffer)
;(define-key 'file-move (kbd "C-M-g") 'gtags-find-file)
(define-key 'file-move "g" 'find-tag)
(define-key 'file-move "\M-g" 'find-next-tag)
(define-key 'file-move "\C-r" 'recentf-open-files-compl)
(define-key 'file-move "r" 'show-recentf)
(define-key 'file-move "a" 'add-file-to-recentf)
(define-key 'file-move "\C-k" 'kill-buffer-and-maybe-window)
(define-key 'file-move "k" 'kill-buffer)
(global-set-key [f5] 'find-file-at-point)
;(define-key gtags-select-mode-map (kbd "<return>") 'gtags-select-tag)
(define-key 'file-move "b" 'gtags-pop-stack)
(define-key 'file-move "\C-c\C-c" 'save-buffers-kill-emacs)
(define-key 'file-move "\C-c\C-c" 'delete-frame)

;; édition command (edition = C-c)
(define-key 'edition "\C-k" 'kill-whole-line)
(define-key 'edition "\C-c" 'comment-region)
(define-key 'edition "c" 'uncomment-region)
(define-key 'edition "s" 'ispell-word)
(define-key 'edition "\C-s" 'ispell-buffer)
(define-key 'edition (kbd "C-M-s") 'langtool-check-buffer)
(define-key 'edition "a" 'mark-whole-buffer)
(define-key 'edition (kbd "u") 'downcase-region)
(define-key 'edition (kbd "U") 'upcase-region)
(define-key 'edition (kbd "t") 'transpose-lines)
(define-key 'edition (kbd "C-t") 'anchored-transpose)
(define-key 'edition "{" 'narrow-to-region)
(define-key 'edition "}" 'widen)
(define-key 'edition "d" 'echo-date)
;; (define-key 'edition "\M-a" 'habitrpg-add)

(global-set-key (kbd "M-.") 'yank-pop)
(global-set-key (kbd "C-y") 'kill-region)
(global-set-key "\C-xx" 'copy-region-as-kill)
(global-set-key "\C-x\C-x" 'copy-region-as-kill)
(global-set-key (kbd "C-.") 'yank)
(global-set-key (kbd "C-l") 'select-line)
(global-set-key (kbd "M-l") 'select-word)
(global-set-key (kbd "C-M-l") 'select-symbol)
(global-set-key (kbd "<f10>") 'shell-script-mode)
(global-set-key [C-tab] 'srecode-insert)
(global-set-key [C-return] 'semantic-complete-analyze-inline)
(global-set-key [C-kp-enter] 'semantic-analyze-possible-completions)
(global-set-key (kbd "C-n") 'my-next-error)
(global-set-key (kbd "C-M-n") 'my-previous-error)
(global-set-key (kbd "C-M-s") 'multi-occur-in-matching-buffers)
(global-set-key (kbd "C-M-r") 'query-replace-regexp)
(global-set-key (kbd "C-é") 'undo-tree-undo)
(global-set-key (kbd "C-É") 'undo-tree-redo)
(global-set-key (kbd "C-M-é") 'undo-tree-visualize)


;;navigation command
(global-set-key (kbd "C-v") 'recenter)
(global-set-key (kbd "C-M-SPC") 'point-to-register)
(global-set-key (kbd "C-f") 'jump-to-register)
(global-set-key (kbd "<C-right>") 'next-word)
(global-set-key (kbd "<C-left>") 'previous-word)
(define-key 'edition "g" 'goto-line)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<prior>") 'backward-paragraph)
(global-set-key (kbd "<next>") 'forward-paragraph)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "M-SPC") 'View-back-to-mark)

(global-set-key (kbd "M-t") 'backward-char)
(global-set-key (kbd "M-d") 'previous-line)
(global-set-key (kbd "M-r") 'forward-char)
(global-set-key (kbd "M-s") 'next-line)
(global-set-key (kbd "C-M-t") 'previous-word)


;; windows
(global-set-key (kbd "<C-kp-0>") 'delete-window)
(global-set-key (kbd "<C-kp-1>") 'delete-other-windows)
(global-set-key (kbd "<C-kp-2>") 'split-window-vertically)
(global-set-key (kbd "<C-kp-3>") 'split-window-horizontally)

;; projet command (projet = C-p)
(define-key 'projet "a" 'auto-complete-my-mode)
(define-key 'projet "p" 'phpcbf)
(define-key 'projet "i" 'w3m)
(define-key 'projet "s" 'spray-mode)
(define-key 'projet "r" 'revert-buffer)
(define-key 'projet (kbd "<return>") 'execute)
(global-set-key (kbd "C-}") 'next-error)
(global-set-key [f12] 'eassist-switch-h-cpp)
(define-key 'projet "c" 'compile)
(define-key 'projet "l" 'toggle-preview-latex)
(define-key 'projet "w" 'org-agenda-list)
(define-key 'projet "t" 'org-todo-list)
(define-key 'projet "\C-t" 'org-tags-view-only-todo)
(define-key 'projet "d" 'dired-jump) ;; Useful to rename file, use just R after
;; (define-key 'projet "\C-h" 'habitrpg-status)

;; help command
;(global-set-key "\C-hq" 'go-qt4-help)
(global-set-key "\C-h\C-k" 'show-key-el)


;; a ranger command
(global-set-key (kbd "C-M-e") 'my-shell-command-on-region)
(define-key isearch-mode-map (kbd "M-s") 'isearch-yank-word-or-char)
(define-key isearch-mode-map (kbd "C-.") 'isearch-yank-x-selection)

;; revert-buffer

;(global-set-key (kbd "...") (kbd "C-u M-x save-buffers-kill-emacs RET")) look like good trick !

(provide 'key)
;;; key.el ends here

