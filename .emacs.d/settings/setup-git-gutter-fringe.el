(require 'git-gutter-fringe)
(global-git-gutter-mode +1)

(custom-set-variables
 '(git-gutter:update-interval 2)) ;; auto update

(set-face-foreground 'git-gutter-fr:modified "yellow")
(set-face-foreground 'git-gutter-fr:added    "blue")
(set-face-foreground 'git-gutter-fr:deleted  "red")

(provide 'setup-git-gutter-fringe)
