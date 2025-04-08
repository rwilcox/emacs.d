(provide 'menus-mine)


;; ======================================================== RPW Menu ========================
;; Creating a new menu pane in the menu bar to the right of “Tools” menu
(define-key-after
  global-map
  [menu-bar mymenu]
  (cons "RPW" (make-sparse-keymap "hoot hoot"))
  'tools )

(define-key
 global-map
 [menu-bar mymenu twpb]
 '("Toggle Philip Bar" . display-fill-column-indicator-mode))

(define-key
 global-map
 [menu-bar mymenu twtb]
 '("Toggle (Window) Tab Bar" . tab-line-mode))

(define-key
 global-map
 [menu-bar mymenu htbc]
 '("Toggle Toolbar" . tool-bar-mode))

(define-key
  global-map
  [menu-bar mymenu hcntt]
  '("Toggle Current Text Highlighting" . jpt-toggle-mark-word-at-point)
)
(define-key
  global-map
  [menu-bar mymenu dird]
  '("Reveal current buffer in dired" . dired-jump-other-window)
  )

(define-key
  global-map
  [menu-bar mymenu cms]
  '("Toggle Autocomplete Popup" . company-mode)
)
;; Creating a menu item, under the menu by the id “[menu-bar mymenu]”
(define-key
  global-map
  [menu-bar mymenu sp]  ; third identified is unique identifier for menu. RPW 05/08/2020
  '("Speedbar" . speedbar))

(define-key
  global-map
  [menu-bar mymenu wwt]
  '("Timezone Conversion" . wwtime/in-new-buffer)
  )

(define-key
  global-map
  [menu-bar mymenu im]
  '("iMake" . imake))

;(define-key
;  global-map
;  [menu-bar mymenu sova]
;  '("Soulver: Evaluate buffer, append soulver-output" . soulver/script-eval-elisp-and-append-output-variable))

;(define-key
;  global-map
;  [menu-bar mymenu fall]
;  '("Find All" . occur))

(define-key
  global-map
  [menu-bar mymenu fprgrep]
  '("rg" . rg))

(define-key
  global-map
  [menu-bar mymenu twrap]
  '("Toggle World Wrap" . toggle-truncate-lines))

(define-key
  global-map
  [menu-bar mymenu jdke]
  '("Use JDK 8" . jdk-8-development))

(define-key
  global-map
  [menu-bar mymenu jdkne]
  '("Use JDK 11" . jdk-11-development))

(define-key
  global-map
  [menu-bar mymenu keysz]
  '("Minor Mode Keys" . which-key-show-major-mode))

(define-key
  global-map
  [menu-bar mymenu tabuf]
  '("I want to use tabs for whitespace" . rpw/really-i-want-to-use-a-tab-key-here))

(define-key
  global-map
  [menu-bar mymenu bmrz]
  '("See Bookmarks" . bm-show))

(define-key
  global-map
  [menu-bar mymenu rpwa]
  '("RPW ANY" . rpw/any))
