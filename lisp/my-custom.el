(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook nil)
 '(auto-save-default nil)
 '(backward-delete-char-untabify-method nil)
 '(browse-url-browser-function (quote eww-browse-url))
 '(c-default-style (quote ((c-mode . "haypo") (c++-mode . "haypo"))))
 '(column-number-mode t)
 '(company-backends
   (quote
    ((company-dabbrev-code company-gtags company-etags company-keywords company-abbrev company-dabbrev)
     company-dabbrev)))
 '(company-dabbrev-char-regexp "\\(\\sw\\|[-$_]\\)")
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(company-dabbrev-minimum-length 3)
 '(company-idle-delay 0.2)
 '(current-language-environment "utf-8")
 '(delete-by-moving-to-trash t)
 '(delete-selection-mode 1)
 '(describe-char-unidata-list
   (quote
    (name old-name general-category canonical-combining-class bidi-class decomposition decimal-digit-value)))
 '(dired-hide-details-hide-information-lines nil)
 '(dired-hide-details-hide-symlink-targets nil)
 '(dired-listing-switches "-alh")
 '(diredp-hide-details-initially-flag nil)
 '(doc-view-continuous t)
 '(ein:enable-keepalive t)
 '(ein:force-sync nil)
 '(ein:jupyter-default-notebook-directory "/home/dionisos/projets/programmation/notebooks/")
 '(ein:jupyter-default-server-command "jupyter")
 '(ein:jupyter-server-args (quote ("--no-browser")))
 '(ein:jupyter-server-buffer-name "jupyter-server")
 '(ein:notebooklist-first-open-hook nil)
 '(ein:worksheet-enable-undo t)
 '(elpy-eldoc-show-current-function nil)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(find-file-visit-truename t)
 '(flycheck-checkers
   (quote
    (my-php-checker my-php-phpcs ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy jade javascript-jshint javascript-standard javascript-eslint javascript-gjslint javascript-jscs json-jsonlint json-python-json less lua-luacheck lua perl perl-perlcritic php php-phpmd php-phpcs processing puppet-parser puppet-lint python-pylint python-flake8 python-pycompile r-lintr racket rpm-rpmlint markdown-mdl rst-sphinx rst ruby-rubocop ruby-rubylint ruby ruby-jruby rust-cargo rust sass scala scala-scalastyle scheme-chicken scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(flycheck-emacs-lisp-load-path (quote inherit))
 '(global-flycheck-mode t)
 '(helm-bookmark-show-location t)
 '(helm-buffer-max-length nil)
 '(helm-dash-browser-func (quote eww))
 '(helm-dash-candidate-format "%d %n (%t) [%f]")
 '(helm-dash-docsets-url (quote https://raw\.github\.com/Kapeli/feeds/master))
 '(helm-dash-min-length 2)
 '(helm-prevent-escaping-from-minibuffer nil)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-enable-regexp nil)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(kill-ring-max 100)
 '(langtool-default-language "fr")
 '(langtool-mother-tongue "fr")
 '(line-move-visual nil)
 '(line-number-mode t)
 '(minibuffer-prompt-properties
   (quote
    (read-only t cursor-intangible t face minibuffer-prompt)))
 '(openwith-associations (quote (("\\.pdf\\'" "evince" (file)))))
 '(org-agenda-files
   (quote
    ("~/organisation/agenda.org" "~/organisation/birthdays.org")))
 '(org-agenda-include-diary t)
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-window-setup (quote current-window))
 '(org-closed-keep-when-no-todo nil)
 '(org-columns-default-format "%TODO %ITEM %Effort{:}")
 '(org-log-done nil)
 '(org-log-repeat nil)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-checklist)))
 '(org-startup-truncated nil)
 '(org-tags-column 100)
 '(org-tags-exclude-from-inheritance (quote ("ORDERED")))
 '(org-track-ordered-property-with-tag t)
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (helm-dash key-chord markdown-mode ein dired-quick-sort fish-mode openwith s helm-swoop web-beautify company-lua company-math company-php company-statistics elm-mode helm-company bind-key realgud which-key picpocket anchored-transpose geben julia-mode lua-mode python-mode web-mode magit ace-jump-mode auctex elpy flycheck graphviz-dot-mode langtool pylint undo-tree yaml-mode php-mode spray dired-narrow dired+)))
 '(pdf-view-continuous t)
 '(printer-name "EPSON_WF-2750")
 '(python-shell-interpreter "python")
 '(python-shell-interpreter-args "")
 '(realgud:pdb-command-name "python -m pdb")
 '(safe-local-variable-values
   (quote
    ((eval setq byte-compile-not-obsolete-vars
           (quote
            (display-buffer-function))))))
 '(savehist-mode t)
 '(scroll-conservatively 99)
 '(scroll-step 1)
 '(select-enable-clipboard t)
 '(show-paren-mode (quote t))
 '(show-trailing-whitespace t)
 '(speedbar-indentation-width 4)
 '(spray-margin-left 20)
 '(spray-margin-top 6)
 '(spray-wpm 400)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(trash-directory "/home/dionisos/.local/share/Trash/files")
 '(truncate-lines nil)
 '(truncate-partial-width-windows nil)
 '(visible-bell t)
 '(web-mode-markup-indent-offset 2)
 '(which-key-frame-max-height 100)
 '(which-key-idle-delay 0.2)
 '(which-key-mode t)
 '(which-key-paging-prefixes (quote ("C-c")))
 '(wl-from " denis.baudouin@gmail.com")
 '(yank-excluded-properties t)
 '(yas-indent-line (quote fixed))
 '(yas-snippet-dirs
   (quote
    ("/home/dionisos/.emacs.d/snippets/snippets" "/home/dionisos/.emacs.d/elpa/elpy-20190314.2349/snippets/"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "blue1" :foreground "white"))))
 '(web-mode-html-attr-name-face ((t (:foreground "red")))))
