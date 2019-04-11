;;; my-key.el --- global keys binding configuration
;;; Commentary:
;; M-x describe-personal-keybindings
;; (bind-key "C-c x" 'my-ctrl-c-x-command)
;; (bind-key* "<C-return>" 'other-window)
;; (bind-key "C-c x" 'my-ctrl-c-x-command some-other-mode-map)
;; (unbind-key "C-c x" some-other-mode-map)

;;; Code:
(require 'bind-key)

;; Define prefixes
(define-prefix-command 'file-move)
(define-prefix-command 'edition)
(define-prefix-command 'projet)
(global-set-key (kbd "C-t") 'file-move)
(global-set-key (kbd "C-c") 'edition)
(global-set-key (kbd "C-p") 'projet)

;; Without prefix
;;; Basic
(bind-key* "C-(" 'start-kbd-macro)
(bind-key* "C-)" 'end-kbd-macro)
(bind-key* "C-b" 'call-last-kbd-macro)

(bind-key* "C-M-x" 'eval-expression)
(bind-key* "C-M-r" 'query-replace-regexp)

(bind-key* "C-y" 'kill-region)
(bind-key* "C-x x" 'copy-region-as-kill)
(bind-key* "C-x C-x" 'copy-region-as-kill)
(bind-key* "C-." 'yank)

(bind-key* "C-l" 'select-line)
(bind-key* "M-l" 'select-word)
(bind-key* "C-M-l" 'select-symbol)
(bind-key* "C-_" 'my-deactivate-mark)

(bind-key* "C-é" 'undo-tree-undo)
(bind-key* "C-É" 'undo-tree-redo)
(bind-key* "C-M-é" 'undo-tree-visualize)

(bind-key* "C-M-b" 'my-shell-command-on-region)
;;; Navigation
(bind-key "C-n" 'my-next-error)
(bind-key* "C-M-n" 'my-previous-error)

(bind-key* "C-d" 'ace-jump-word-mode)
(bind-key* "C-M-d" 'ace-jump-char-mode)

(bind-key* "C-v" 'recenter)
(bind-key* "C-t g" 'goto-line)
(bind-key* "M-SPC" 'View-back-to-mark)

(bind-key* "C-M-SPC" 'point-to-register)
(bind-key "C-f" 'jump-to-register)

(bind-key "C-s" 'isearch-forward-regexp)
(bind-key "C-r" 'isearch-backward-regexp)
(bind-key "C-M-s" 'isearch-edit-string isearch-mode-map)
(bind-key "<DEL>" 'isearch-del-char isearch-mode-map)
(bind-key "<right>" 'isearch-yank-word isearch-mode-map)
(bind-key "<left>" 'isearch-delete-char isearch-mode-map)

(bind-key* "<C-right>" 'forward-word)
(bind-key* "<C-left>" 'backward-word)
(bind-key* "<end>" 'end-of-buffer)
(bind-key* "<home>" 'beginning-of-buffer)
(bind-key* "<prior>" 'backward-paragraph)
(bind-key* "<next>" 'forward-paragraph)

(bind-key* "M-t" 'backward-char)
(bind-key* "M-r" 'forward-char)
(bind-key* "M-d" 'my-previous-line)
(bind-key* "M-s" 'my-next-line)

;;; Windows
(bind-key* "C-o" 'other-window)
(bind-key* "<C-kp-0>" 'delete-window)
(bind-key* "<C-kp-1>" 'delete-other-windows)
(bind-key* "<f2>" 'delete-window)
(bind-key* "<f1>" 'delete-other-windows)
(bind-key* "<C-kp-2>" 'split-window-vertically)
(bind-key* "<C-kp-3>" 'split-window-horizontally)

;;; Markdown
(with-eval-after-load "markdown-mode"
  (bind-key "C-p C-p" 'markdown-preview markdown-mode-map)
  )

;;; Helm
(bind-key* "M-x" 'helm-M-x)
(bind-key* "M-." 'helm-show-kill-ring)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-j")  'helm-select-action) ; list actions using C-z

;; (helm-map helm-read-file-map helm-find-files-map helm-buffer-map)

(with-eval-after-load "company"
  (bind-key  "<tab>" 'my-helm-company company-active-map)
  (bind-key  "<return>" 'newline company-active-map)
  (bind-key* "C-<tab>" 'my-helm-company)
  (bind-key*  "M-<tab>" 'helm-complete-file-name-at-point))

(with-eval-after-load "helm-files"
  (bind-key "<left>" 'backward-char helm-find-files-map)
  (bind-key "<right>" 'forward-char helm-find-files-map))

;;; Dired
(bind-key  "DEL" 'dired-up-directory dired-mode-map)

;;; Pdf-tools
;; (local-set-key (kbd "<C-right>") 'doc-view-next-page)
;; (local-set-key (kbd "<C-left>") 'doc-view-previous-page)

;;; Org-mode

(with-eval-after-load "org"
  (bind-key "<f6>" 'org-schedule org-mode-map)
  ;; (bind-key* "q" 'org-agenda-exit org-mode-map)
  (bind-key "C-D" 'org-up-element org-mode-map)
  (bind-key "<backtab>" 'hide-subtree org-mode-map)
  (bind-key "<f5>" 'org-todo org-mode-map)
  ;; (bind-key "S-iso-lefttab" 'hide-subtree org-mode-map)
  (bind-key "C-t o" 'org-remove-occur-highlights org-mode-map)
  (bind-key "C-c C-o" 'org-toggle-ordered-property org-mode-map)
  (bind-key "C-c C-p" 'org-priority org-mode-map)
  (bind-key "C-c C-a" 'org-archive-to-archive-sibling org-mode-map)
  (bind-key "M-c" 'org-toggle-checkbox org-mode-map)
  (bind-key "C-c é" 'org-columns org-mode-map)
  (bind-key "C-c h" 'org-clock-in org-mode-map)
  (bind-key "C-c C-M-h" 'org-clock-cancel org-mode-map)
  (bind-key "C-<tab>" 'org-global-cycle org-mode-map)
  (bind-key "M-<right>" 'org-shiftmetaright org-mode-map)
  (bind-key "M-<left>" 'org-shiftmetaleft org-mode-map)
  (bind-key "C-c C-." 'org-time-stamp org-mode-map))
;;;;(bind-key "C-c C-h" 'org-clock-out)

;; (global-set-key [C-tab] 'srecode-insert)
;; (global-set-key [C-return] 'semantic-complete-analyze-inline)
;; (global-set-key [C-kp-enter] 'semantic-analyze-possible-completions)
;; (global-set-key (kbd "C-M-s") 'multi-occur-in-matching-buffers)

;; File/tab command (file-move = C-t)
(bind-key* "C-t C-f" 'find-file)
(bind-key* "<f9>" 'helm-find-files)
(bind-key* "C-t C-r" 'helm-recentf)
(bind-key* "C-t C-t" 'helm-buffers-list)

(bind-key* "C-t C-M-f" 'write-file)
(bind-key "C-t C-s" 'save-buffer)
(with-eval-after-load "ein-notebook"
  (bind-key "C-c -" 'ein:worksheet-delete-cell ein:notebook-mode-map)
  (bind-key "C-t C-s" 'ein:notebook-save-notebook-command ein:notebook-mode-map)
  (bind-key "C-<enter>" 'ein:worksheet-execute-cell ein:notebook-mode-map)
  (bind-key "C-<return>" 'ein:worksheet-execute-cell ein:notebook-mode-map)
  )


;; (bind-key* "C-t g" 'find-tag)
;; (bind-key* "C-t M-g" 'find-next-tag)

(bind-key* "C-t C-k" 'my-kill-buffer)
(bind-key* "C-t k" 'kill-buffer-and-maybe-window)
(bind-key* "C-t b" 'diredp-bookmark-this-file)
(bind-key* "C-t C-b" 'bookmark-set)
(bind-key* "C-t C-l" 'helm-bookmarks)
(bind-key* "C-t C-c C-c" 'delete-frame)

;; Edition command (edition = C-c)
(bind-key* "C-c C-k" 'kill-whole-line)
(bind-key* "C-c C-t" 'anchored-transpose)
(bind-key* "C-c a" 'mark-whole-buffer)
(bind-key* "C-c d" 'echo-date)

(bind-key* "C-c C-c" 'comment-region)
(bind-key* "C-c c" 'uncomment-region)

(bind-key* "C-c <tab>" 'yas-insert-snippet)

(bind-key* "C-c s" 'ispell-word)
(bind-key* "C-c C-s" 'ispell-region)
(bind-key* "C-c C-M-s" 'langtool-check-buffer)

(bind-key* "C-c u" 'downcase-region)
(bind-key* "C-c U" 'upcase-region)

(bind-key* "C-c {" 'narrow-to-region)
(bind-key* "C-c }" 'widen)

(bind-key "C-c f" 'with-editor-finish)
(bind-key "C-c q" 'with-editor-cancel)

;; Projet command (projet = C-p)
;;;; (bind-key* "C-t a" 'auto-complete-my-mode)
;;;;(bind-key* "p" 'phpcbf)
(bind-key* "C-p i" 'eww)
(bind-key* "C-p s" 'spray-mode)
(bind-key* "C-p <return>" 'execute)
(bind-key* "C-p c" 'compile)
(bind-key* "C-p e" 'elpy-shell-send-region-or-buffer)
(bind-key* "C-p d" 'dired-jump) ;; Useful to rename file, use just R after

(bind-key* "C-p C-s" 'save-some-buffers)
(bind-key* "C-p r" 'revert-buffer)
(bind-key* "C-p C-M-r" 'revert-all-buffers)

(bind-key* "C-p w" 'org-agenda-list)
(bind-key* "C-p t" 'org-agenda)
(bind-key* "C-p C-t" 'org-tags-view-only-todo)


(bind-key* "C-p l" 'helm-locate)
(bind-key* "C-p h" 'helm-dash-at-point)
(bind-key* "C-p q" 'my-kill-boring-buffer)

(bind-key* "C-p j" 'my-jupyter)
(bind-key* "C-p m" 'math)


;; Help command
(bind-key* "C-h C-k" 'show-key-el)

(provide 'my-key)
;;; my-key.el ends here
