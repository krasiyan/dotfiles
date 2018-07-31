
;;;###autoload
(defcustom add-python-venv-path-debug nil
  "Enable verbose output when non nil."
  :type 'boolean)

;;;###autoload
(defcustom add-python-venv-max-depth 20
  "Max depth to look for ENV."
  :type 'integer)

;;;###autoload
(defun add-python-venv-path ()
  "Search the current buffer's parent directories for `ENV/bin`.
Traverse the directory structure up, until reaching the user's home directory,
 or hitting add-python-venv-max-depth.
Any path found is added to the `exec-path'."
  (interactive)
  (let* ((default-dir (expand-file-name default-directory))
         (file (or (buffer-file-name) default-dir))
         (home (expand-file-name "~"))
         (iterations add-python-venv-max-depth)
         (root (directory-file-name (or (and (buffer-file-name) (file-name-directory (buffer-file-name))) default-dir)))
         (roots '()))
    (while (and root (> iterations 0))
      (setq iterations (1- iterations))
      (let ((bindir (expand-file-name "ENV/bin/" root)))
        (when (file-directory-p bindir)
          (add-to-list 'roots bindir)))
      (if (string= root home)
          (setq root nil)
        (setq root (directory-file-name (file-name-directory root)))))
    (if roots
        (progn
          (make-local-variable 'exec-path)
          (while roots
            (add-to-list 'exec-path (car roots))
            (when add-python-venv-path-debug
              (message (concat "added " (car roots) " to exec-path")))
            (setq roots (cdr roots))))
      (when add-python-venv-path-debug
        (message (concat "ENV/bin not found for " file))))))

(provide 'add-python-venv-path)

;;; add-python-venv-path.el ends here
