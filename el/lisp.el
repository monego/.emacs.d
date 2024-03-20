(require 'rainbow-delimiters)

(use-package geiser-guile)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

(use-package paredit
  :hook  ((scheme-mode . enable-paredit-mode)
          (lisp-mode . enable-paredit-mode)
          (emacs-lisp-mode . enable-paredit-mode)))

(use-package rainbow-delimiters
  :hook ((scheme-mode . rainbow-delimiters-mode)
	 (emacs-lisp-mode . rainbow-delimiters-mode)))
