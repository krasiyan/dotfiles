(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/mdempsky/gocode/emacs-company"))
(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/golang.org/x/lint/misc/emacs"))

(require 'golint)
(require 'company)
(require 'company-go)

(add-hook 'go-mode-hook  (lambda ()
  (add-hook 'before-save-hook #'gofmt-before-save)
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
  ))

(provide 'setup-go-mode)
