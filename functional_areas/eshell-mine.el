(provide 'eshell-mine)

(defun eshell-new()
  (interactive)
  (eshell 'N)
  )


;; make eshell a better place for long running processes that spew a lot of command line output (ie development servers...)
(setq eshell-buffer-maximum-lines 12000)
(defun eos/truncate-eshell-buffers ()
  "Truncates all eshell buffers"
  (interactive)
  (save-current-buffer
    (dolist (buffer (buffer-list t))
      (set-buffer buffer)
      (when (eq major-mode 'eshell-mode)
        (eshell-truncate-buffer)))))

;; After being idle for 5 seconds, truncate all the eshell-buffers if
;; needed. If this needs to be canceled, you can run `(cancel-timer
;; eos/eshell-truncate-timer)'
(setq eos/eshell-truncate-timer
      (run-with-idle-timer 5 t #'eos/truncate-eshell-buffers))


; yes this is technically shell mode, I'm just dumping this here for now
(define-key shell-mode-map (kbd "<up>") 'comint-previous-input)

(define-key shell-mode-map (kbd "<down>") 'comint-next-input)

; now back to regularly scheduled eshell

(defun open-file-at-line (file line)
  "Open FILE and go to LINE."
  (interactive "fFile: \nNLine: ")
  (find-file file)        ;; Open the specified file
  (goto-line line))       ;; Move to the specified line


;; bbl is meant to mirror my bb eshell alias (which just aliases find-file in eshell)
;; except this one opens file:line specifications!
(defun bbl (filepath-and-line)
  "Open the file specified in FILEPATH-AND-LINE:LINE_NUMBER and go to the specified line number.
FILEPATH-AND-LINE should be in the format 'filepath:line-number'."
  (interactive "sEnter filepath:line-number: ")
  (let* ((parts (split-string filepath-and-line ":"))  ;; Split the input string
         (file (car parts))                             ;; Get the file path
         (line (if (cadr parts)                         ;; Get the line number if it exists
                    (string-to-number (cadr parts))  ;; Convert to number
                  1)))                                ;; Default to line 1 if not specified
    (open-file-at-line file line)))                    ;; Call the previously defined function


; eshell: certain directories I need to remind myself the setup is too magical for eshell
 ; for example directories that deeply use/Python and Python venvs with no manual control for me
; in this case, allow me to place a ".eshell-warn" file to notify my future self to switch to normal
; shell mode (or ghostel or whatever)
; ... mostly generated via LLM, (but it seems to work, theoretically...)
  (defvar rpw/eshell-default-prompt-function nil
    "Stock eshell prompt before warn customization.")

  (defvar-local rpw/eshell-warn-dir nil
    "Directory containing .eshell-warn for current eshell buffer, if any.")

  (defun rpw/eshell-warn-message (warn-dir)
    "Show warning from .eshell-warn in WARN-DIR."
    (let ((msg (string-trim
                (with-temp-buffer
                  (insert-file-contents (expand-file-name ".eshell-warn" warn-dir))
                  (buffer-string)))))
      (when (string-empty-p msg)
        (setq msg (format "Warning: entered %s" warn-dir)))
      (minibuffer-message (format "⚠ %s" msg) 8)
      (ding)))

  (defun rpw/eshell-warn-on-cd ()
    "Warn and update prompt state when entering a .eshell-warn directory."
    (setq rpw/eshell-warn-dir
          (locate-dominating-file default-directory ".eshell-warn"))
    (when rpw/eshell-warn-dir
      (rpw/eshell-warn-message rpw/eshell-warn-dir)))

  (defun rpw/eshell-warn-on-open ()
    "Warn on eshell startup if already in a .eshell-warn directory."
    (rpw/eshell-warn-on-cd))

  (defun rpw/eshell-default-prompt ()
    "Stock Emacs 30 eshell prompt."
    (concat (abbreviate-file-name (eshell/pwd))
            (unless (eshell-exit-success-p)
              (format " [%d]" eshell-last-command-status))
            (if (= (file-user-uid) 0) " # " " $ ")))

  (defun rpw/eshell-prompt ()
    "Eshell prompt with warning prefix when under a .eshell-warn directory."
    (let ((base (if rpw/eshell-default-prompt-function
                    (funcall rpw/eshell-default-prompt-function)
                  (rpw/eshell-default-prompt)))
          (warn-dir (or rpw/eshell-warn-dir
                        (locate-dominating-file default-directory ".eshell-warn"))))
      (if warn-dir
          (propertize (concat "⚠ " base) 'face 'warning)
        base)))

  (defun rpw/eshell-warn-setup ()
    "Install eshell warn hooks and custom prompt."
    (unless rpw/eshell-default-prompt-function
      (when (boundp 'eshell-prompt-function)
        (setq rpw/eshell-default-prompt-function eshell-prompt-function)))

    (setq eshell-prompt-function #'rpw/eshell-prompt)

    (add-hook 'eshell-directory-change-hook #'rpw/eshell-warn-on-cd)
    (add-hook 'eshell-mode-hook #'rpw/eshell-warn-on-open))

  (with-eval-after-load "em-prompt"
    (rpw/eshell-warn-setup))
