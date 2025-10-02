;;; my-writing.el --- Ortographic and grammatical corrections and reader  -*- lexical-binding: t -*-
;;; Commentary:
;;; Nothing special.

;;; Code:

(bind-key "C-n" 'my-next-error)
(bind-key "C-M-n" 'my-previous-error)

(use-package languagetool
	:ensure nil
  :straight (:host github
             :repo "dionisos2/languagetool.el"
             :branch "dionisos")
  :commands (
						 languagetool-clear-suggestions
             languagetool-correct-at-point
             languagetool-correct-buffer
						 languagetool-correct-buffer-forward
             languagetool-set-language
             languagetool-server-mode
						 )
	:hook
  (text-mode-hook . languagetool-server-mode)
  (org-mode-hook . languagetool-server-mode)
  (markdown-mode-hook . languagetool-server-mode)
	:bind (
				 ("C-c s" . languagetool-correct-buffer-forward)
				 )
  :custom
	(languagetool-correction-language "fr")
  (languagetool-java-arguments '("-Dfile.encoding=UTF-8"))
	(languagetool-server-url "http://localhost")
	(languagetool-server-port 8081)
	(languagetool-hint-idle-delay 0.5)
	(languagetool-server-lines-before 10)
	(languagetool-server-lines-after 10)
	(languagetool-correction-keys (string-to-vector "auienrstdoygov123456789"))
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
