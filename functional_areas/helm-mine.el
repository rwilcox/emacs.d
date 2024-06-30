(provide 'helm-mine)

(require 'helm)
(require 'helm-ls-git)
(require 'helm-for-files)
;; ^^ else helm-source-recentf may be nil in rpw/any if you haven't done a helm command already

(helm-mode 1)
(setq helm-move-to-line-cycle-in-source nil)
  ; https://github.com/emacs-helm/helm/issues/2623#issuecomment-1788592487

; (helm-ls-git-build-ls-git-source)

;;; helm-source-ls-git is nil until helm-ls-git-ls is invoked once. Initialize here.
;;; thanks https://github.com/kanbouchou/dotemacs/blob/dffcb0ca938ab14c2a91f2f2eb11d68e3c9ad71b/init-loader.bak/20-helm.el#L27C1-L33C42
(setq helm-source-ls-git-status
      (helm-ls-git-build-git-status-source)
      helm-source-ls-git
      (helm-ls-git-build-ls-git-source)
      helm-source-ls-git-buffers
      (helm-ls-git-build-buffers-source))

(unless helm-source-buffers-list
    (setq helm-source-buffers-list
          (helm-make-source "Buffers" 'helm-source-buffers)))
;;; ZOMG: https://github.com/jonnay/emagicians-starter-kit/blob/bc7575bc19f1a7e19c1d2f357e55e58b633284e0/Interface.org#f2-is-my-super-duper-dwim-helper
(defun rpw/any ()
  "Find / open ANYTHING: buffer, git file, etc."
  (interactive)

  (helm
   :sources '(
              helm-source-buffers-list
              helm-source-ls-git
              helm-source-recentf
)
        :buffer "*helm all the things*")
)
(global-set-key (kbd "C-c r o") 'rpw/any)


;alternative implementation
(setq helm-mini-default-sources '(helm-source-buffers-list
                                  helm-source-ls-git
                                  helm-source-recentf
                                  helm-source-buffer-not-found))
