(require 'web-mode)

(add-hook 'web-mode-hook  #'(lambda ()
  (setq web-mode-markup-indent-offset 2)
  (flycheck-mode 1)
  (yas-activate-extra-mode 'html-mode)
  (yas-activate-extra-mode 'js2-mode)))

(setq
  web-mode-code-indent-offset 2
  web-mode-enable-auto-quoting nil
  web-mode-markup-indent-offset 2
  web-mode-css-indent-offset 2
  web-mode-code-indent-offset 2
  web-mode-attr-indent-offset 2
  web-mode-script-padding 2
  web-mode-enable-current-element-highlight t
  web-mode-enable-current-column-highlight t)
(add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))

(provide 'setup-web-mode)
