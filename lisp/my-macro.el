;;; my-macro.el --- some saved macro
;;; Commentary:
;; 1) create the macro C-( and C-)
;; 2) kmacro-name-last-macro
;; 3) then in this file : insert-kbd-macro
;; 4) call macro as a function
;;; Code:

(fset 'my-rotate-date
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217843 tab 5 134217836 24 24 1 134217828 tab 5 134217836 67108910 1 tab 134217843 tab] 0 "%d")) arg)))


(provide 'my-macro.el)
;;; my-macro.el ends here
