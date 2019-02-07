(require 'awesome-tab)
(awesome-tab-mode t)

;; awesome-tab-background-color
;; awesome-tab-selected
;; awesome-tab-unselected


(set-face-attribute
  'awesome-tab-default nil
  :height 1.1)

(set-face-attribute
  'awesome-tab-selected nil
  :foreground "#839496"
  :overline "#839496")

(set-face-attribute
  'awesome-tab-unselected nil
  :foreground "#657b83"
  :overline "#657b83")


(defun awesome-tab-changed (tab)
  "..."
  (if (buffer-modified-p  (car tab))
      "•"
    ""))

(defun awesome-tab-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if awesome-tab--buffer-show-groups
                    (format " [%s]%s" (awesome-tab-tab-tabset tab) (awesome-tab-changed tab))
                  (format " %s%s" (awesome-tab-tab-value tab) (awesome-tab-changed tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if awesome-tab-auto-scroll-flag
        label
      (awesome-tab-shorten
       label (max 1 (/ (window-width)
                       (length (awesome-tab-view
                                (awesome-tab-current-tabset)))))))))

(provide 'setup-awesome-tab)
