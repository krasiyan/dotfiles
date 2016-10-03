;; JavaScript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . javascript-mode))

;; Markdown
(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;; XML
(autoload 'nxml-mode "nxml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode))

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags
  '((js-mode  "<script[^>]*>" "</script>")
    (css-mode "<style[^>]*>" "</style>")))
(setq mweb-filename-extensions '("htm" "html" "tag" "ejs"))
(multi-web-global-mode 1)

(provide 'mode-mappings)
