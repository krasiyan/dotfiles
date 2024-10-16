(require 'company)
(require 'add-python-venv-path)

;; (add-hook 'go-mode-hook #'lsp-deferred)

(add-hook 'python-mode-hook  #'(lambda ()
  (add-python-venv-path)
  (setq lsp-pylsp-plugins-ruff-enabled t)
  (setq lsp-pylsp-plugins-mypy-enabled t)
  (setq lsp-pylsp-plugins-mypy-live-mode t)
  (setq lsp-pylsp-plugins-mypy-report-progress t)
  (lsp-deferred)
  (flycheck-mode 1)
  (company-mode)
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t)
  ))

(provide 'setup-python-mode)
