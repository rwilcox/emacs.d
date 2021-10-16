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

(require 'use-package-ensure)
(setq use-package-always-ensure t)


(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; one - well, 3 -  line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
