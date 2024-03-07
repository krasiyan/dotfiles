(setq lsp-keymap-prefix "s-l")
;; (setq lsp-auto-configure nil)
(setq lsp-headerline-breadcrumb-enable nil)

(add-to-list 'load-path (expand-file-name "lib/lsp-mode" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lib/lsp-mode/clients" user-emacs-directory))

(require 'lsp-mode)

(provide 'setup-lsp-mode)
