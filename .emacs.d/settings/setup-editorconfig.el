(require 'editorconfig)
(editorconfig-mode 1)

(add-hook 'editorconfig-custom-hooks (lambda (hash)
                                       (setq require-final-newline nil)
                                       (setq mode-require-final-newline nil)))

(provide 'setup-editorconfig)
