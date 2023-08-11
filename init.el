;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar mousemacs-path
		(concat user-emacs-directory
        (convert-standard-filename "mousemacs/")))

(add-to-list 'load-path (expand-file-name "vendor" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "functional_areas" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "machine-configs" user-emacs-directory))

(load (concat user-emacs-directory "boot-mine.el"))

;; load mousemacs
(load (concat mousemacs-path "mousemacs-core.el"))
 (load (concat mousemacs-path "mousemacs-theme.el"))
(load (concat mousemacs-path "mousemacs-keybinding.el"))
(load (concat mousemacs-path "mousemacs-etc.el"))

(load (concat user-emacs-directory "packages-mine.el"))
(load (concat user-emacs-directory "custom.el"))
(load (concat user-emacs-directory "theme-mine.el"))
(load (concat user-emacs-directory "boot-after-packages.el"))
