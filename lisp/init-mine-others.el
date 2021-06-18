(use-package beacon
  :ensure t
  :config
  (beacon-mode t)
  )

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode t)
  )


(use-package expand-region
  :ensure t
  :config
  :bind ("C-=" . er/expand-region))


(use-package iedit
  :ensure t
  :bind ("M-S-C-j" . 'iedit-mode)
  )

(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings)
  )

(use-package goto-chg
  :ensure t
  :demand t
  :bind ("C-M-<left>" . goto-last-change)
  :bind ("C-M-<right>" . goto-last-change-reverse))

(setq save-interprogram-paste-before-kill t)

;; 正常删除模式
(delete-selection-mode 1)

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

(provide 'init-mine-others)




