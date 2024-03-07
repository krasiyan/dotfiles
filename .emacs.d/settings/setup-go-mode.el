(require 'company)
(require 'company-go)

(add-hook 'go-mode-hook #'lsp-deferred)

;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(lsp-register-custom-settings
  '(("gopls.staticcheck" t t)))

(add-hook 'go-mode-hook  (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
  ))

(provide 'setup-go-mode)
