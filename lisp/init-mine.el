(setq inhibit-startup-screen t)
(setq lisp-path "~/.spacemacs.d/lisp/")
(add-to-list 'load-path lisp-path)

(require 'init-mine-google-translate)
(require 'init-mine-iflipb)
(require 'init-mine-latex)
(require 'init-mine-bookmark)
(require 'init-mine-hydra)
(require 'init-mine-smartparens)
(require 'init-mine-undo-tree)
(require 'init-mine-others)
(require 'init-mine-ivy)
(require 'init-mine-abbrev)
(require 'init-mine-indent)
(require 'init-mine-yasnippet)
(require 'init-mine-defun)
(require 'init-mine-windswap)
(require 'init-mine-undo-tree)

;; org配置文件
(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (concat lisp-path "init-mine-org.org"))

;; 关闭备份文件
(setq make-backup-files nil)
;; 取消自动保存文件
(setq auto-save-default nil)
;; 取消无用缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 递归删除和递归copy(Dired Mode)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq enable-recursive-minibuffers t)

;; yes or no
(fset 'yes-or-no-p 'y-or-n-p)

(set-language-environment "UTF-8")
(global-set-key (kbd "C-M-w") 'toggle-truncate-lines)
(global-set-key (kbd "M-c") 'spacemacs/toggle-maximize-buffer)


(global-set-key (kbd "C-h f") 'find-function-at-point)
(global-set-key (kbd "C-h v") 'find-variable-at-point)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(global-set-key (kbd "C-h k") 'describe-key)

(provide 'init-mine)
