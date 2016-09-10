;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; CUA mode because I'm a noob
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
                    (concat prefix (cAr m) (car k))
                    (read-kbd-macro ((cdr m) (cdr k))))))))

;; Font size
(define-key global-map (kbd "C-+") 'zoom-frm-in)
(define-key global-map (kbd "C--") 'zoom-frm-out)

;; Multiple cursors
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-unset-key (kbd "C-<down-mouse-1>"))
(global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)

;; C-a select all
(global-set-key "\C-a" 'mark-whole-buffer)

;; C-s save-buffer
(global-set-key "\C-s" 'save-buffer)

;; C-o find-file
(global-set-key "\C-o" 'find-file)

;; C-f incremental forward search
(global-set-key "\C-f" 'isearch-forward)

;; Page down for isearch-repeat-forward
(define-key isearch-mode-map [next] 'isearch-repeat-forward)

;; Page up for isearch-repeat-backward
(define-key isearch-mode-map [prior] 'isearch-repeat-backward)

;; C-w kill-this-buffer
(global-set-key "\C-w" 'kill-this-buffer)

;; Page Up/Down for cycling buffers
(global-set-key [C-prior] 'previous-buffer)
(global-set-key [C-next] 'next-buffer)

;; C-d duplicate line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-S-d") 'duplicate-line)

;; Home and End - move to begging and enf of code then line
(global-set-key (kbd "<home>") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "<end>") 'mwim-end-of-code-or-line)

;; C-/ comment
(global-set-key (kbd "C-/") 'comment-dwim-2)


(provide 'key-bindings)
