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


(defun open-file-at-line (file line)
  "Open FILE and go to LINE."
  (interactive "fFile: \nNLine: ")
  (find-file file)        ;; Open the specified file
  (goto-line line))       ;; Move to the specified line


;; bbl is meant to mirror my bb eshell alias (which just aliases find-file in eshell)
;; except this one opens file:line specifications!
(defun bbl (filepath-and-line)
  "Open the file specified in FILEPATH-AND-LINE:LINE_NUMBER and go to the specified line number.
FILEPATH-AND-LINE should be in the format 'filepath:line-number'."
  (interactive "sEnter filepath:line-number: ")
  (let* ((parts (split-string filepath-and-line ":"))  ;; Split the input string
         (file (car parts))                             ;; Get the file path
         (line (if (cadr parts)                         ;; Get the line number if it exists
                    (string-to-number (cadr parts))  ;; Convert to number
                  1)))                                ;; Default to line 1 if not specified
    (open-file-at-line file line)))                    ;; Call the previously defined function
