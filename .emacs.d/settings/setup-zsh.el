(require 'multi-term)

(defun zsh ()
  "Start a terminal and rename buffer."
  (interactive)
  (multi-term)
  (rename-buffer "term")
  )


(global-set-key (kbd "M-z") 'zsh)
(setq multi-term-program "/bin/zsh")
(setq multi-term-buffer-name "term")
(setq multi-term-scroll-show-maximum-output 1)
(setq multi-term-scroll-to-bottom-on-output nil)
(setq multi-term-switch-after-close nil)

(add-hook 'term-mode-hook (lambda ()
                            (setq show-trailing-whitespace nil)
                            (linum-mode 0)
                            (highlight-indent-guides-mode 0)
                            (hlinum-deactivate)
                            (global-hl-line-mode 0)))

(provide 'setup-zsh)
