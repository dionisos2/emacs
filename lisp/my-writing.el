;;; my-writing.el --- Ortographic and grammatical corrections and reader  -*- lexical-binding: t -*-
;;; Commentary:
;;; Nothing special.

;;; Code:

(bind-key "C-n" 'my-next-error)
(bind-key "C-M-n" 'my-previous-error)

(defun languagetool-ignore-time-format-p (word)
  "Return t if WORD is a valid time format like '10h10', '23h59', etc."
  (when (string-match "^\\([0-9]\\{1,2\\}\\)[hH]\\([0-9]\\{2\\}\\)$" word)
    (let ((hours (string-to-number (match-string 1 word)))
          (minutes (string-to-number (match-string 2 word))))
      (and (<= 0 hours 23) (<= 0 minutes 59)))))

(use-package languagetool
  :demand
	;; :ensure nil
	;; :straight (:host github
	;; 								 :repo "dionisos2/languagetool.el"
	;; 								 :branch "dionisos")
  :load-path "~/projets/programmation/emacs/languagetool.el"
  :commands (languagetool-clear-suggestions
             languagetool-correct-at-point
             languagetool-correct-buffer
             languagetool-correct-buffer-forward
             languagetool-set-language
             languagetool-server-mode)
  :hook
  (text-mode-hook . languagetool-server-mode)
  (org-mode-hook . languagetool-server-mode)
  (markdown-mode-hook . languagetool-server-mode)
  :bind (
         ("C-c s" . languagetool-correct-at-point)
         ("C-c C-s" . languagetool-correct-buffer-forward)
         ("C-<f10>" . languagetool-server-mode)
         ("<f10>" . languagetool-server-check-region)
         )
  :custom
  (languagetool-correction-language "fr")
  (languagetool-java-arguments '("-dfile.encoding=utf-8"))
  (languagetool-server-url "http://localhost")
  (languagetool-server-port 8081)
  (languagetool-hint-idle-delay 0.5)
  (languagetool-server-check-delay 1.5)
  (languagetool-server-lines-before 2)
  (languagetool-server-lines-after 2)
  (languagetool-correction-keys (string-to-vector "auienrstdoygov123456789"))
	(languagetool-server-check-visible-text t)
	:config
	(add-to-list 'languagetool-core-correct-predicates #'languagetool-ignore-time-format-p)
  )

(defun my-set-dictionary(lang)(+ 1 1))

(use-package ispell
  :ensure nil

	:custom
	(ispell-dictionary fr-dict)
	(ispell-program-name "hunspell")
	)

;; (use-package flyspell
;; 	:demand
;; 	:bind (
;; 				 ("C-c s" . flyspell-correct-wrapper)
;; 				 ("C-p i" . my-change-dictionary)
;; 				 :map flyspell-mode-map
;; 							("C-." . nil)
;; 							("C-M-i" . nil)
;; 							("<M-tab>" . nil)
;; 				 )
;; 	:custom
;; 	(flyspell-abbrev-p t)
;; 	(flyspell-delay 2)
;; 	(flyspell-dictionaries-that-consider-dash-as-word-delimiter '(en-dict fr-dict))
;; 	(flyspell-duplicate-distance 500)
;; 	)

;; (use-package flyspell-correct
;; 	:ensure
;; 	:demand
;;   :after flyspell
;; 	)

(use-package google-translate
	:demand
	:ensure
	:config
	;; Fix a bug, see : https://github.com/atykhonov/google-translate/issues/52
	(defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
	(setq google-translate-translation-directions-alist '(("fr" . "en") ("en" . "fr")))
	:custom
	(google-translate-backend-method 'curl)
  (google-translate-default-source-language "en")
	(google-translate-default-target-language "fr")
	:bind (
				 ("C-p t" . google-translate-at-point)
				 ("C-p C-t" . google-translate-smooth-translate)
				 )
)

(use-package google-translate-smooth-ui
	:straight nil
	:after (google-translate)
)

(use-package spray
	:demand
	:ensure
	:bind (
				 ("C-p s" . spray-mode)
				 )
	:custom
	(spray-margin-left 20)
	(spray-margin-top 6)
	(spray-wpm 300)
	)

(provide 'my-writing)
;;; my-writing.el ends here
