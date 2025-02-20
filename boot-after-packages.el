(require 'markdown-mine)
(require 'projectile-mine)
(require 'plantuml-mine)
(require 'graphviz-mine)
(require 'python-mine)
(require 'wwtime-mine)
(require 'eglot-mine)
(require 'org-extensions-mine)

; sometimes machines have specific configs, meaning locations of supporting binaries etc etc
; in my setup these are named machine-configs/machine-name-any-dot-here-are-replaced-with-dashes-config.el
(require (intern (replace-regexp-in-string (regexp-quote "\.") "-" (format "%s-config" system-name))))



(setq-default mode-line-format
          (list
           ;; value of `mode-name'
           " %m: "
           ;; value of current buffer name
           "buffer '%b' (%&) "
           ;; value of current line number
           "@ L: %l C: %C "
           "(%Z)"
            '(:eval (if (equal (car timeclock-last-event) "i") (format-time-string " IN @ %-I:%M %p"
					                                           (nth 1 timeclock-last-event))))
            '(:eval (if (bound-and-true-p lsp-mode)
                           (propertize " | LSP: On" 'face '(:foreground "green"))
                         (propertize " | LSP: Off" 'face '(:foreground "red"))))

))


(setq company-idle-delay nil)
(global-set-key (kbd "C-.") 'company-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)  ; UMMM YES No more buffer-mode





(provide 'boot-after-packages)
