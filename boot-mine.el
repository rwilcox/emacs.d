(require 'eshell)
(require 'em-smart)
(require 'package)
(require 're-builder)
(require 'eshell) ; or use with-eval-after-load


(require 'soulver)
(require 'bbedit)
(require 'eshell-mine)
(require 'menus-mine)
(require 'macros-mine)
(require 'java-config-mine)
(require 'editing-extensions)
(require 'window-extensions)
(require 'treesitter-mine)
(require 'helm-mine)

(require 'use-package-ensure)
(setq use-package-always-ensure t)


(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; one - well, 3 -  line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(global-hl-line-mode +1) ; highlight the current line

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(header-line ((t (:background "cornsilk" :foreground "#f2f2f2" :box (:line-width 1 :color "#2f7e9d")))))
 )

;; for compile mode to work with Typescript. Thanks compile that likes to throw ASCII codes at things...

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point-max)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
