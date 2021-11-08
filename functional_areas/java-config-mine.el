(provide 'java-config-mine)

; These functions work on a buffer(?) window(?), (or at least they are not always applied to previously created frames???
; so you'll need to run these potentially
; with checking mvn -version (which will print out JAVA_HOME setting) or java -version
; either call these via M-: or in eshell or by putting them on a menu
;
; These are also non-interactive, which may or may not be what you want

(defun jdk-11-development()
  "Setup our Java 11 paths and env variables correctly"
  (interactive)

  (setenv "JAVA_HOME" java-11-home)
  (setenv "PATH" (concat java-11-binpath (getenv "PATH") ) )
  (setq eshell-path-env (concat java-11-binpath eshell-path-env) )
)


(defun jdk-8-development()
  "Set up our Java 8 paths and env variables correctly"
  (interactive)
  (setenv "JAVA_HOME" java-8-home)
  (setenv "PATH" (concat  java-8-binpath (getenv "PATH") ) )
  (setq eshell-path-env (concat java-8-binpath eshell-path-env) )
)
