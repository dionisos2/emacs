(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook nil)
 '(auto-save-default nil)
 '(backward-delete-char-untabify-method nil)
 '(column-number-mode t)
 '(current-language-environment "utf-8")
 '(delete-by-moving-to-trash t)
 '(delete-selection-mode 1)
 '(dired-listing-switches "-alh")
 '(find-file-visit-truename t)
 '(flycheck-checkers
   (quote
    (my-php-checker my-php-phpcs ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy jade javascript-jshint javascript-standard javascript-eslint javascript-gjslint javascript-jscs json-jsonlint json-python-json less lua-luacheck lua perl perl-perlcritic php php-phpmd php-phpcs processing puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint markdown-mdl rst-sphinx rst ruby-rubocop ruby-rubylint ruby ruby-jruby rust-cargo rust sass scala scala-scalastyle scheme-chicken scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(flycheck-emacs-lisp-load-path (quote inherit))
 '(global-flycheck-mode t)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-enable-regexp nil)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(kill-ring-max 100)
 '(line-move-visual nil)
 '(line-number-mode t)
 '(org-agenda-files
   (quote
    ("~/organisation/agenda.org" "~/organisation/birthdays.org")))
 '(org-agenda-include-diary t)
 '(org-columns-default-format "%TODO %ITEM %Effort{:}")
 '(org-log-repeat nil)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-checklist)))
 '(org-startup-truncated nil)
 '(org-tags-column 100)
 '(org-tags-exclude-from-inheritance (quote ("ORDERED")))
 '(org-track-ordered-property-with-tag t)
 '(package-selected-packages
   (quote
    (magit dired-narrow dired+ wanderlust realgud mocha json-mode mwe-log-commands lua-mode flycheck elm-mode)))
 '(scroll-conservatively 99)
 '(scroll-step 1)
 '(select-enable-clipboard t)
 '(show-paren-mode (quote t))
 '(show-trailing-whitespace t)
 '(speedbar-indentation-width 4)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(trash-directory "/home/dionisos/.local/share/Trash/files")
 '(truncate-lines nil)
 '(truncate-partial-width-windows nil)
 '(visible-bell t)
 '(wl-from " denis.baudouin@gmail.com")
 '(yank-excluded-properties t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "blue1" :foreground "gtk_selection_fg_color"))))
 '(web-mode-html-attr-name-face ((t (:foreground "red")))))
