;; JS2 mode
;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.ts$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))
;; (add-to-list 'auto-mode-alist '("\\.jshintrc$" . javascript-mode))

;; Markdown
(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;; XML
(autoload 'nxml-mode "nxml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode))


;; Web mode
(add-to-list 'auto-mode-alist '("\\.tag\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.htm\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . web-mode))

;; Less css mode
(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))

;; Restclient
(add-to-list 'auto-mode-alist '("\\.restclient$" . restclient-mode))

(provide 'mode-mappings)
