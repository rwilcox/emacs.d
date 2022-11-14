(provide 'window-extensions)


;; lets me do C-x o to go to the "next" window in the (created by sorted?) list
;; and C-x SHIFT o to go to the "previous" window

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))

;; from https://www.masteringemacs.org/article/demystifying-emacs-window-manager
(defun mp-root-split-below (arg)
  "Split window below from the parent or from root with ARG."
  (interactive "P")
  (split-window (if arg (frame-root-window)
                  (window-parent (selected-window)))
                nil 'below nil))

(defun mp-root-split-right (arg)
  "Split window below from the parent or from root with ARG."
  (interactive "P")
  (split-window (if arg (frame-root-window)
                  (window-parent (selected-window)))
                nil 'right nil))
