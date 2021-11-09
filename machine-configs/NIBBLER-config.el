(provide 'NIBBLER-config)

; compile command or other shell command nonsense uses PATH, not exec-path
; source: https://emacs.stackexchange.com/a/27336
(setenv "PATH" (concat (getenv "PATH") ";"
                       "C:\\Program Files\\apache-maven-3.8.3\\bin" ";"
                       ))
(setq eshell-path-env (concat "C:\\Program Files\\apache-maven-3.8.3\\bin;" eshell-path-env ))

(setq java-11-home "C:\\Program Files\\Java\\jdk-11.0.13\\" )
(setq java-11-binpath (concat java-11-home "bin;"))

(setq java-8-home "C:\\Program Files\\Java\\jdk1.8.0_311\\")
(setq java-8-binpath (concat java-8-home "bin;"))
