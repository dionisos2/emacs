;;; mytrash.el --- configure flycheck
;;; Commentary:

;;; Code:

(setq system-trash-exclude-matches '("#[^/]+#$" ".*~$" "\\.emacs\\.desktop.*"))
(setq system-trash-exclude-paths '("/tmp"))
(defun move-file-to-trash (filename)
  "Trash FILENAME with the 'trash' command (trash-cli).
Redefine files.el buggy 'move-file-to-trash' function."
  (interactive "fMove file to trash: ")
  (system-move-file-to-trash filename))

(provide 'mytrash.el)
;;; mytrash.el ends here
