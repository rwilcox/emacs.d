(provide 'editing-extensions)

(defun rpw/really-i-want-to-use-a-tab-key-here ()
  (interactive)
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)

  (setq indent-tabs-mode t)
                                        ; https://dougie.io/emacs/indentation/#functions-for-enablingdisabling-tabs
  )

(defun shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right-region ()  ; seriously, don't run this on not-a-region
  (interactive)
  (shift-region 2))

(defun shift-left-region ()
  (interactive)
  (shift-region -2))

(global-set-key (kbd "C-c r ~") 'string-inflection-toggle)  ; ~ maps back to Vim functionality

;; from https://chopmo.dk/2016/10/27/emacs-highlighting-current-word.html
(require 'hi-lock)
(defun jpt-toggle-mark-word-at-point ()
  (interactive)
  (if hi-lock-interactive-patterns
      (unhighlight-regexp (car (car hi-lock-interactive-patterns)))
    (highlight-symbol-at-point)))

;; easy open up files at the point, even if they are relative paths
(ffap-bindings)

;; https://www.emacswiki.org/emacs/AutoIndentation
(electric-indent-mode 1)

(require 'detour)
; for the mark and go back package detour
; / and = are beside each other on the dvorak keyboard
(global-set-key [(control \/)] 'detour-mark)
(global-set-key [(control \=)] 'detour-back)
