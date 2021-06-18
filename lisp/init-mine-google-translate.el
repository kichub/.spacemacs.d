(use-package google-translate
    :ensure t
)
(require 'google-translate-default-ui)

(when (and (string-match "0.12.0"
                         (google-translate-version))
           (>= (time-to-seconds)
               (time-to-seconds
                (encode-time 0 0 0 23 9 2018))))
  (defun google-translate--get-b-d1 ()
    ;; TKK='427116.3269864724'
    (list 427110 1469889687)))


;; 配置翻译失败 wget 或者 curl
;; (setq google-translate-backend-method 'curl)
;; (push '(foo :name "foo-x86" :args ("-q" "--agent"))
;;       google-translate-backend-commands)
;; (setq google-translate-backend-method 'foo)



;;需要将谷歌翻译地址的.com修改成.cn,否则在国内无法进行访问
;; (setq google-translate-base-url
;;       "https://translate.google.cn/translate_a/single")
;; (setq google-translate-listen-url
;;       "https://translate.google.cn/translate_tts")
;; (setq google-translate--tkk-url
;;       "https://translate.google.cn")
;; ;;配置默认语言
;; (setq google-translate-default-source-language "en")
;; (setq google-translate-default-target-language "zh-CN")
;; (setq-default google-translate-enable-ido-completion t)
;; (setq-default google-translate-show-phonetic nil)
(setq google-translate-translation-directions-alist
      '(("en" . "zh-CN") ("zh-CN" . "en") ))



;; 配置快捷键
(global-set-key (kbd"C-q") 'google-translate-at-point)
(global-set-key (kbd "M-q") 'google-translate-smooth-translate)
;; 配置样式
(set-face-attribute 'google-translate-translation-face nil :height 1.2)


;; youdao-dictionary 有道词典
;; (require 'youdao-dictionary)
;; (global-set-key (kbd "M-q") 'youdao-dictionary-search-from-input)
;; (global-set-key (kbd "C-q") 'youdao-dictionary-search-async)

(provide 'init-mine-google-translate)
