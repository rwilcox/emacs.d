(provide 'home-lan-config)


(setq java-11-home    "/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home")
(setq java-11-binpath (concat "/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/bin/:" eshell-path-env) )

(setq java-8-home     "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home")
(setq java-8-binpath  (concat "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin:" eshell-path-env))

(setq lsp-clients-kotlin-server-executable "/Users/aias/bin/install/server/bin/kotlin-language-server")

(setq rg-executable "/opt/local/bin/rg")
