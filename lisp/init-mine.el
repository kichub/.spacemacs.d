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

(use-package goto-chg
  :ensure t
  :demand t
  :bind ("C-M-<left>" . goto-last-change)
  :bind ("C-M-<right>" . goto-last-change-reverse))

;; 展示目录
(global-set-key (kbd "M-s i") 'counsel-imenu)

(global-set-key (kbd "M-c") 'spacemacs/toggle-maximize-buffer)

(global-set-key (kbd "C-o") '(kbd "C-c \@"))

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

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(windmove-default-keybindings 'control)
(windswap-default-keybindings 'control 'shift)

(require 'cdlatex)
;; 解决显示Unicode字符的卡顿问题
(setq inhibit-compacting-font-caches t)

;; 汉字默认字体为Kaiti(楷体)，可改为其它字体
(set-fontset-font "fontset-default" 'han
		              "simsun")
;; 数学符号默认字体为Cambria Math
(set-fontset-font "fontset-default" 'symbol
 		              "Cambria Math")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 以下为LaTeX mode相关设置
;; (setq-default TeX-master nil) ;; 编译时问询主文件名称
;; (setq TeX-parse-selt t) ;; 对新文件自动解析(usepackage, bibliograph, newtheorem等信息)
;; PDF正向搜索相关设置
(setq TeX-PDF-mode t) 
(setq TeX-source-correlate-mode t) 
(setq TeX-source-correlate-method 'synctex) 
(setq TeX-view-program-list 
      '(("Sumatra PDF" ("\"c:/Users/ckang/AppData/Local/SumatraPDF/SumatraPDF.exe\" -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o")))) 

;; 打开TeX文件时应该加载的mode/执行的命令
(defun my-latex-hook ()
  (turn-on-cdlatex) ;; 加载cdlatex
  (outline-minor-mode) ;; 加载outline mode
  (turn-on-reftex)  ;; 加载reftex
  ;; (auto-fill-mode)  ;; 加载自动换行
  (flyspell-mode)   ;; 加载拼写检查 (需要安装aspell)
  ;; (TeX-fold-mode t) ;; 加载TeX fold mode
  ;; (outline-hide-body) ;; 打开文件时只显示章节标题
  (assq-delete-all 'output-pdf TeX-view-program-selection)    ;; 以下两行是正向搜索相关设置
  (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))
  )
(add-hook 'LaTeX-mode-hook 'my-latex-hook)
;; LaTeX mode相关设置完毕
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 王垠提供的小工具: 按“%”匹配括号的小程序
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	      ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	      (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)

;; 调整自动补全字符串的优先级顺序
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
	      try-expand-dabbrev-visible
	      try-expand-dabbrev-all-buffers
	      try-expand-dabbrev-from-kill
	      try-complete-file-name-partially
	      try-complete-file-name
	      try-expand-all-abbrevs
	      try-expand-list
	      try-expand-line
	      try-complete-lisp-symbol-partially
	      try-complete-lisp-symbol))

(provide 'init-mine)
