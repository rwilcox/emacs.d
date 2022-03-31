(provide 'macros-mine)

(fset 'rpw/join-lines
   (kmacro-lambda-form [?\C-a down escape ?^] 0 "%d"))
(global-set-key (kbd "C-j") 'rpw/join-lines)

; from: https://emacsnotes.wordpress.com/2018/05/27/keyboard-macros-build-custom-commands-with-the-emacs-command-language/

(easy-menu-define kmacro-menu nil
 "Keyboard Macro Menu."
 '("Keyboard Macro"
 ["Universal Argument" universal-argument :help "Begin a numeric argument for the following command."]
 "--"
 ["Start Macro" kmacro-start-macro :help "Record subsequent keyboard input, defining a keyboard macro."]
 ["End Macro" kmacro-end-macro :help "Finish defining a keyboard macro."]
 ["End And Call Macro" kmacro-end-and-call-macro :help "Call last keyboard macro, ending it first if currently being defined."]
 "--"
 ["Kmacro Bind To Key" kmacro-bind-to-key :help "When not defining or executing a macro, offer to bind last macro to a key."]
 ["Name Last Macro" kmacro-name-last-macro :help "Assign a name to the last keyboard macro defined."]
 ["Insert Macro" insert-kbd-macro :help "Insert in buffer the definition of kbd macro MACRONAME, as Lisp code."]
 ))

(easy-menu-add-item menu-bar-tools-menu nil kmacro-menu "grep")
