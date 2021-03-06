(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (list
                        "~/Sync/orgfiles/gcal.org" 
                        "~/opt/gcal.org"
                        "~/opt/soe-cal.org"
                        "~/Sync/orgfiles/i.org"))
(setq org-capture-templates
      '(
        ("a" "Appointment" entry (file+headline "~/Sync/orgfiles/gcal.org" "Appointments")
         "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
        ("l" "Link" entry (file+headline "~/Sync/orgfiles/links.org" "Links")
         "* %a %^g\n %?\n %T\n %i")
        ("b" "Blog idea" entry (file+headline "~/Sync/orgfiles/i.org" "POSTS:")
         "* %?\n%T" :prepend t)
        ("t" "To Do Item" entry (file+headline "~/Sync/orgfiles/i.org" "To Do and Notes")
         "* TODO %?\n%u" :prepend t)
        ("m" "Mail To Do" entry (file+headline "~/Sync/orgfiles/i.org" "To Do and Notes")
         "* TODO %a\n %?" :prepend t)
        ("n" "Note" entry (file+olp "~/Sync/orgfiles/i.org" "Notes")
         "* %u %? " :prepend t)
        ("r" "RSS" entry (file+headline "~/Sync/shared/elfeed.org" "Feeds misc")
         "** %A %^g\n")
        ("j" "Journal" entry (file+datetree "~/Sync/orgfiles/journal.org" "Journal")
         "* %?\n Entered on %U\n %i\n %a")
        ))

(use-package elfeed
  :ensure t
  :config
  (global-set-key (kbd "C-x w") 'elfeed)
  (setf url-queue-timeout 30)
  (setq elfeed-feeds
        '(("http://nullprogram.com/feed/" blog emacs)
          ("http://www.50ply.com/atom.xml" 50ply)
          ("http://planet.emacsen.org/atom.xml" planet)
          ("http://nedroid.com/feed/" webcomic)))
  ;; Mark all YouTube entries
  ;; (add-hook 'elfeed-new-entry-hook
  ;;           (elfeed-make-tagger :feed-url "youtube\\.com"
  ;;                               :add '(video youtube)))
  :bind
  ("C-x x" . elfeed)
  )

(use-package projectile
  :ensure t
  :bind (:map projectile-mode-map
              ("M-p" . 'projectile-command-map)
              ("C-c p" . 'projectile-command-map)
              )

  :config 
  (setq projectile-completion-system 'ivy)

  (projectile-mode +1))


(use-package ibuffer-projectile
  :ensure t
  :config 
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-projectile-set-filter-groups)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic))))
  )

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config 
  (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :init
  (dumb-jump-mode)
  :ensure
  )

(setq xref-show-definitions-function #'xref-show-definitions-completing-read)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; (use-package pdf-tools
;;   :ensure t
;;   :config
;;   (pdf-tools-install)
;;   )
;; (use-package org-pdftools
;;   :ensure t
;;   )

(use-package company
  :ensure t
  :init
  (setq company-backends
        '(
          company-bbdb
          company-eclim
          ;; CEDET Semantic
          company-semantic
          ;; Clang is a parser for C and ObjC.
          company-clang
          ;; completion backend for Xcode projects
          company-xcode
          ;; CMake is a cross-platform, open-source make system.
          company-cmake
          ;; The CAPF back-end provides a bridge to the standard
          ;; `completion-at-point-functions' facility, and thus can support any major mode
          ;; that defines a proper completion function, including emacs-lisp-mode,
          ;; css-mode and nxml-mode.
          company-capf
          ;; Completions works for proper absolute and relative files paths.
          company-files
          ;; Grouped backends
          (;; The backend looks for all symbols in the current buffer that aren't
           ;; in comments or strings.
           company-dabbrev-code
           ;; backend for GNU Global
           company-gtags
           ;; backend for etags
           company-etags
           ;; backend for programming language keywords
           company-keywords)
          ;; backend for `oddmuse-mode'
          company-oddmuse
          ;; dabbrev-like `company-mode' completion backend.
          company-dabbrev)
        )
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (global-company-mode t)   
  )

;;    (use-package aggressive-indent 
;;      :ensure t
;;      :config
;;     (global-aggressive-indent-mode nil)
;;     (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
;;      )

(use-package multiple-cursors
:ensure t
)

(defhydra hydra-multiple-cursors (:hint nil)
  "
 Up^^             Down^^           Miscellaneous           % 2(mc/num-cursors) cursor%s(if (> (mc/num-cursors) 1) \"s\" \"\")
------------------------------------------------------------------
 [_p_]   Next     [_n_]   Next     [_l_] Edit lines  [_0_] Insert numbers
 [_P_]   Skip     [_N_]   Skip     [_a_] Mark all    [_A_] Insert letters
 [_M-p_] Unmark   [_M-n_] Unmark   [_s_] Search
 [Click] Cursor at point       [_q_] Quit"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("s" mc/mark-all-in-region-regexp :exit t)
  ("0" mc/insert-numbers :exit t)
  ("A" mc/insert-letters :exit t)
  ("<mouse-1>" mc/add-cursor-on-click)
  ;; Help with click recognition in this hydra
  ("<down-mouse-1>" ignore)
  ("<drag-mouse-1>" ignore)
  ("q" nil))

(use-package auto-yasnippet
:ensure t
)
