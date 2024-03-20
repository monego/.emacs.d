;; Flycheck is "more modern" than Flymake
;; Ruff should be used for flycheck
;; Elpy should not be used with eglot

(require 'flycheck)

(flycheck-define-checker python-ruff
  "A Python syntax and style checker using the ruff utility.
To override the path to the ruff executable, set
`flycheck-python-ruff-executable'.
See URL `http://pypi.python.org/pypi/ruff'."
  :command ("ruff"
            "--output-format=text"
            (eval (when buffer-file-name
                    (concat "--stdin-filename=" buffer-file-name)))
            "-")
  :standard-input t
  :error-filter (lambda (errors)
                  (let ((errors (flycheck-sanitize-errors errors)))
                    (seq-map #'flycheck-flake8-fix-error-level errors)))
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" (optional column ":") " "
            (id (one-or-more (any alpha)) (one-or-more digit)) " "
            (message (one-or-more not-newline))
            line-end))
  :modes python-mode)

(add-to-list 'flycheck-checkers 'python-ruff)

(defun my-python-setup ()
  (when (executable-find "pyright-langserver")
    (eglot-ensure)
    (setq-local eglot-server-programs
                `((python-mode . ("pyright-langserver" "--stdio"
                                  "--typeCheckingMode" "strict"
                                  "--logLevel" "off"
                                  "--incremental"))))
    (add-hook 'eglot-managed-mode #'flymake-ruff-load)
    (setq-local eglot-stay-out-of '(company)))
  (add-hook 'before-save-hook 'eglot-format-buffer t t))

(add-hook 'python-mode-hook 'my-python-setup)
(add-hook 'python-mode-hook 'blacken-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
