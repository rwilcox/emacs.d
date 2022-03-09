(provide 'virotutis-lan-config)

(provide 'home-lan-config)


(setq java-11-home    "/Library/Java/JavaVirtualMachines/openjdk11-zulu/Contents/Home")
(setq java-11-binpath (concat "/Library/Java/JavaVirtualMachines/openjdk11-zulu/Contents/Home/bin/:" eshell-path-env) )

(setq java-8-home     "/Library/Java/JavaVirtualMachines/openjdk8-zulu/Contents/Home")
(setq java-8-binpath  (concat "/Library/Java/JavaVirtualMachines/openjdk8-zulu/Contents/Home/bin: eshell-path-env"))


(setq lsp-clients-kotlin-server-executable "/Users/rwilcox/bin/install/server/bin/kotlin-language-server")
