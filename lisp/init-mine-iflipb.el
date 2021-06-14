(use-package iflipb
  :ensure t
  )
;; wrap is better?! trying..
(setq iflipb-wrap-around t)
;; auto off function iflipb'ing
(setq my-iflipb-auto-off-timeout-sec 1)
(setq my-iflipb-auto-off-timer-canceler-internal nil)
(setq my-iflipb-ing-internal nil)
(defun my-iflipb-auto-off ()
  (message nil)
  (setq my-iflipb-auto-off-timer-canceler-internal nil
  		  my-iflipb-ing-internal nil)
  )
(defun my-iflipb-next-buffer (arg)
  (interactive "P")
  (iflipb-next-buffer arg)
  (if my-iflipb-auto-off-timer-canceler-internal
  		(cancel-timer my-iflipb-auto-off-timer-canceler-internal))
  (run-with-idle-timer my-iflipb-auto-off-timeout-sec 0 'my-iflipb-auto-off)
  (setq my-iflipb-ing-internal t)
  )
(defun my-iflipb-previous-buffer ()
  (interactive)
  (iflipb-previous-buffer)
  (if my-iflipb-auto-off-timer-canceler-internal
  		(cancel-timer my-iflipb-auto-off-timer-canceler-internal))
  (run-with-idle-timer my-iflipb-auto-off-timeout-sec 0 'my-iflipb-auto-off)
  (setq my-iflipb-ing-internal t)
  )
(global-set-key (kbd "<C-tab>") 'my-iflipb-next-buffer)
(global-set-key (kbd "<C-S-tab>") 'my-iflipb-previous-buffer)
(defun iflipb-first-iflipb-buffer-switch-command ()
  "Determines whether this is the first invocation of
  iflipb-next-buffer or iflipb-previous-buffer this round."
  (not (and (or (eq last-command 'my-iflipb-next-buffer)
  				      (eq last-command 'my-iflipb-previous-buffer))
  			    my-iflipb-ing-internal)))


(provide 'init-mine-iflipb)
