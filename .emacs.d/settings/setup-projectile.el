(require 'projectile)

(projectile-mode +1)

(define-key projectile-mode-map (kbd "C-p") 'projectile-find-file)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq projectile-project-search-path '("~/work/"))

(provide 'setup-projectile)
