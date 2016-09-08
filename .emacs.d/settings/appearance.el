;; Highlight current line
(global-hl-line-mode 1)

;; Show the time
(display-time)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; trust themes
(setq custom-safe-themes t)

;; solarized-dark
(load-theme 'solarized-dark t)

;; turn on bracket match highlight
(show-paren-mode 1)

;; Make zooming affect frame instead of buffers
(require 'zoom-frm)

(provide 'appearance)
