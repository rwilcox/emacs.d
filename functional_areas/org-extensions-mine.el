(provide 'org-extensions-mine)

(defun org/send-babel-results-to-scratch ()
  "given the selection - which is assumed to be part of an org babel results block - move it to *scratch* buffer and delete the org babel results block"
  (interactive)
  (bb/append-selection-to-scratch)
  (org-babel-previous-src-block)
  (org-babel-remove-result)
)
