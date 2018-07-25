;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq gc-cons-threshold--orig gc-cons-threshold)
(setq gc-cons-threshold (* 100 1024 1024)) ; 100 MB before garbage collection

;; Disabe the startup screen
(setq inhibit-startup-screen t)
;; No splash scratch message
(setq initial-scratch-message nil)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

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

;; Answering only 'y' or 'n' on prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Disable word wrap
(setq-default truncate-lines t)

;; Enable upcase/downcase region
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Auto close pair brackets, etc. Horay for emacs 24!
(electric-pair-mode 1)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(
     zoom-frm                           ; zoom
     solarized-theme                    ; color theme
     multiple-cursors                   ; multiple cursors
     neotree                            ; file tree
     fiplr                              ; fuzzy find up to the nearest .git folder
     drag-stuff                         ; dragging lines/regions
     markdown-mode                      ; .md file editing and preview
     highlight-indent-guides            ; indentation guides
     fringe-helper                      ; neede for git gutter
     git-gutter-fringe                  ; git gutter
     ethan-wspace                       ; auto fix trailing whitespaces
     mwim                               ; home/end start/end of code then line
     comment-dwim-2                     ; better comments
     tabbar                             ; tabs
     tabbar-ruler                       ; tabs
     hlinum                             ; highligh current line number
     avy                                ; goto char
     expand-region                      ; expand region
     flycheck                           ; syntax checking
     flycheck-pos-tip                   ; flycheck popup under mark
     ag                                 ; multi file search
     multi-term                         ; terminal emulator
     company                            ; auto completion
     company-quickhelp                  ; help popups for autocompletions
     pos-tip                            ; neede by company-quickhelp
     company-tern                       ; tern backed for company-mode
     company-statistics                 ; auto completion candidates auto-ranking
     yasnippet                          ; snippets
     smart-mode-line                    ; smart-mode-line
     smex                               ; M-x extension
     ido-grid-mode                      ; grid mode for smex
     recentf                            ; recently opened files
     ido                                ; ido
     flx-ido                            ; ido fuzzy matching
     ido-vertical-mode                  ; ido vertical mode
     keyfreq                            ; shortcut frequency tracker
     wgrep-ag                           ; global replace in the ag search results
     magit                              ; git
     web-mode                           ; web mode
     less-css-mode                      ; less css mode
     restclient                         ; http REST client
     add-node-modules-path              ; add the closest node-modules path to exec-path
     exec-path-from-shell               ; include the env variables from to user shell in Emacs
     editorconfig                       ; read .editorconfig files to automatically adjust the codestlye
     yaml-mode                          ; yaml editing mode
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Set up appearance
(require 'appearance)

;; Setup extensions
(require 'setup-neotree)
(require 'setup-fiplr)
(require 'setup-drag-stuff)
(require 'setup-markdown-mode)

(if (daemonp)
  (add-hook 'after-make-frame-functions
    (lambda (&optional frame)
      (message ">> Daemon mode")
      (require 'setup-highlight-indent-guides)
      (require 'setup-tabbar)))
  (progn
    (message ">> Non daemon mode")
    (require 'setup-highlight-indent-guides)
    (require 'setup-tabbar)))

(require 'setup-git-gutter-fringe)
(require 'setup-ethan-wspace)
(require 'setup-editorconfig)
(require 'setup-flycheck)
(require 'setup-zsh)
(require 'setup-company)
(require 'setup-yasnippet)
(require 'setup-smex)
(require 'setup-recentf)
(eval-after-load 'ido '(require 'setup-ido))
(require 'setup-keyfreq)
(eval-after-load 'magit '(require 'setup-magit))

;; Language specific setup files
(eval-after-load 'web-mode '(require 'setup-web-mode))
(eval-after-load 'less-css-mode '(require 'setup-less-css-mode))

;; Map files to modes
(require 'mode-mappings)

;; Setup key bindings
(require 'key-bindings)

;; Default directory
(setq default-directory "~/work/")

;; Default web browser
(setq browse-url-browser-function 'browse-url-chromium)
