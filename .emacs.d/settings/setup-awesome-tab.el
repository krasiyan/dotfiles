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

(provide 'setup-awesome-tab)
