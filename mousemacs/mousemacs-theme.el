
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Define mousemacs fonts, colors and theme here.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package spaceline :ensure t)

;; Spaceline - nice powerline theme!
(require 'spaceline-config)
(spaceline-emacs-theme)

;; add your own theme here if you wish for instance...
;;(use-package color-theme-modern :ensure t)
;;(package-initialize)
;;(load-theme 'scintilla t)

(defvar mousemacs-path
		(concat user-emacs-directory
        (convert-standard-filename "mousemacs")))

(add-to-list 'load-path (concat mousemacs-path "theme"))

(add-to-list 'custom-theme-load-path (concat mousemacs-path "theme"))
(load-theme 'mousemacs-yellow t)
;; (load-theme 'mousemacs-default t)

;; set default font
(set-face-attribute 'default nil :family "Jetbrains Mono" :height 105 :weight 'normal)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; mousemacs tabbar colors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set default bg color
(set-face-attribute
 'tabbar-default nil
 :background "Gray80")

;; set default bg color of unselected tabs
(set-face-attribute
 'tabbar-unselected nil
 :background "Grey56"
 :foreground "white"
 :height 1.3
 :box '(:line-width 1 :color "Grey56" :style nil))

;; set default selected bg color to theme bg
(set-face-attribute
 'tabbar-selected nil
 :background (face-attribute 'default :background)
 :foreground "black"
 :height 1.3
 :box '(:line-width 1 :color "white" :style nil))

;; set selected modified
(set-face-attribute
 'tabbar-selected-modified nil
 :background (face-attribute 'default :background)
 :foreground "black"
 :height 1.3)

;; set modified
(set-face-attribute
 'tabbar-modified nil
 :background "Grey56"
 :foreground "white"
 :height 1.3)

;; seperate tabs
(set-face-attribute
 'tabbar-separator nil
 :background "Gray80"
 :height 0.6)
