(require 'markdown-mine)
(require 'projectile-mine)
(require 'plantuml-mine)
(require 'graphviz-mine)
(require 'python-mine)
(require 'wwtime-mine)

; sometimes machines have specific configs, meaning locations of supporting binaries etc etc
; in my setup these are named machine-configs/machine-name-any-dot-here-are-replaced-with-dashes-config.el
(require (intern (replace-regexp-in-string (regexp-quote "\.") "-" (format "%s-config" system-name))))
