(provide 'graphviz-mine)

(defun graphviz-setup-mine ()
  (local-set-key (kbd "C-c r p") 'graphviz-dot-preview)
 )

(add-hook 'graphviz-dot-mode-hook 'graphviz-setup-mine)
