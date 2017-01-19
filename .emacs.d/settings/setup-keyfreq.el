(require 'keyfreq)

(setq keyfreq-excluded-commands
      '(self-insert-command
        abort-recursive-edit))

(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(provide 'setup-keyfreq)
