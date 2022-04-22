(provide 'plantuml-mine)

 (setq plantuml-jar-path "~/Applications/plantuml.jar")
 (setq plantuml-default-exec-mode 'jar)

(defun plantuml-setup-mine ()
  (local-set-key (kbd "C-c r p") 'plantuml-preview)
 )

(add-hook 'plantuml-mode-hook 'plantuml-setup-mine)
