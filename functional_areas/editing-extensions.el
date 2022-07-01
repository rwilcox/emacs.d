(provide 'editing-extensions)

(defun rpw/really-i-want-to-use-a-tab-key-here ()
  (interactive)
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)

  (setq indent-tabs-mode t)
                                        ; https://dougie.io/emacs/indentation/#functions-for-enablingdisabling-tabs
  )

(defun shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right-region ()  ; seriously, don't run this on not-a-region
  (interactive)
  (shift-region 2))

(defun shift-left-region ()
  (interactive)
  (shift-region -2))

(global-set-key (kbd "C-c r ~") 'string-inflection-toggle)  ; ~ maps back to Vim functionality
