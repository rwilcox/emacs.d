(provide 'org-agendas-mine)

(defun rpw/agenda-this-month-undone ()
  (interactive)
  (require 'org-ql)

  ;; Get the current year and month for the default value
  (let* ((current-time (current-time))
         (year (format-time-string "%Y" current-time))
         (month (format-time-string "%m" current-time))
         (default-value (format "%s_%s" year month))
         ;; Prompt the user for the tag input
         (tag-input (read-string "Please enter a tag (default: YYYY_MM): " default-value)))

    (org-ql-search
      (org-agenda-files)
      (list 'and
            '(not (todo "DONE"))
            (list 'tags tag-input)
            '(level 3))
      :sort nil
      :super-groups '((:auto-parent t)))))

(defun rpw/agenda-this-month-all ()
 (interactive)
 (require 'org-ql)

  ;; Get the current year and month for the default value
  (let* ((current-time (current-time))
         (year (format-time-string "%Y" current-time))
         (month (format-time-string "%m" current-time))
         (default-value (format "%s_%s" year month))
         ;; Prompt the user for the tag input
         (tag-input (read-string "Please enter a tag (default: YYYY_MM): " default-value)))

    (org-ql-search
      (org-agenda-files)
      (list 'and
            (list 'tags tag-input)
            '(level 3))
      :sort nil
      :super-groups '((:auto-parent t)))))

; I want org agenda to only show START times, not end times
(add-hook 'org-agenda-finalize-hook
          (lambda ()
            (save-excursion
              (goto-char (point-min))
              (while (re-search-forward "\\([0-9]\\{2\\}:[0-9]\\{2\\}\\)-[0-9]\\{2\\}:[0-9]\\{2\\}" nil t)
                (replace-match "\\1" nil nil)))))

; and done todo items only show that they were completed, not when
(add-hook 'org-agenda-finalize-hook
          (lambda ()
            (save-excursion
              (goto-char (point-min))
              ;; Remove time and "Closed:" label from closed items
              (while (re-search-forward "^\\s-*[0-9]\\{2\\}:[0-9]\\{2\\}\\s-*┄+\\s-*Closed:\\s-+" nil t)
                (replace-match "  ")))))
