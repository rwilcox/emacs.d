(use-package markdown-mode)
(use-package xterm-color)
(use-package regex-tool)
(use-package rainbow-blocks)
(use-package imake)
(use-package devdocs)
                                        ; (use-package color-theme-sanityinc-solarized)

    (use-package cloud-theme
        :ensure t
        :config
        (load-theme 'cloud t))

; (use-package base16-theme)
(use-package persistent-scratch)
(use-package literate-calc-mode)
(use-package swiper)
(use-package powershell)
(use-package groovy-mode)

(use-package hl-todo)
(use-package projectile)

(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  :custom (which-key-idle-delay 1.2))

(setq which-key-popup-type 'frame)
(setq which-key-persistent-popup t)
