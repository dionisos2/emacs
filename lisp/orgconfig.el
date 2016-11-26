;;; orgconfig.el --- my configuration of org-mode
;;; Commentary:
;; Strangely i needed to download http://orgmode.org/w/?p=org-mode.git;a=blob_plain;f=contrib/lisp/org-checklist.el;hb=HEAD
;; It is strange because the customization of org-modules propose org-checklist.

;;; Code:
(provide 'orgconfig)

(setq org-log-done 'time)
(require 'org-checklist)

(provide 'orgconfig.el)
;;; orgconfig.el ends here
