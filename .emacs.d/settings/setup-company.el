(require 'company)
(require 'company-statistics)
;; (require 'company-tern)

;; company everywhere!
(add-hook 'after-init-hook 'global-company-mode)

;; auto-ranking of the company completion suggestions
(add-hook 'after-init-hook 'company-statistics-mode)

;; quickhelp tooltips
(company-quickhelp-mode 1)

;; disable tern .tern-port files
(setq tern-command '("tern" "--no-port-file"))

;; run tern-mode/company-tern for all *.js files
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "js" (file-name-extension buffer-file-name))
              ;; (tern-mode 1)
              ;; company-tern
              ;; (add-to-list 'company-backends '(company-tern :separate company-yasnippet))
              )))

;; no delay
(setq company-idle-delay 0)

;; visual improvements to the tern autocomplete list
(setq company-tooltip-align-annotations t)

(add-to-list 'company-backends '(company-yasnippet))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(global-set-key [tab] 'tab-indent-or-complete)

(provide 'setup-company)
