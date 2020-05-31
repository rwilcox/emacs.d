;(defun run-powershell ()
;  "Run powershell"
; (interactive)
;  (async-shell-command "/usr/bin/pwsh -File -"
;               nil
;               nil))
; (add-to-list 'load-path "~/.emacs.d/powershell")

(require 'eshell)
(require 'em-smart)
(require 'package)
(require 're-builder)
(require 'eshell) ; or use with-eval-after-load

; let various packages to be stored and downloaded from .emacs.d/vendor
(add-to-list 'load-path (expand-file-name "vendor" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "functional_areas" user-emacs-directory))

(require 'soulver)
(require 'bbedit)

(package-initialize)

(add-to-list 'package-archives (cons "melpa" (concat "https" "://melpa.org/packages/")) t)

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;; (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)


(add-to-list 'package-archives (cons "melpa" (concat "https" "://melpa.org/packages/")) t)

(use-package markdown-mode)
(use-package xterm-color)
(use-package regex-tool)
(use-package rainbow-blocks)
(use-package imake)
(use-package devdocs)
(use-package color-theme-sanityinc-solarized)
(use-package base16-theme)
(use-package persistent-scratch)
(use-package literate-calc-mode)
(use-package swiper)
(use-package powershell)

;(add-to-list 'package-archives
;             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(persistent-scratch-setup-default)

(add-hook 'eshell-mode-hook
  (lambda ()
    (eshell-smart-initialize)))


(setq linum-format "%d ")

;; You can also use it with eshell (and thus get color output from system ls):



(add-hook 'eshell-before-prompt-hook
          (lambda ()
            (setq xterm-color-preserve-properties t)))

(add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
(setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))
(setenv "TERM" "xterm-256color")


(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; one - well, 3 -  line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse   
(setq scroll-step 1) ;; keyboard scroll one line at a time

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

;; ======================================================== RPW Menu ========================
;; Creating a new menu pane in the menu bar to the right of “Tools” menu
(define-key-after
  global-map
  [menu-bar mymenu]
  (cons "RPW" (make-sparse-keymap "hoot hoot"))
  'tools )

;; Creating a menu item, under the menu by the id “[menu-bar mymenu]”
(define-key
  global-map
  [menu-bar mymenu sp]  ; third identified is unique identifier for menu. RPW 05/08/2020
  '("Speedbar" . speedbar))

(define-key
  global-map
  [menu-bar mymenu im]
  '("iMake" . imake))

(define-key
  global-map
  [menu-bar mymenu sova]
  '("Soulver: Evaluate buffer, append soulver-output" . soulver/script-eval-elisp-and-append-output-variable))

(define-key
  global-map
  [menu-bar mymenu fall]
  '("Swiper: Find All" . swiper))

;; ================================================ END RPW Menu =======================
 (eval-after-load 'esh-opt
     '(progn
        (require 'em-cmpl)
        (require 'em-prompt)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#fefbec" "#d73737" "#60ac39" "#ae9513" "#6684e1" "#b854d4" "#6684e1" "#6e6b5e"])
 '(custom-enabled-themes (quote (base16-atelier-dune-light)))
 '(custom-safe-themes
   (quote
    ("d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "b67b2279fa90e4098aa126d8356931c7a76921001ddff0a8d4a0541080dee5f6" "c614d2423075491e6b7f38a4b7ea1c68f31764b9b815e35c9741e9490119efc0" "1f38fb71e55e5ec5f14a39d03ca7d7a416123d3f0847745c7bade053ca58f043" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" "722e1cd0dad601ec6567c32520126e42a8031cd72e05d2221ff511b58545b108" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "99c86852decaeb0c6f51ce8bd46e4906a4f28ab4c5b201bdc3fdf85b24f88518" "c9f102cf31165896631747fd20a0ca0b9c64ecae019ce5c2786713a5b7d6315e" "350dc341799fbbb81e59d1e6fff2b2c8772d7000e352a5c070aa4317127eee94" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "2a998a3b66a0a6068bcb8b53cd3b519d230dd1527b07232e54c8b9d84061d48d" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bc4c89a7b91cfbd3e28b2a8e9e6750079a985237b960384f158515d32c7f0490" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "304c39b190267e9b863c0cf9c989da76dcfbb0649cbcb89592e7c5c08348fce9" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "a61109d38200252de49997a49d84045c726fa8d0f4dd637fce0b8affaa5c8620" default)))
 '(ede-project-directories
   (quote
    ("/home/aias/Development/_Products/WD_Site_Related/blog/gatsby-wd-blog")))
 '(markdown-list-indent-width 2)
 '(package-selected-packages
   (quote
    (powershell swiper literate-calc-mode xterm-color use-package regex-tool rainbow-blocks markdown-mode imake devdocs color-theme-sanityinc-solarized base16-theme))))
 '(speedbar-supported-extension-expressions
   (quote
    (".ps1?" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".md" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
