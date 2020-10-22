(require 'prettier-js)


(eval-after-load 'web-mode
  '(progn
     (add-hook 'web-mode-hook #'prettier-js-mode)))


(provide 'setup-prettier)
