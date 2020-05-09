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

(package-initialize)

(add-to-list 'package-archives (cons "melpa" (concat "https" "://melpa.org/packages/")) t)

;(add-to-list 'package-archives
;             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


(add-hook 'eshell-mode-hook
  (lambda ()
    (eshell-smart-initialize)))


(setq linum-format "%d ")

;; You can also use it with eshell (and thus get color output from system ls):

(require 'eshell) ; or use with-eval-after-load

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

;; ================================================ END RPW Menu =======================
 (eval-after-load 'esh-opt
     '(progn
        (require 'em-cmpl)
        (require 'em-prompt)))

(defun rpw/current-region ()
  (buffer-substring-no-properties (region-beginning) (region-end))
)

(defun bb/filter-region-through-shell-command ()
  "Like BBEdit's Text Filters, but the command is selected at runtime. Also I can never remember the universal modifier"
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) (read-string "Command to execute: ") "current buffer" t))


(defun bb/script-eval-selected-in-eshell ()
  "Like BBEdit's script functionality, but (a) command is selected at runtime by looking at the region. Either switch to the eshell buffer OR use the fancy eshell redirection properties to get the output out."
  (interactive)
  (let ((oldbuff (current-buffer))) 
    (run-this-in-eshell
     (buffer-substring-no-properties (region-beginning) (region-end)))
  ))


(defun bb/script-pass-region-to-stdin ()
  ; even more useful if you do something like, in the minibuffer, ruby >>> /dev/kill !!!
  (interactive)
  (current-region-to-shell-file)
  (let ((current-command (read-string "run command (will be piped the current region): ")))
    (run-this-in-eshell (concat "cat /tmp/current-region | " current-command))
  )
)

(defun rpw/exec-only-current-eshell-region ()
  "you're taken the output from a previus command, maybe typed some more but maybe not, and want to run it. Make that easy"
     (interactive)
     (run-this-in-eshell (rpw/current-region)))


(defun run-this-in-eshell (cmd)
  "Runs the command 'cmd' in eshell."
  (with-current-buffer "*eshell*"
    (eshell-kill-input)
    (end-of-buffer)
    (insert cmd)
    (eshell-send-input)
    ))


(defun current-region-to-shell-file ()
    ; must have ln at end, but write-region by default does not
    (write-region
         (concat (rpw/current-region) "\n\n")
	 "junk"
	 "/tmp/current-region")
)


(defun current-region-to-shell-file ()
 (write-region (region-beginning) (region-end) "/tmp/current-region")
)
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
 '(package-selected-packages
   (quote
    (xterm-color visual-regexp-steroids regex-tool rainbow-blocks imake devdocs color-theme-sanityinc-solarized base16-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
