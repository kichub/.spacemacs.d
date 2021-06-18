;; 缩写;快捷方式
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ;; Shifu
                                            ("8zl" "zilongshanren")
                                            ;; Tudi
                                            ("8lxy" "lixinyang")
                                            ("gsk" "(global-set-key (kbd "" ) ' )")
                                            ))

(provide 'init-mine-abbrev)
