(require 'recentf)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; save the list of files every 5 minutes
(run-at-time nil (* 5 60) 'recentf-save-list)

(provide 'setup-recentf)
