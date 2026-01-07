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
