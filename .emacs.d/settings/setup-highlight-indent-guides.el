(require 'highlight-indent-guides)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?\|)

(provide 'setup-highlight-indent-guides)
