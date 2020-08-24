(provide 'menus-mine)


;; ======================================================== RPW Menu ========================
;; Creating a new menu pane in the menu bar to the right of “Tools” menu
(define-key-after
  global-map
  [menu-bar mymenu]
  (cons "RPW" (make-sparse-keymap "hoot hoot"))
  'tools )

;; Creating a menu item, under the menu by the id “[menu-bar mymenu]”
(define-key
  global-map
  [menu-bar mymenu sp]  ; third identified is unique identifier for menu. RPW 05/08/2020
  '("Speedbar" . speedbar))

(define-key
  global-map
  [menu-bar mymenu im]
  '("iMake" . imake))

(define-key
  global-map
  [menu-bar mymenu sova]
  '("Soulver: Evaluate buffer, append soulver-output" . soulver/script-eval-elisp-and-append-output-variable))

(define-key
  global-map
  [menu-bar mymenu fall]
  '("Find All" . occur))
