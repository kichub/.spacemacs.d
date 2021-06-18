(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure t
  )

(use-package ivy
  :ensure t
  :config
  (ivy-mode)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "M-s i") 'counsel-imenu)
  (global-set-key (kbd "C-h C-f") 'counsel-describe-function)
  (global-set-key (kbd "C-h C-v") 'counsel-describe-variable)
  (global-set-key (kbd "C-h C-o") 'counsel-describe-symbol)
  (global-set-key (kbd "C-h C-l") 'counsel-find-library)
  (global-set-key (kbd "C-h C-i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "C-h C-u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-S-s") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  :bind
  (("M-y" . counsel-yank-pop))
  )

(use-package helm
  :ensure t
  :config
  (setq history-delete-duplicates t)
  (setq history-length 1000)
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-r" . helm-recentf)
  )

(provide 'init-mine-ivy)
