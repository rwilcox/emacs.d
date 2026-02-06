(provide 'org-extensions-mine)

(defun org/send-babel-results-to-scratch ()
  "given the selection - which is assumed to be part of an org babel results block - move it to *scratch* buffer and delete the org babel results block"
  (interactive)
  (bb/append-selection-to-scratch)
  (org-babel-previous-src-block)
  (org-babel-remove-result)
)

(defun rpw/agenda-reload-files ()
  "Revert all buffers associated with org-agenda files."
  (interactive)
  (let ((agenda-files (org-agenda-files)))
    (dolist (file agenda-files)
      (let ((buf (find-buffer-visiting file)))
        (if buf
            (with-current-buffer buf
              (revert-buffer t t)
              (message "Reverted: %s" file))
          (message "Not open: %s" file))))
    (message "Done reverting org-agenda files!")))
