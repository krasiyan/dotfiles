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
                            (setq-local global-hl-line-mode nil)))

(add-hook 'after-change-major-mode-hook
            '(lambda ()
               (if (equal major-mode 'term-mode) (hlinum-deactivate) (hlinum-activate))))

(provide 'setup-zsh)
