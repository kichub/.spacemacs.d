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

(provide 'init-mine-defun)
