(provide 'editing-extensions)

(defun rpw/really-i-want-to-use-a-tab-key-here ()
  (interactive)
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)

  (setq indent-tabs-mode t)
                                        ; https://dougie.io/emacs/indentation/#functions-for-enablingdisabling-tabs

)
