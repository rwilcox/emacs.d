(provide 'wwtime-mine)

; (setq wwtime-display '("EDT" "PDT" "GMT"))
(setq wwtime-display '("EST" "PST" "GMT"))

                                        ; ^^^ ugh need to flip this every 6 months or whatever. Boo.


(defun wwtime/in-new-buffer ()
  (interactive)
  (bb/new-empty-text-buffer)
  (wwtime)
 )
