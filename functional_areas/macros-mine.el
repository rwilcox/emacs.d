(provide 'macros-mine)

(fset 'rpw/join-lines
   (kmacro-lambda-form [?\C-a down escape ?^] 0 "%d"))
(global-set-key (kbd "C-j") 'rpw/join-lines)
