(setq inhibit-startup-screen t)
(require 'use-package)
(add-to-list 'load-path "~/.spacemacs.d/lisp/")

(set-language-environment "UTF-8")

(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(use-package move-text
  :ensure t
  )
(move-text-default-bindings)
(global-set-key (kbd "C-M-w") 'toggle-truncate-lines)

(require 'init-google-translate)
(require 'init-mine-iflipb)
(require 'init-mine-latex)
(require 'init-mine-bookmark)
(require 'init-mine-hydra)
(require 'init-mine-smartparens)

(use-package goto-chg
  :ensure t
  :demand t
  :bind ("C-M-<left>" . goto-last-change)
  :bind ("C-M-<right>" . goto-last-change-reverse))

;; 展示目录
(global-set-key (kbd "M-s i") 'counsel-imenu)

(global-set-key (kbd "M-c") 'spacemacs/toggle-maximize-buffer)

;; 自动缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

(global-set-key (kbd "C-M-l") 'indent-region-or-buffer)
(setq cmd-to-echo-add-output-to-process-buffers t)

(use-package pallet
  :ensure t
  )
(use-package solarized-theme
  :ensure t
  )

(setq yas-snippet-dirs
      '("~/.emacs.d/.cask/27.2/elpa/yasnippet-snippets-20210408.1234/"                 ;; personal snippets
        ;; "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
        ;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
        ))

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.


;; 高级搜索
(use-package swiper
  :ensure t
  )
(use-package counsel
  :ensure t
  )
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-h C-f") 'counsel-describe-function)
(global-set-key (kbd "C-h C-v") 'counsel-describe-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(global-set-key (kbd "M-s s") 'find-function-at-point)

;; helm-ag 高级搜索
(global-set-key (kbd "C-S-s") 'helm-do-ag-project-root)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; 同时编辑多个区域的插件
(global-set-key (kbd "M-S-C-j") 'iedit-mode)

(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x C-b") 'ivy-switch-buffer ) 

;; 正常删除模式
(delete-selection-mode 1)

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 缩写;快捷方式
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ;; Shifu
                                            ("8zl" "zilongshanren")
                                            ;; Tudi
                                            ("8lxy" "lixinyang")
                                            ("gsk" "(global-set-key (kbd "" ) ' )")
                                            ))

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.spacemacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)

;; 刷新文件
(defun refresh-file ()
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t))

(global-set-key [(f5)] 'refresh-file)

;; 关闭备份文件
(setq make-backup-files nil)
;; 取消自动保存文件
(setq auto-save-default nil)
;; 取消无用缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 递归删除和递归copy(Dired Mode)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; ;; 延迟加载
;; (with-eval-after-load 'dired
;;   (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(windmove-default-keybindings 'control)
(windswap-default-keybindings 'control 'shift)


(provide 'init-mine)
