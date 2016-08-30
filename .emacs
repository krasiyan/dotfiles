(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; Make shifted direction keys work on the Linux console or in an xterm
(when (member (getenv "TERM") '("linux" "xterm" "xterm-256color"))
 (dolist (prefix '("\eO" "\eO1;" "\e[1;"))
   (dolist (m '(("2" . "S-") ("3" . "M-") ("4" . "S-M-") ("5" . "C-")
                ("6" . "S-C-") ("7" . "C-M-") ("8" . "S-C-M-")))
     (dolist (k '(("A" . "<up>") ("B" . "<down>") ("C" . "<right>")
                  ("D" . "<left>") ("H" . "<home>") ("F" . "<end>")))
       (define-key function-key-map
                   (concat prefix (car m) (car k))
                   (read-kbd-macro (concat (cdr m) (cdr k))))))))
