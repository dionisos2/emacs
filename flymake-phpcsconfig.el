;; If flymake_phpcs isn't found correctly, specify the full path
(setq flymake-phpcs-command "~/.emacs.d/emacs-flymake-phpcs/bin/flymake_phpcs")

;; Customize the coding standard checked by phpcs
(setq flymake-phpcs-standard "~/.emacs.d/devtools/php_codesniffer/MyCompanyStandard")

;; Show the name of sniffs in warnings (eg show
;; "Generic.CodeAnalysis.VariableAnalysis.UnusedVariable" in an unused
;; variable warning)
(setq flymake-phpcs-show-rule t)

(require 'flymake-phpcs)
