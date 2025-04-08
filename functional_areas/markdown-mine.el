(provide 'markdown-mine)

(add-hook 'markdown-mode-hook 'imenu-add-menubar-index)
(setq imenu-auto-rescan t)

(defun rpw/presentation-next ()
  "Let me quickly move from one focused section to another.

  If I'm focused on a section of document, I may want to
   easily move to a sibling of that document quickly.

   Because sometimes I use outlines in place of slideshows"

  (interactive)
  (widen)
  (markdown-outline-next-same-level)
  (markdown-narrow-to-subtree)
)

(defun rpw/markdown-move-completed-todos-to-bottom ()
  "Move completed Markdown TODO items to the bottom of the buffer."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((completed-todos nil))
      (while (re-search-forward "^\s*-\s*\\[x\\].*$" nil t)
        (push (buffer-substring (match-beginning 0) (match-end 0)) completed-todos)
        (delete-region (match-beginning 0) (match-end 0)))
      (goto-char (point-max))
      (while completed-todos
        (insert (pop completed-todos) "\n")))))
