;; Mostly stolen from https://github.com/magnars/.emacs.d Kudos!
(require 'flycheck)
(require 'flycheck-pos-tip)

(defun magnars/adjust-flycheck-automatic-syntax-eagerness ()
  "Adjust how often we check for errors based on if there are any.

This lets us fix any errors as quickly as possible, but in a
clean buffer we're an order of magnitude laxer about checking."
  (setq flycheck-idle-change-delay
        (if flycheck-current-errors 0.1 30.0)))

;; Each buffer gets its own idle-change-delay because of the
;; buffer-sensitive adjustment above.
(make-variable-buffer-local 'flycheck-idle-change-delay)

(add-hook 'flycheck-after-syntax-check-hook
          'magnars/adjust-flycheck-automatic-syntax-eagerness)

;; Remove newline checks, since they would trigger an immediate check
;; when we want the idle-change-delay to be in effect while editing.
(setq flycheck-check-syntax-automatically '(save
                                            idle-change
                                            mode-enabled))

(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;; disable the jshint default flycheck checker
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; legacy: use the javascript-eslint flycheck checker with the js2-mode
;; (flycheck-add-mode 'javascript-eslint 'js2-mode)

(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'python-pylint 'python-mode)

(provide 'setup-flycheck)
