(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (flycheck-add-next-checker 'typescript-tide '(error . javascript-eslint))
  (flycheck-add-next-checker 'tsx-tide '(error . javascript-eslint))
  (flycheck-add-mode 'typescript-tide 'web-mode)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)
  )

(add-hook 'web-mode-hook
          (lambda ()
            (when (member (file-name-extension buffer-file-name)  '("ts" "tsx"))
              (setup-tide-mode))))

(provide 'setup-tide)
