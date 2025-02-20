(provide 'eglot-mine)

(defun rpw/eglot-status-str ()
 (if (and (bound-and-true-p eglot--managed-mode)
           (eglot-managed-p))
      " Eglot " ;; You can customize the indicator text
     " Not Eglot ")) ;; Customize the inactive text


;; Function to return an Eglot status string
(defun rpw/eglot-status ()
  "Return non-nil if Eglot is active in the current buffer."
  (interactive)
  (message (rpw/eglot-status-str)))
