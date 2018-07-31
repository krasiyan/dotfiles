(require 'fiplr)

(setq fiplr-root-markers '(".git"))
(global-set-key (kbd "C-p") 'fiplr-find-file)
(setq fiplr-ignored-globs '((directories (".git" "node_modules" "build" "public" "__pycache__" "ENV"))
                        (files ("*.jpg" "*.png" "*.zip" "*~"))))

(provide 'setup-fiplr)
