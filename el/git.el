(use-package magit
  :bind (("C-x g" . magit-status))
  :config
  (transient-append-suffix 'magit-am '(0) ;; after the first group
    ["Other"
     ("-M" "Patch format mbox" "--patch-format=mbox")
     ]))
