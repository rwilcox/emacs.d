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
(use-package wwtime)
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


(use-package rg)

(rg-enable-default-bindings)
(use-package plantuml-mode)
(use-package graphviz-dot-mode
  :ensure t
  :config
  (setq graphviz-dot-indent-width 4))

(use-package lsp-mode
  :ensure
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  ; (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

;(use-package company-graphviz-dot
;  )
