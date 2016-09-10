;; Disabe the startup screen
(setq inhibit-startup-screen t)
;; No splash scratch message
(setq initial-scratch-message nil)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
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


;; Write auto save files to own directory
(defconst emacs-autosave-dir (format "%s%s/" user-emacs-directory "autosaves"))
(setq auto-save-file-name-transforms
   `((".*" ,emacs-autosave-dir t)))
(setq auto-save-list-file-prefix
   emacs-autosave-dir)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Name
(setq user-full-name "Krasiyan Nedelchev")
;; Email address
(setq user-mail-address "hello@krasiyan.com")

;; Always show line numbers
(global-linum-mode 1) 

;; Show line column numbers in mode line
(line-number-mode t)
(column-number-mode t)

;; No tabs! Only spaces :)
(setq-default indent-tabs-mode nil)

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(
     zoom-frm
     solarized-theme
     multiple-cursors
     neotree
     fiplr
     drag-stuff
     markdown-mode
     highlight-indent-guides
     js2-mode
     fringe-helper
     git-gutter-fringe
     ethan-wspace
     mwim
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Set up appearance
(require 'appearance)

;; Setup extensions
(require 'setup-neotree)
(require 'setup-fiplr)
(require 'setup-drag-stuff)
(require 'setup-markdown-mode)
(require 'setup-highlight-indent-guides)
(require 'setup-git-gutter-fringe)
(require 'setup-ethan-wspace)

;; Map files to modes
(require 'mode-mappings)

;; Language specific setup files
(eval-after-load 'js2-mode '(require 'setup-js2-mode))

;; Setup key bindings
(require 'key-bindings)
