;;; my-writing.el --- Ortographic and grammatical corrections and reader  -*- lexical-binding: t -*-
;;; Commentary:
;;; Nothing special.

;;; Code:

(bind-key "C-n" 'my-next-error)
(bind-key "C-M-n" 'my-previous-error)

(use-package langtool
	:ensure
	:demand
	:bind (
				 ("C-c C-M-s" . langtool-check)
				 )
	:custom
	(langtool-default-language "fr")
	(langtool-mother-tongue "fr")
	;; (langtool-java-classpath "/usr/share/languagetool:/usr/share/java/languagetool/*")
	;; (langtool-user-arguments '("--languagemodel" "/home/dionisos/logiciels/ngrams_dicts/"))
	(langtool-http-server-host "localhost")
  (langtool-http-server-port 8081)
)

(defun my-set-dictionary(lang)(+ 1 1))

(use-package ispell
  :ensure nil

	:custom
	(ispell-dictionary "fr-classique")
	(ispell-program-name "hunspell")
	)

(use-package flyspell
	:demand
	:hook (
				 (text-mode-hook . flyspell-mode)
				 (text-mode-hook . (lambda() (my-set-dictionary "fr-classique")))
				 (prog-mode-hook . flyspell-prog-mode)
				 (prog-mode-hook . (lambda() (my-set-dictionary "en_US-large")))

	)
	:bind (
				 ("C-c s" . flyspell-correct-wrapper)
				 ("C-p i" . my-change-dictionary)
				 :map flyspell-mode-map
							("C-." . nil)
							("C-M-i" . nil)
							("<M-tab>" . nil)
				 )
	:custom
	(flyspell-abbrev-p t)
	(flyspell-delay 2)
	(flyspell-dictionaries-that-consider-dash-as-word-delimiter '("en_US-large" "fr-classique"))
	(flyspell-duplicate-distance 500)
	;; (ispell-dictionary "fr")
	;; (ispell-local-dictionary "fr")
	;; (flyspell-mode-line-string " Fly:(fr)")
	)

(use-package flyspell-correct
	:ensure
	:demand
  :after flyspell
	)

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
