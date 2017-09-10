(require 'multi-term)

(defun zsh ()
  "Start a terminal and rename buffer."
  (interactive)
  (multi-term)
  (rename-buffer "term"))

(defun term-send-tab ()
  "Send <tab> in term mode."
  (interactive)
  (term-send-raw-string "\t"))

(global-set-key (kbd "M-z") 'zsh)
(setq multi-term-program "/bin/zsh")
(setq multi-term-buffer-name "term")
(setq multi-term-scroll-show-maximum-output 1)
(setq multi-term-scroll-to-bottom-on-output nil)
(setq multi-term-switch-after-close nil)
(add-hook 'term-mode-hook (lambda ()
                            (add-to-list 'term-bind-key-alist '("<tab>" . term-send-tab))
                            (add-to-list 'term-bind-key-alist '("C-c C-j" . term-line-mode))
                            (add-to-list 'term-bind-key-alist '("C-c C-k" . term-char-mode))
                            (setq term-buffer-maximum-size 10000)
                            (global-company-mode 0)
                            (company-quickhelp-mode 0)
                            (company-mode 0)
                            (setq yas-dont-activate t)
                            (setq show-trailing-whitespace nil)
                            (linum-mode 0)
                            (setq-local global-hl-line-mode nil)))

(add-hook 'after-change-major-mode-hook
            '(lambda ()
               (if (equal major-mode 'term-mode) (hlinum-deactivate) (hlinum-activate))))

(provide 'setup-zsh)
