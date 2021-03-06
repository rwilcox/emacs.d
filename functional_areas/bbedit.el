(provide 'bbedit)

(defun rpw/current-region ()
  (buffer-substring-no-properties (region-beginning) (region-end)))


(defun bb/new-empty-text-buffer ()
  "Create a new empty buffer.
New buffer will be named “untitled” or “untitled<2>”, “untitled<3>”, etc.

It returns the buffer (for elisp programing).

URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
Version 2017-11-01"
  (interactive)
  (let (($buf (generate-new-buffer "untitled")))
    (switch-to-buffer $buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)
    $buf
    ))

  
(defun bb/filter-region-through-shell-command ()
  "Like BBEdit's Text Filters, but the command is selected at runtime. Also I can never remember the universal modifier"
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) (read-string "Command to execute: ") "current buffer" t))


(defun bb/script-eval-selected-in-eshell ()
  "Like BBEdit's script functionality, but (a) command is selected at runtime by looking at the region. Either switch to the eshell buffer OR use the fancy eshell redirection properties to get the output out."
  (interactive)
  (let ((oldbuff (current-buffer))) 
    (run-this-in-eshell
     (buffer-substring-no-properties (region-beginning) (region-end)))
  ))


(defun bb/script-pass-region-to-stdin ()
  ; even more useful if you do something like, in the minibuffer, ruby >>> /dev/kill !!!
  (interactive)
  (current-region-to-shell-file)
  (let ((current-command (read-string "run command (will be piped the current region): ")))
    (run-this-in-eshell (concat "cat /tmp/current-region | " current-command))
  ))

(defun rpw/exec-only-current-eshell-region ()
  "you're taken the output from a previus command, maybe typed some more but maybe not, and want to run it. Make that easy"
     (interactive)
     (run-this-in-eshell (rpw/current-region)))


(defun run-this-in-eshell (cmd)
  "Runs the command 'cmd' in eshell."
  (with-current-buffer "*eshell*"
    (eshell-kill-input)
    (end-of-buffer)
    (insert cmd)
    (eshell-send-input)
    ))


(defun bb/current-region-to-tmp-current-region-file ()
  (interactive)
  (current-region-to-shell-file)
 )


(defun current-region-to-shell-file ()
    ; must have ln at end, but write-region by default does not
    (write-region
         (concat (rpw/current-region) "\n\n")
	 "junk"
	 "/tmp/current-region"))


(defun current-region-to-shell-file ()
 (write-region (region-beginning) (region-end) "/tmp/current-region"))
