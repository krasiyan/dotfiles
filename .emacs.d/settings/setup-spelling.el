(require 'flyspell)

(setq flyspell-issue-message-flag nil)

(setq flyspell-prog-text-faces '(
                                 font-lock-comment-face
                                 font-lock-doc-face
                                 web-mode-doctype-face
                                 web-mode-comment
                                 web-mode-javascript-comment-face
                                 ))

;; disable conflicting flyspell keybindings
(eval-after-load "flyspell"
  (lambda()
    (define-key flyspell-mode-map (kbd "C-.") nil)
    (define-key flyspell-mode-map (kbd "C-,") nil)
    (define-key flyspell-mode-map (kbd "C-;") nil)
  ))

(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'web-mode-hook 'flyspell-mode)

(provide 'setup-spelling)
