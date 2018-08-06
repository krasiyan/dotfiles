(require 'add-python-venv-path)

(add-hook 'python-mode-hook  #'(lambda ()
  (add-python-venv-path)
  (flycheck-mode 1)))

(provide 'setup-python-mode)
