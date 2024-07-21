(use-package citar
  :bind (("C-c b" . citar-insert-citation)
         :map minibuffer-local-map
         ("M-b" . citar-insert-preset))
  :hook
  ((LaTeX-mode . citar-capf-setup)
   (org-mode . citar-capf-setup))
  :config
  (add-to-list 'citar-file-open-functions '("pdf" . citar-file-open-external))
  :custom
  (citar-bibliography '("~/Documentos/INPE/referencias.bib"))
  (citar-library-paths '("~/Documentos/INPE/Artigos"))
  (citar-notes-paths '("~/Documentos/INPE/Artigos/notes"))
  (citar-file-extensions '("pdf" "org")))

(use-package citar-embark
  :after citar embark
  :no-require
  :config (citar-embark-mode))

(use-package citar-org-roam
  :after (citar org-roam)
  :config (citar-org-roam-mode))
