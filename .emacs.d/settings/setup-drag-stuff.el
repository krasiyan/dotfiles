(require 'drag-stuff)


;; Enable globally
(drag-stuff-global-mode 1)

(setq drag-stuff-modifier '(control shift))
(drag-stuff-define-keys)

(provide 'setup-drag-stuff)
