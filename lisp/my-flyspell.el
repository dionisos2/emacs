(abbrev-mode 1)

(add-hook 'text-mode-hook
          'flyspell-mode)
(add-hook 'prog-mode-hook
          'flyspell-prog-mode)

(add-hook 'flyspell-mode-hook
          'abbrev-mode)

(add-hook 'flyspell-mode-hook (lambda () (guess-language-mode 1)))
