;; adding stuff to run command after hook and to remove them
(setq my-command-buffer-hooks (make-hash-table))

(defun my-command-buffer-kill-hook ()
  "Remove a key from <command-buffer-hooks> if it exists"
  (remhash (buffer-file-name) my-command-buffer-hooks)
)

(defun my-command-buffer-run-hook ()
  "Run a command if it exists in the hook"
  (let ((hook (gethash (buffer-file-name) my-command-buffer-hooks)))
    (when (not (eq hook nil))
        (shell-command hook)
    )
  )
)

;; add hooks
(add-hook 'kill-buffer-hook 'my-command-buffer-kill-hook)
(add-hook 'after-save-hook 'my-command-buffer-run-hook)


(defun my-command-on-save-buffer (c)
  "Run a command <c> every time the buffer is saved "
  (interactive "sShell command: ")
  (puthash (buffer-file-name) c my-command-buffer-hooks)
)
