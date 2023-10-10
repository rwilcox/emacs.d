(provide 'treesitter-mine)


(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")
     (hcl "https://github.com/MichaHoffmann/tree-sitter-hcl")
     ))

; HOW TO ADD A NEW TREE-SITTER LANGUAGE
;   #1: find a repo and add it to this list
;   #2: M-x treesit-install-language-grammer <-- that treesitter mode should show up in that list (?? after restart of Emacs?)
;   #3: It's under LANGUAGE-ts-mode (the TS is for TreeSitter, not Teh Suck)
;   #4: If you like it, probably want to remap it so things don't know the difference
; FROM: https://www.masteringemacs.org/article/how-to-get-started-tree-sitter
;
; But even if you do find a random treesitter parser, you need a Emacs Major Mode for it
; see https://emacs.stackexchange.com/questions/78831/how-enable-tree-sitter-modes-ts-mode-that-arent-built-in

(setq major-mode-remap-alist
 '(
   (typescript-mode . typescript-ts-mode)
   (json-mode . json-ts-mode)
   (css-mode . css-ts-mode)
   (python-mode . python-ts-mode)))
