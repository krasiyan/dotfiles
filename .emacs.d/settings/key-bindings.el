(dolist (key '("\C-h" "\C-j" "\C-k" "\C-l"
               "\M-h" "\M-j" "\M-k" "\M-l"
               "\C-\M-h" "\C-\M-j" "\C-\M-k" "\C-\M-l"
               "\M-u" "\M-i" "\C-u" "\C-i"))
  (global-unset-key key))

;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; CUA mode because I'm a noob
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; M-(h-j-k-l) for a Vi like movement
(global-set-key "\M-h" 'backward-char)
(global-set-key "\M-j" 'next-line)
(global-set-key "\M-k" 'previous-line)
(global-set-key "\M-l" 'forward-char)

;; C-(h-l) backward/forward word
(global-set-key "\C-h" 'backward-word)
(global-set-key "\C-j" 'backward-paragraph)
(global-set-key "\C-k" 'forward-paragraph)
(global-set-key "\C-l" 'forward-word)

;; M-S-(h-l) home/end word
(define-key key-translation-map (kbd "C-M-h") (kbd "<home>"))
(define-key key-translation-map (kbd "C-M-l") (kbd "<end>"))

;; M-u - "backspace" like - char
(global-set-key "\M-u" 'backward-delete-char-untabify)
;; C-u - "backspace" like - word
(global-set-key "\C-u" 'backward-kill-word)

;; M-i - "delete" like - char
(global-set-key "\M-i" 'delete-forward-char)
;; C-i - "delete" like - word
(global-set-key "\C-i" 'kill-word)

;; rebind displaced movement key bindings
(global-set-key "\M-p" 'recenter)
(global-set-key "\M-v" 'downcase-word)
(global-set-key "\M-b" 'recenter)

;; Font size
(define-key global-map (kbd "C-=") 'zoom-frm-in)
(define-key global-map (kbd "C--") 'zoom-frm-out)
(define-key global-map (kbd "C-0") 'zoom-frm-unzoom)

;; Multiple cursors
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-unset-key (kbd "C-<down-mouse-1>"))
(global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)

;; C-a select all
(global-set-key "\C-a" 'mark-whole-buffer)

;; C-s save-buffer
(global-set-key "\C-s" 'save-buffer)

;; C-y redo
(require 'redo+)
(global-set-key (kbd "C-y") 'redo)

;; C-o find-file
(global-set-key "\C-o" 'find-file)

;; C-f incremental forward search
(global-set-key "\C-f" 'isearch-forward)

;; search for the selected region
(defun jrh-isearch-with-region ()
  "Use region as the isearch text."
  (when mark-active
    (let ((region (funcall region-extract-function nil)))
      (deactivate-mark)
      (isearch-push-state)
      (isearch-yank-string region))))

(add-hook 'isearch-mode-hook #'jrh-isearch-with-region)

(require 'ag)
;; (setq ag-reuse-window 't)
(setq ag-highlight-search t)
(setq wgrep-auto-save-buffer t)

;; C-S-f ag based search in the project files
(global-set-key (kbd "C-S-f") 'ag-project-files)

;; Page down for isearch-repeat-forward
(define-key isearch-mode-map (kbd "M-j") 'isearch-repeat-forward)

;; Page up for isearch-repeat-backward
(define-key isearch-mode-map (kbd "M-k") 'isearch-repeat-backward)

(global-set-key "\C-w" 'kill-this-buffer)

;; Page Up/Down for cycling buffers
(global-set-key [C-prior] 'tabbar-ruler-backward)
(global-set-key [C-next] 'tabbar-ruler-forward)

;; Alternative cycling buffers
(global-set-key (kbd "C-M-j") 'tabbar-ruler-backward)
(global-set-key (kbd "C-M-k") 'tabbar-ruler-forward)

;; C-S-(hjkl) draggging stuff
(define-key drag-stuff-mode-map (kbd "C-S-h") 'drag-stuff-left)
(define-key drag-stuff-mode-map (kbd "C-S-j") 'drag-stuff-down)
(define-key drag-stuff-mode-map (kbd "C-S-k") 'drag-stuff-up)
(define-key drag-stuff-mode-map (kbd "C-S-l") 'drag-stuff-right)

;; C-d duplicate line - http://rejeep.github.io/emacs/elisp/2010/03/11/duplicate-current-line-or-region-in-emacs.html
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))
(global-set-key (kbd "C-S-d") 'duplicate-current-line-or-region)

(global-set-key (kbd "<M-return>") 'newline)

;; Home and End - move to begging and enf of code then line
(global-set-key (kbd "<home>") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "<end>") 'mwim-end-of-code-or-line)

;; C-/ comment
(global-set-key (kbd "C-/") 'comment-dwim-2)

;; C-s-ARROWS - move around windows
(require 'windmove)

(global-set-key (kbd "C-s-<left>")  'windmove-left)
(global-set-key (kbd "C-s-<right>") 'windmove-right)
(global-set-key (kbd "C-s-<up>")    'windmove-up)
(global-set-key (kbd "C-s-<down>")  'windmove-down)

;; C-s-HJKL - alternative move around windows
(global-set-key (kbd "C-s-h")  'windmove-left)
(global-set-key (kbd "C-s-l") 'windmove-right)
(global-set-key (kbd "C-s-k")    'windmove-up)
(global-set-key (kbd "C-s-j")  'windmove-down)

;; M-s-ARROWS - resize windows
(global-set-key (kbd "M-s-<up>") 'shrink-window)
(global-set-key (kbd "M-s-<down>") 'enlarge-window)
(global-set-key (kbd "M-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-s-<right>") 'enlarge-window-horizontally)

;; M-s-HJKL - resize windows
(global-set-key (kbd "M-s-k") 'shrink-window)
(global-set-key (kbd "M-s-j") 'enlarge-window)
(global-set-key (kbd "M-s-h") 'shrink-window-horizontally)
(global-set-key (kbd "M-s-l") 'enlarge-window-horizontally)

;; jump to char
(global-set-key (kbd "M-SPC") 'avy-goto-char)

;; go to line
(global-set-key (kbd "C-;") 'goto-line)

;; C-= expand region
(require 'expand-region)
(global-set-key (kbd "C-.") 'er/expand-region)
(global-set-key (kbd "C-,") 'er/contract-region)

;; C-n new buffer
(defun create-new-buffer ()
  "Create a new buffer named *new*[num]."
  (interactive)
  (switch-to-buffer (generate-new-buffer-name "*new*")))
(global-set-key (kbd "C-x n") 'create-new-buffer)

;; C-N new emacs window
(when window-system
  (defun new-emacs-instance ()
    "Create a new instance of Emacs."
    (interactive)
    (let ((path-to-emacs
           (locate-file invocation-name
                        (list invocation-directory) exec-suffixes)))
      (call-process path-to-emacs nil 0 nil))))
(global-set-key (kbd "C-x N") 'new-emacs-instance)

;;
(global-set-key [f11] 'toggle-frame-fullscreen)

(provide 'key-bindings)
