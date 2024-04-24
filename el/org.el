(use-package org
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :hook ((org-mode . visual-line-mode)
         (org-mode . org-indent-mode)
         (org-mode . (lambda ()
                       (local-set-key (kbd "C-c u") #'org-copy-url))))
  :config
  (require 'ox-beamer)
  (fset 'org-copy-url
        (kmacro-lambda-form [?\C-c ?\C-l ?\C-  ?\C-a ?\M-w ?\C-x ?\C-0] 0 "%d"))
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((awk . t)
     (emacs-lisp . t)
     (julia . t)
     (python . t)
     (shell . t)))
  :custom
  (org-babel-default-header-args '((:results . "output")))
  (org-agenda-start-on-weekday 0)
  (org-startup-indented t)
  (org-pretty-entities t)
  (org-hide-emphasis-markers t)
  (org-startup-with-inline-images t)
  (org-image-actual-width '(300))
  (org-file-apps
   '((auto-mode . emacs)
     ("\\.x?html?\\'" . "xdg-open %s")))
  (org-directory "~/Documentos/Anotações/org")
  (org-agenda-files '("~/Documentos/Anotações/agenda.org"
                      "~/Documentos/Anotações/todo.org"))
  (org-log-done 'time)
  (org-todo-keywords
   '((sequence "TODO" "STARTED" "WAITING" "DELEGATED" "|" "DONE" "DEFERRED"))))

(use-package org-roam
  :after org
  :init (setq org-roam-v2-ack t)
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n r" . org-roam-node-random)
         (:map org-mode-map
               (("C-c n i" . org-roam-node-insert)
                ("C-c n o" . org-id-get-create)
                ("C-c n t" . org-roam-tag-add)
                ("C-c n a" . org-roam-alias-add)
                ("C-c n l" . org-roam-buffer-toggle))))
  :hook (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/Documentos/Anotações/org-roam")
  :config
  (require 'org-roam-protocol)
  (org-roam-setup))

(use-package consult-org-roam
  :after org-roam
  :init
  (require 'consult-org-roam)
  ;; Activate the minor mode
  (consult-org-roam-mode 1)
  :custom
  ;; Use `ripgrep' for searching with `consult-org-roam-search'
  (consult-org-roam-grep-func #'consult-ripgrep)
  ;; Configure a custom narrow key for `consult-buffer'
  (consult-org-roam-buffer-narrow-key ?r)
  ;; Display org-roam buffers right after non-org-roam buffers
  ;; in consult-buffer (and not down at the bottom)
  (consult-org-roam-buffer-after-buffers t)
  :config
  ;; Eventually suppress previewing for certain functions
  (consult-customize
   consult-org-roam-forward-links
   :preview-key "M-.")
  :bind
  ;; Define some convenient keybindings as an addition
  ("C-c n e" . consult-org-roam-file-find)
  ("C-c n b" . consult-org-roam-backlinks)
  ("C-c n B" . consult-org-roam-backlinks-recursive)
  ("C-c n l" . consult-org-roam-forward-links)
  ("C-c n r" . consult-org-roam-search))
