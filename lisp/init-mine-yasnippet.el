(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.
  (setq yas-snippet-dirs
        '("~/.emacs.d/.cask/27.2/elpa/yasnippet-snippets-20210408.1234/"
          ))
  )

(provide 'init-mine-yasnippet)
