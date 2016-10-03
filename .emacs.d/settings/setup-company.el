(require 'company)
(require 'company-tern)

;; company everywhere!
(add-hook 'after-init-hook 'global-company-mode)

;; quickhelp tooltips
(company-quickhelp-mode 1)

;; use tern as a backend for company
(add-to-list 'company-backends 'company-tern)

;; visual improvements to the tern autocomplete list
(setq company-tern-property-marker nil)
(setq company-tooltip-align-annotations t)

;; tab key completion
(define-key company-mode-map [remap indent-for-tab-command]
  'company-indent-for-tab-command)

(setq tab-always-indent 'complete)

(defvar completion-at-point-functions-saved nil)

(defun company-indent-for-tab-command (&optional arg)
  (interactive "P")
  (let ((completion-at-point-functions-saved completion-at-point-functions)
        (completion-at-point-functions '(company-complete-common-wrapper)))
    (indent-for-tab-command arg)))

(defun company-complete-common-wrapper ()
  (let ((completion-at-point-functions completion-at-point-functions-saved))
    (company-complete-common)))

(provide 'setup-company)
