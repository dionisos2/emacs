;;; my-keychord.el --- keychord config
;;; Commentary:
;; Put keybinding here to avoid problem when Emacs bug

;;; Code:

(key-chord-mode 1)

(defvar key-chord-two-keys-delay 0.05)
(defvar key-chord-one-key-delay 0.05)
(setq key-chord-two-keys-delay 0.05)
(setq key-chord-one-key-delay 0.15)

(with-eval-after-load "org"
  (key-chord-define org-mode-map "td" 'org-up-element)
  )
(key-chord-define-global "ae" 'yas-insert-snippet)


(provide 'my-keychord.el)
;;; my-keychord.el ends here
