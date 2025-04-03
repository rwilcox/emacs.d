(rg-enable-default-bindings)
(use-package graphviz-dot-mode
  :ensure t
  :config
  (setq graphviz-dot-indent-width 4))

(use-package detour)

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

(use-package kotlin-mode
  :hook
  (kotlin-mode . lsp))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred


(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(use-package string-inflection)
(use-package bm
  :ensure t
  :demand t

  :init
  :config
  (global-set-key (kbd "<left-fringe> <mouse-3>") 'bm-toggle-mouse)
  (setq bm-highlight-style "bm-highlight-only-fringe")  ;; can also be -only-line
)

(package-vc-install "https://github.com/JasZhe/hurl-mode")
(use-package hurl-mode :mode "\\.hurl\\'")

(yas-global-mode 1)

(use-package selected-window-accent-mode
  :config (selected-window-accent-mode 1)
  :custom
  (selected-window-accent-fringe-thickness 6)
  ;(selected-window-accent-percentage-darken 20)
  ;(selected-window-accent-percentage-desaturate 20)
  ;(selected-window-accent-smart-borders t)
  ;(selected-window-accent-tab-accent nil)
  ;(selected-window-accent-custom-color "nil")
  ; (selected-window-accent-mode-style 'subtle) ; <-- tried it, NO. RPW 10-24-2024
  ;(selected-window-accent-foreground-adjust-factor 0.1)
  ;(selected-window-accent--use-complementary-color nil)
  ;(selected-window-accent--foreground-invert-state nil)
                                        ;(selected-window-accent--foreground-offset 0))
  )

(use-package fancy-compilation
  :commands (fancy-compilation-mode))

(with-eval-after-load 'compile
  (fancy-compilation-mode))
