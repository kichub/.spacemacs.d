(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(iedit-occurrence ((t (:inherit ## :foreground "#A6E22E"))))
 '(js2-external-variable ((t (:foreground "dark gray"))))
 '(region ((t (:inherit highlight :extend t :foreground "white" :background "#3390FF")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-idle-delay 0.01)
 '(company-minimum-prefix-length 1)
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" default))
 '(display-time-mode t)
 '(evil-leader/leader "SPC")
 '(evil-want-C-u-scroll t)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#3C3D37")
 '(fringe-mode 0 nil (fringe))
 '(global-linum-mode t)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode t)
 '(org-pomodoro-long-break-length 40)
 '(package-selected-packages
   '(font-lock+ evil-unimpaired hybrid-mode zzz-to-char 4clojure ac-ispell ace-link ace-pinyin aggressive-indent anki-editor attrap auctex-latexmk auto-compile auto-complete auto-dictionary auto-highlight-symbol blacken browse-at-remote cal-china-x caps-lock cargo ccls centered-cursor-mode chinese-conv cider cider-eval-sexp-fu clean-aindent-mode clojure-mode clojure-snippets cmake-font-lock cmake-mode cmm-mode color-identifiers-mode column-enforce-mode company-auctex company-c-headers company-cabal company-emoji company-lua company-math company-reftex company-restclient company-rtags company-statistics company-web company-ycmd counsel-css counsel-gtags counsel-projectile cpp-auto-include cuda-mode cython-mode dante dap-mode define-word deft diminish dired-quick-sort discover-my-major dotenv-mode drag-stuff dumb-jump editorconfig elisp-slime-nav emmet-mode emoji-cheat-sheet-plus emojify emr engine-mode esh-help eshell-prompt-extras eshell-z eval-sexp-fu evil-anzu evil-args evil-cleverparens evil-collection evil-easymotion evil-ediff evil-escape evil-exchange evil-goggles evil-iedit-state evil-indent-plus evil-lion evil-lisp-state evil-matchit evil-numbers evil-org evil-textobj-line evil-tutor evil-visual-mark-mode evil-visualstar eyebrowse fancy-battery find-by-pinyin-dired find-file-in-project flx-ido flycheck-elsa flycheck-haskell flycheck-package flycheck-pos-tip flycheck-rtags flycheck-rust flycheck-ycmd flyspell-correct-ivy fuzzy ggtags gh-md gist git-gutter-fringe+ git-link git-messenger git-timemachine gitattributes-mode gitconfig-mode github-clone github-search gitignore-mode gitignore-templates glsl-mode gnuplot golden-ratio google-c-style google-translate graphviz-dot-mode grip-mode haskell-snippets helm-github-stars helm-make highlight-indentation highlight-numbers highlight-parentheses hindent hl-todo hlint-refactor ibuffer-projectile impatient-mode importmagic indent-guide ivy-avy ivy-hydra ivy-purpose ivy-rtags ivy-xref ivy-yasnippet js-doc json-mode json-navigator json-reformat json-snatcher know-your-http-well launchctl lcr link-hint lispyville list-utils live-py-mode logito lorem-ipsum lsp-haskell lsp-ivy lsp-latex lsp-origami lsp-pyright lsp-python-ms lsp-treemacs lsp-ui lua-mode macrostep makey markdown-toc marshal math-symbol-lists mmm-mode modus-operandi-theme modus-themes multi-line multi-term mwim nameless nov npm-mode ob-http ob-restclient ob-typescript open-junk-file opencl-mode org-brain org-cliplink org-download org-mime org-present org-projectile org-rich-yank org-super-agenda org-superstar orgit origami osx-clipboard osx-trash overseer ox-hugo package-lint packed pangu-spacing paradox paredit parent-mode parseedn password-generator pcache pcre2el peep-dired pinyinlib pip-requirements pipenv pippel plantuml-mode poetry prettier-js prodigy pug-mode py-isort pyenv-mode pytest pyvenv queue quickrun racer racket-mode rainbow-delimiters rainbow-identifiers rainbow-mode ranger restart-emacs restclient rime rjsx-mode ron-mode rtags rust-mode sass-mode scss-mode sesman shell-pop sicp simple-httpd slim-mode smeargle smex sound-wav spaceline-all-the-icons sphinx-doc spinner ssh-agency string-edit string-inflection symbol-overlay symon tagedit terminal-here tide tiny toc-org toml-mode treemacs-evil treemacs-icons-dired treemacs-magit treemacs-persp treemacs-projectile ts typescript-mode undo-tree unfill use-package uuidgen vi-tilde-fringe visual-regexp-steroids volatile-highlights web-beautify web-completion-data wgrep window-purpose winum with-editor wrap-region writeroom-mode ws-butler xterm-color yapfify ycmd youdao-dictionary zoutline company-anaconda auctex abc-mode ztree command-log-mode helm-core markdown-mode multiple-cursors pkg-info popup powerline-evil reveal-in-osx-finder s ansi shut-up epl git commander f pallet which-key evil-nerd-commenter evil-surround window-numbering evil-leader evil company yaml-mode monokai-theme hungry-delete swiper counsel smartparens popwin js2-mode nodejs-repl exec-path-from-shell expand-region web-mode js2-refactor iedit org-pomodoro helm-ag flycheck yasnippet auto-yasnippet yasnippet-snippets))
 '(pallet-mode t)
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(popwin:popup-window-position 'right)
 '(popwin:popup-window-width 90)
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))