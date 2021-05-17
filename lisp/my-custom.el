(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook nil)
 '(auto-image-file-mode t)
 '(auto-save-default nil)
 '(avy-escape-chars '(27 7))
 '(avy-keys '(97 117 105 101 116 115 114 110 113 120))
 '(backup-directory-alist
	 '(("." . "/home/dionisos/personnelle/records_and_save/emacs_backups/")))
 '(backward-delete-char-untabify-method nil)
 '(browse-url-browser-function 'eww-browse-url)
 '(c-default-style '((c-mode . "haypo") (c++-mode . "haypo")))
 '(calendar-day-header-array ["Di" "Lu" "Ma" "Me" "Je" "Ve" "Sa"])
 '(calendar-day-name-array
	 ["Dimanche" "Lundi" "Mardi" "Mercredi" "Jeudi" "Vendredi" "Samedi"])
 '(calendar-week-start-day 1)
 '(case-fold-search nil)
 '(column-number-mode t)
 '(company-backends
	 '((company-dabbrev-code company-gtags company-etags company-keywords company-abbrev company-dabbrev)
		 company-dabbrev))
 '(company-dabbrev-char-regexp "\\(\\sw\\|[-$_]\\)")
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(company-dabbrev-minimum-length 3)
 '(company-idle-delay 0.2)
 '(company-statistics-mode t)
 '(counsel-grep-swiper-limit 30000)
 '(current-language-environment "utf-8")
 '(dash-docs-docsets-path "/home/dionisos/.local/share/Zeal/Zeal/docsets")
 '(delete-by-moving-to-trash t)
 '(delete-selection-mode 1)
 '(dired-du-size-format t)
 '(dired-hide-details-hide-information-lines nil)
 '(dired-hide-details-hide-symlink-targets nil)
 '(dired-listing-switches "-alh")
 '(diredp-hide-details-initially-flag nil)
 '(doc-view-continuous t)
 '(elpy-eldoc-show-current-function nil)
 '(elpy-modules
	 '(elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults))
 '(explicit-shell-file-name "/usr/bin/fish")
 '(find-file-visit-truename t)
 '(flycheck-checkers
	 '(tex-aspell-dynamic ada-gnat asciidoctor asciidoc awk-gawk bazel-buildifier c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint css-stylelint cuda-nvcc cwl d-dmd dockerfile-hadolint elixir-credo emacs-lisp emacs-lisp-checkdoc ember-template erlang-rebar3 erlang eruby-erubis eruby-ruumba fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert go-staticcheck groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy javascript-eslint javascript-jshint javascript-standard json-jsonlint json-python-json json-jq jsonnet less less-stylelint llvm-llc lua-luacheck lua markdown-markdownlint-cli markdown-mdl nix nix-linter opam perl perl-perlcritic php php-phpmd php-phpcs processing proselint protobuf-protoc protobuf-prototool pug puppet-parser puppet-lint python-flake8 python-pylint python-pycompile python-pyright python-mypy r-lintr racket rpm-rpmlint rst-sphinx rst ruby-rubocop ruby-standard ruby-reek ruby-rubylint ruby ruby-jruby rust-cargo rust rust-clippy scala scala-scalastyle scheme-chicken scss-lint scss-stylelint sass/scss-sass-lint sass scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint systemd-analyze tcl-nagelfar terraform terraform-tflint tex-chktex tex-lacheck texinfo textlint typescript-tslint verilog-verilator vhdl-ghdl xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby yaml-yamllint))
 '(flycheck-emacs-lisp-load-path '("/home/dionisos/.emacs.d/lisp"))
 '(global-company-mode t)
 '(global-flycheck-mode t)
 '(global-undo-tree-mode t)
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "fr")
 '(helm-bookmark-show-location t)
 '(helm-buffer-max-length nil)
 '(helm-mode t)
 '(helm-prevent-escaping-from-minibuffer nil)
 '(history-length 10000)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-enable-regexp nil)
 '(ido-mode 'both nil (ido))
 '(indent-tabs-mode t)
 '(inhibit-startup-screen t)
 '(ivy-height 20)
 '(ivy-prescient-mode t)
 '(kill-ring-max 100)
 '(langtool-default-language "fr")
 '(langtool-java-classpath "/usr/share/languagetool:/usr/share/java/languagetool/*")
 '(langtool-mother-tongue "fr")
 '(line-move-visual nil)
 '(line-number-mode t)
 '(minibuffer-prompt-properties '(read-only t cursor-intangible t face minibuffer-prompt))
 '(openwith-associations '((".pdf" "evince" (file)) (".docx" "libreoffice" (file))))
 '(openwith-mode t)
 '(org-agenda-files
	 '("~/organisation/agenda.org" "~/organisation/birthdays.org"))
 '(org-agenda-include-diary t)
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-window-setup 'current-window)
 '(org-closed-keep-when-no-todo nil)
 '(org-columns-default-format "%TODO %ITEM %Effort{:}")
 '(org-log-done nil)
 '(org-log-repeat nil)
 '(org-roam-directory "~/projets/R&D/org_roam/")
 '(org-startup-truncated nil)
 '(org-tags-column 100)
 '(org-tags-exclude-from-inheritance '("ORDERED"))
 '(org-timer-default-timer "4")
 '(org-track-ordered-property-with-tag t)
 '(package-archives
	 '(("melpa" . "http://melpa.org/packages/")
		 ("gnu" . "http://elpa.gnu.org/packages/")))
 '(package-selected-packages
	 '(ranger guess-language kiwix google-translate dired-du dash-functional phi-search multiple-cursors wgrep ivy-prescient counsel async ivy-todo ivy swiper avy smartparens find-file-in-project flymake-eslint org-roam csharp-mode kmb flycheck-elm flycheck-haskell json-mode elpy key-chord markdown-mode dired-quick-sort fish-mode openwith s web-beautify company-lua company-math company-php company-statistics elm-mode bind-key realgud which-key picpocket anchored-transpose geben julia-mode lua-mode python-mode web-mode magit auctex flycheck graphviz-dot-mode langtool pylint undo-tree yaml-mode php-mode spray dired-narrow dired+))
 '(printer-name "EPSON_WF-2750")
 '(proced-auto-update-flag t)
 '(proced-auto-update-interval 1)
 '(python-indent-guess-indent-offset t)
 '(python-indent-offset 4)
 '(python-indent-trigger-commands '(indent-for-tab-command yas-expand))
 '(python-shell-interpreter "python")
 '(python-shell-interpreter-args "")
 '(python-shell-virtualenv-root "/home/dionisos/.emacs.d/elpy/rpc-venv")
 '(ranger-cleanup-eagerly t)
 '(ranger-override-dired 'ranger)
 '(ranger-override-dired-mode t)
 '(ranger-show-hidden 'hidden)
 '(ranger-show-literal nil)
 '(ranger-width-preview 0.5)
 '(realgud:pdb-command-name "python -m pdb")
 '(safe-local-variable-values
	 '((py-indent-offset . 4)
		 (eval setq byte-compile-not-obsolete-vars
					 '(display-buffer-function))))
 '(savehist-mode t)
 '(scroll-conservatively 99)
 '(scroll-step 1)
 '(select-enable-clipboard t)
 '(show-paren-mode 't)
 '(show-trailing-whitespace t)
 '(smartparens-global-mode t)
 '(speedbar-indentation-width 4)
 '(spray-margin-left 20)
 '(spray-margin-top 6)
 '(spray-wpm 400)
 '(standard-indent 2)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(trash-directory "/home/dionisos/.local/share/Trash/files")
 '(truncate-lines nil)
 '(truncate-partial-width-windows nil)
 '(version-control t)
 '(visible-bell t)
 '(web-mode-markup-indent-offset 2)
 '(which-key-frame-max-height 100)
 '(which-key-idle-delay 0.2)
 '(which-key-mode t)
 '(which-key-paging-prefixes '("C-c"))
 '(winner-mode t)
 '(wl-from " denis.baudouin@gmail.com")
 '(yank-excluded-properties t)
 '(yas-indent-line 'fixed)
 '(yas-snippet-dirs
	 '("/home/dionisos/.emacs.d/snippets/snippets" "/home/dionisos/.emacs.d/elpa/elpy-20210328.1852/snippets/")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-error ((t (:underline (:color "Red1" :style wave)))))
 '(flycheck-verify-select-checker ((t (:box (:line-width 1 :style released-button)))))
 '(ivy-modified-buffer ((t (:foreground "red"))))
 '(ivy-org ((t (:inherit black))))
 '(region ((t (:background "blue1" :foreground "white"))))
 '(web-mode-html-attr-name-face ((t (:foreground "red"))))
 '(web-mode-html-tag-face ((t (:foreground "red")))))
