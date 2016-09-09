;; Disabe the startup screen
(setq inhibit-startup-screen t)
;; No splash scratch message
(setq initial-scratch-message nil)

;; Turn off mouse interface early in startup to avoid momentary display
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Start maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Name
(setq user-full-name "Krasiyan Nedelchev")
;; Email address
(setq user-mail-address "hello@krasiyan.com")

;; Always show line numbers
(global-linum-mode 1) 

;; Show line column numbers in mode line
(line-number-mode t)
(column-number-mode t)

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(
     magit
     zoom-frm
     solarized-theme
     multiple-cursors
     neotree
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Setup extensions
(require 'setup-neotree)

;; Setup key bindings
(require 'key-bindings)

;; Set up appearance
(require 'appearance)
