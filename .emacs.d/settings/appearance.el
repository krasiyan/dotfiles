;; Set custom font
;; (set-face-attribute 'default nil :font "Consolas for Powerline 14")
(set-face-attribute 'default nil :font "Consolas 14")

;; Don't beep!
(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.05 nil 'invert-face 'mode-line)))

;; Highlight current line
(global-hl-line-mode t)

;; Show the time in the modeline
(display-time-mode 1)

;; Show the battery percentage in the modeline
(display-battery-mode t)

;; Don't display the buffer size
(setq size-indication-mode nil)

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

;; Set the title bar to show file name if available, buffer name otherwise
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; Use bar cursors
(setq-default cursor-type 'bar)

;; Display tabs as 2 spaces
(setq tab-width 2)

;; hlinum - highligh line number
(require 'hlinum)
(hlinum-activate)
(set-face-background 'linum-highlight-face "#859900")

;; highlight tags mode
;; (require 'hl-tags-mode)
;; (hl-tags-mode 't)

; Scroll just one line when hitting bottom of window
(setq scroll-conservatively 10000)

;; scroll one line at a time (less "jumpy" than defaults)

(setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; two lines at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

;; smart modeline
(setq powerline-default-separator-dir '(right . left))
(setq sml/theme 'respectful)
(setq sml/name-width 40)
(setq sml/mode-width 'full)
(sml/setup)
(add-to-list 'sml/replacer-regexp-list '("^~/work/" ":work:") t)
(provide 'appearance)
