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
(setq ag-reuse-window 't)
(setq ag-highlight-search t)

;; C-S-f ag based search in the project files
(global-set-key (kbd "C-S-f") 'ag-project-files)

;; Page down for isearch-repeat-forward
(define-key isearch-mode-map [next] 'isearch-repeat-forward)

;; Page up for isearch-repeat-backward
(define-key isearch-mode-map [prior] 'isearch-repeat-backward)

;; C-w kill-this-buffer
;; (defun ask-before-killing-buffer ()
;;   (let ((buffer (current-buffer)))
;;     (cond
;;      ((and buffer-file-name (buffer-modified-p))
;;       ;; If there's a file associated with the buffer,
;;       ;; make sure it's saved
;;       (y-or-n-p (format "Buffer %s modified; kill anyway? "
;;                     (buffer-name))))
;;      ((get-buffer-process buffer)
;;       ;; If there's a process associated with the buffer,
;;       ;; make sure it's dead
;;       (y-or-n-p (format "Process %s active; kill anyway? "
;;                     (process-name (get-buffer-process buffer)))))
;;      (t t))))
;; (add-to-list 'kill-buffer-query-functions
;;              'ask-before-killing-buffer)
(global-set-key "\C-w" 'kill-this-buffer)

;; Page Up/Down for cycling buffers
(global-set-key [C-prior] 'tabbar-ruler-backward)
(global-set-key [C-next] 'tabbar-ruler-forward)

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

;; Home and End - move to begging and enf of code then line
(global-set-key (kbd "<home>") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "<end>") 'mwim-end-of-code-or-line)

;; C-/ comment
(global-set-key (kbd "C-/") 'comment-dwim-2)

;; M-ARROWS - move around windows
(require 'windmove)
(windmove-default-keybindings 'super)

;; C-ARROWS - resize windows
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;; jump to char
(global-set-key (kbd "C-j") 'avy-goto-char)

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
(global-set-key (kbd "C-n") 'create-new-buffer)

;; C-N new emacs window
(when window-system
  (defun new-emacs-instance ()
    "Create a new instance of Emacs."
    (interactive)
    (let ((path-to-emacs
           (locate-file invocation-name
                        (list invocation-directory) exec-suffixes)))
      (call-process path-to-emacs nil 0 nil))))
(global-set-key (kbd "C-S-N") 'new-emacs-instance)

;;
(global-set-key [f11] 'toggle-frame-fullscreen)

(provide 'key-bindings)
