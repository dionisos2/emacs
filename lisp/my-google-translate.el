;;; my-google-translate.el --- summary : obvious
;;; Commentary:
;; commentary
;;; Code:

(setq google-translate-translation-directions-alist
      '(("fr" . "en") ("en" . "fr")))

;; Fix a bug, see : https://github.com/atykhonov/google-translate/issues/52
(defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))

(setq google-translate-backend-method 'curl)

;;; my-google-translate.el ends here
(provide 'my-google-translate)
