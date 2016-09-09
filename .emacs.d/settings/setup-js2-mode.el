;;; setup-js2-mode.el
(require 'js2-mode)

(setq-default
  js-indent-level 2
  js2-basic-offset 2
  ;; Supress js2 mode errors
  js2-mode-show-parse-errors nil
  js2-mode-show-strict-warnings)

;; (setq-default js2-allow-rhino-new-expr-initializer nil)
;; (setq-default js2-auto-indent-p nil)
;; (setq-default js2-enter-indents-newline nil)
;; (setq-default js2-global-externs '("module" "require" "expect" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
;; (setq-default js2-idle-timer-delay 0.1)
;; (setq-default js2-indent-on-enter-key nil)
;; (setq-default js2-mirror-mode nil)
;; (setq-default js2-strict-inconsistent-return-warning nil)
;; (setq-default js2-auto-indent-p t)
;; (setq-default js2-include-rhino-externs nil)
;; (setq-default js2-include-gears-externs nil)
;; (setq-default js2-concat-multiline-strings 'eol)
;; (setq-default js2-rebind-eol-bol-keys nil)

;;(require 'js2-imenu-extras)
;;(js2-imenu-extras-setup)


(provide 'setup-js2-mode)