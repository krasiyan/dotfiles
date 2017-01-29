(setq tabbar-ruler-global-tabbar t)

(defun tabbar-buffer-groups-function ()
      (list "All"))
(setq tabbar-buffer-groups-function 'tabbar-buffer-groups-function)

(defcustom tabbar-hide-header-button t
  "Hide header button at left-up corner.
Default is t."
  :type 'boolean
  :set (lambda (symbol value)
         (set symbol value)
         (if value
             (setq
              tabbar-scroll-left-help-function nil ;don't show help information
              tabbar-scroll-right-help-function nil
              tabbar-help-on-tab-function nil
              tabbar-home-help-function nil
              tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
              tabbar-scroll-left-button (quote (("") ""))
              tabbar-scroll-right-button (quote (("") "")))))
  :group 'tabbar)

(require 'tabbar-ruler)

(provide 'setup-tabbar)
