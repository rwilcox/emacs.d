(provide 'window-extensions)


;; lets me do C-x o to go to the "next" window in the (created by sorted?) list
;; and C-x SHIFT o to go to the "previous" window

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))
