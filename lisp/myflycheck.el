;; found here https://truongtx.me/2014/07/22/setup-php-development-environment-in-emacs
;; To find rules, see by example : /usr/share/pear/PHP/CodeSniffer/Standards/Squiz/Sniffs/Commenting/ClassCommentSniff.php
;; Les noms exactes des erreurs sont également donné par phpcs/flycheck quand il les rencontre.

;;; Code:
(require 'flycheck)


(flycheck-mode 't)

(flycheck-define-checker my-php-checker
  "A PHP syntax checker using the PHP command line interpreter."
  :command ("php" "-l" "-d" "error_reporting=E_ALL" "-d" "display_errors=1"
			"-d" "log_errors=0")
  :standard-input t
  :error-patterns
  ((error line-start (or "Parse" "Fatal" "syntax") " error" (any ":" ",") " "
		  (message) " in - on line " line line-end))
  :modes (php-mode php+-mode web-mode)
  :next-checkers ((warning . my-php-phpcs)))

(flycheck-define-checker my-php-phpcs
  "A PHP style checker using PHP Code Sniffer."

  :command ("phpcs" "--report=checkstyle" "--standard=~/projets/programmation/http/private/communautheque/ruleset.xml"
			(option "--standard=" flycheck-phpcs-standard concat)
			;; Pass original file name to phpcs.  We need to concat explicitly
			;; here, because phpcs really insists to get option and argument as
			;; a single command line argument :|
			(eval (when (buffer-file-name)
					(concat "--stdin-path=" (buffer-file-name)))))
  :standard-input t
  :error-parser flycheck-parse-checkstyle
  :error-filter
  (lambda (errors)
	(flycheck-sanitize-errors
	 (flycheck-remove-error-file-names "STDIN" errors)))
  :modes (php-mode php+-mode web-mode)
  ;; phpcs seems to choke on empty standard input, hence skip phpcs if the
  ;; buffer is empty, see https://github.com/flycheck/flycheck/issues/907
  :predicate (lambda () (> (buffer-size) 0)))


(add-to-list 'flycheck-checkers 'my-php-phpcs)
(add-to-list 'flycheck-checkers 'my-php-checker)
