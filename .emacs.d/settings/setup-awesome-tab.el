(require 'awesome-tab)

(set-face-attribute
  'awesome-tab-selected nil
  :foreground "#839496"
  :overline "#002b36")

(set-face-attribute
  'awesome-tab-unselected nil
  :foreground "#002b36"
  :background "#839496"
  :overline "#839496")

(set-face-attribute
  'awesome-tab-default nil
  :background "#002b36")

(set-face-attribute 'header-line nil :height 100)

(setq awesome-tab-background-color "#002b36")
(setq awesome-tab-style "slant")
;; (setq awesome-tab-height 20)

(awesome-tab-mode t)

(defun awesome-tab-changed (tab)
  "Indicate unsaved changes in the tab names"
  (if (buffer-modified-p  (car tab))
      "•"
    ""))

(defun awesome-tab-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  ;; Init tab style.
  (when (or (not awesome-tab-style-left)
            (not awesome-tab-style-right))
    (awesome-tab-select-separator-style awesome-tab-style))
  ;; Render tab.
  (awesome-tab-render-separator
   (list awesome-tab-style-left
         (format " %s%s "
                 (let ((bufname (awesome-tab-buffer-name (car tab))))
                   (if (> awesome-tab-label-fixed-length 0)
                       (awesome-tab-truncate-string  awesome-tab-label-fixed-length bufname)
                     bufname))
                 (awesome-tab-changed tab))
         awesome-tab-style-right)))

(provide 'setup-awesome-tab)
