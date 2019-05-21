(require 'ido)
(require 'flx-ido)

(ido-mode t)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
(setq ido-enable-flex-matching t)
(setq flx-ido-use-faces nil)

(provide 'setup-ido)
