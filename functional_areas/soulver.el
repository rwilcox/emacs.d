(provide 'soulver)

(defun soulver/script-eval-elisp-and-replace (value)
  "Evaluate the sexp at point and replace it with its value"
  (interactive (list (eval-last-sexp nil)))
  (kill-sexp -1)
  (insert (format "%S" value)))


(defun soulver/script-eval-elisp-and-append-to-buffer (value)
  "Evaluate the sexp at point and add a new line with the result"
  (interactive (list (eval-buffer)  ( (eval-last-sexp nil)))
  
  (insert (format "\n;; %S" value))))


(defun soulver/script-eval-elisp-and-append-output-variable ()
  "Evaluate the (entire) current buffer. Once eval-ed, look for a variable named soulver-output, and append it
   to the buffer. It's required to be a string, and recommended (but not required) it be prefixed with
   a lisp comment character. But it's a free world I guess"
  (interactive )
  (let ((oldbuff (current-buffer)))
    (eval-buffer)
    (insert soulver-output)))
