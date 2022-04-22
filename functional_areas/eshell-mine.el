(provide 'eshell-mine)

(defun eshell-new()
  (interactive)
  (eshell 'N)
  )


;; make eshell a better place for long running processes that spew a lot of command line output (ie development servers...)
(setq eshell-buffer-maximum-lines 12000)
(defun eos/truncate-eshell-buffers ()
  "Truncates all eshell buffers"
  (interactive)
  (save-current-buffer
    (dolist (buffer (buffer-list t))
      (set-buffer buffer)
      (when (eq major-mode 'eshell-mode)
        (eshell-truncate-buffer)))))

;; After being idle for 5 seconds, truncate all the eshell-buffers if
;; needed. If this needs to be canceled, you can run `(cancel-timer
;; eos/eshell-truncate-timer)'
(setq eos/eshell-truncate-timer
      (run-with-idle-timer 5 t #'eos/truncate-eshell-buffers))
