(defhydra hydra-zoom (global-map "C-t")
  "winner"
  ("<left>" winner-undo)
  ("<right>" winner-redo)
	)




;; (defhydra hydra-magit (:color blue)
;;   "
;;   ^
;;   ^Magit^             ^Do^
;;   ^─────^─────────────^──^────────
;;   _q_ quit            _b_ blame
;;   ^^                  _c_ clone
;;   ^^                  _i_ init
;;   ^^                  _s_ status
;;   ^^                  ^^
;;   "
;;   ("q" nil)
;;   ("b" magit-blame)
;;   ("c" magit-clone)
;;   ("i" magit-init)
;;   ("s" magit-status))

;; (define-key magit-mode-map "." 'hydra-magit/body)
