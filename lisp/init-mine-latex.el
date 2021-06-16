(use-package cdlatex
  :ensure t
  )

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

;;  make AUCTeX aware of style files and multi-file documents right away,
(setq TeX-auto-save t) 
(setq TeX-parse-self t)
(setq-default TeX-master nil)

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


;; local configuration for TeX modes
(defun my-latex-mode-setup ()
  (setq-local company-backends
              (append '((company-math-symbols-latex
                         company-latex-commands
                         math-symbol-list-basic
                         math-symbol-list-extended
                         math-symbol-list-packages
                         math-symbol-list-latex-commands))
                      company-backends)))
(add-hook 'TeX-mode-hook 'my-latex-mode-setup)

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

(global-set-key (kbd "`") 'cdlatex-math-symbol)

;; (with-eval-after-load "latex"
;;   (define-key LaTeX-mode-map (kbd  "`")
;;     (lambda ()
;;       (interactive)
;;       (cdlatex-math-symbol))))

;; (defun my-latex-mode-hook ()
;;   (local-set-key (kbd "`") 'cdlatex-math-symbol))

;; (add-hook 'latex-mode-hook 'my-latex-mode-hook)

;; (with-eval-after-load "latex-mode"
;;   (add-hook 'tex-mode-hook (local-set-key (kbd "`") 'cdlatex-math-symbol))
;;   (add-hook 'latex-mode-hook (local-set-key (kbd "`") 'cdlatex-math-symbol)))


;; (with-eval-after-load "tex-mode"
;;   (add-hook 'tex-mode-hook (local-set-key (kbd "`") 'cdlatex-math-symbol))
;;   (add-hook 'latex-mode-hook (local-set-key (kbd "`") 'cdlatex-math-symbol)))

;; (global-set-key latex-mode-map (kbd "`") 'cdlatex-math-symbol)

;; (add-hook 'LaTeX-mode-hook
;;           (lambda ()
;;             (define-key LaTeX-mode-map (kbd "`") 'cdlatex-math-symbol)
;;             ))

;; (with-eval-after-load "latex"
;;   (define-key LaTeX-mode-map (kbd "`") 'cdlatex-math-symbol))

;; (with-eval-after-load "emacs-lisp"
;;   (define-key LaTeX-mode-map (kbd "M-[")
;;     (lambda ()
;;       (interactive)
;;       (cdlatex-math-symbol))))

;; (eval-after-load 'org-mode
;;   '(define-key LaTeX-mode-map (kbd "M-[") 'cdlatex-math-symbol))

;; (eval-after-load 'latex-mode
;;   '(define-key LaTeX-mode-map (kbd "M-[") 'cdlatex-math-symbol))

;; (add-hook 'latex-mode-hook
;;           (lambda () (local-set-key (kbd "`") 'cdlatex-math-symbol)))

;; (with-eval-after-load "tex-mode"
;;   (define-key LaTeX-mode-map (kbd "`") 'cdlatex-math-symbol))

;; (define-derived-mode latex-mode nil "LaTex"
;;   "Major mode for learnEn.\{learnEn-mode-map}"
;;   (cdlatex-math-symbol))

;; (evil-define-key 'normal latex-mode-map "\`" 'cdlatex-math-symbol)

(provide 'init-mine-latex)
