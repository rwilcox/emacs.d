(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "xdg-open")
     (output-html "xdg-open")))
 '(ansi-color-names-vector
   ["#fefbec" "#d73737" "#60ac39" "#ae9513" "#6684e1" "#b854d4" "#6684e1" "#6e6b5e"])
 '(auto-compile-mode-line-counter t)
 '(custom-safe-themes
   '("d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "b67b2279fa90e4098aa126d8356931c7a76921001ddff0a8d4a0541080dee5f6" "c614d2423075491e6b7f38a4b7ea1c68f31764b9b815e35c9741e9490119efc0" "1f38fb71e55e5ec5f14a39d03ca7d7a416123d3f0847745c7bade053ca58f043" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" "722e1cd0dad601ec6567c32520126e42a8031cd72e05d2221ff511b58545b108" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "99c86852decaeb0c6f51ce8bd46e4906a4f28ab4c5b201bdc3fdf85b24f88518" "c9f102cf31165896631747fd20a0ca0b9c64ecae019ce5c2786713a5b7d6315e" "350dc341799fbbb81e59d1e6fff2b2c8772d7000e352a5c070aa4317127eee94" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "2a998a3b66a0a6068bcb8b53cd3b519d230dd1527b07232e54c8b9d84061d48d" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bc4c89a7b91cfbd3e28b2a8e9e6750079a985237b960384f158515d32c7f0490" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "304c39b190267e9b863c0cf9c989da76dcfbb0649cbcb89592e7c5c08348fce9" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "a61109d38200252de49997a49d84045c726fa8d0f4dd637fce0b8affaa5c8620" default))
 '(package-selected-packages
   '(v-mode vim-empty-lines-mode bind-key company dash flycheck ivy js2-mode packed s swiper transient rust-mode laas plantuml-mode hl-todo projectile racket-mode undo-tree xterm-color xref-js2 which-key web-mode vlf use-package tabbar switch-window spaceline smex regex-tool rainbow-delimiters rainbow-blocks powershell popwin popup-edit-menu persistent-scratch no-littering neotree markdown-mode literate-calc-mode json-mode js2-refactor imenu-anywhere imake hlinum groovy-mode flycheck-pos-tip exec-path-from-shell devdocs crux counsel company-web color-theme-sanityinc-solarized beacon base16-theme autopair auto-compile async))
 '(projectile-completion-system 'ivy)
 '(projectile-mode t nil (projectile)))

 '(speedbar-supported-extension-expressions
   (quote
    (".ps1?" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".md" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(header-line ((t (:background "cornsilk" :foreground "#f2f2f2" :box (:line-width 1 :color "#2f7e9d"))))))
