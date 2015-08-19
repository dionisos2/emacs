;;; behave-mode.el --- a major mode for behave (behaviour-driven development in python)

;;; Commentary:
;; See https://pythonhosted.org/behave/index.html

;;; code:


(defvar behave-mode-hook nil)

(defconst behave-font-lock-keywords
  (list
   '("\\(And\\|Given\\|When\\|Scenario\\|Then\\|Feature\\|Background\\)" . font-lock-builtin-face)))

(defun behave-indent-line ()
  "Indent current line as behave code."
  (interactive)
  (cond
   ((string-match "^[^w]*\\(When\\|And\\|Given\\|Then\\)" (thing-at-point 'line)) (indent-line-to 4))
   ((string-match "^[^w]*\\(Scenario\\|Background\\)" (thing-at-point 'line)) (indent-line-to 2))
   (t (indent-line-to 0)))
)

(defun behave-mode ()
  "Behave major mode."
  (interactive)
  (kill-all-local-variables)
  (set (make-local-variable 'font-lock-defaults) '(behave-font-lock-keywords))
  (set (make-local-variable 'indent-line-function) 'behave-indent-line)
  (setq major-mode 'behave-mode)
  (setq mode-name "behave-mode")
  (run-hooks 'behave-mode-hook))

(provide 'behave-mode)
;;; behave-mode.el ends here
