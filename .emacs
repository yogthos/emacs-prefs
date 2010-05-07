;; theme
(defun dark-theme ()
  (interactive)
  (color-theme-install
   '(dark-theme
      ((background-color . "#2b3540")
      (background-mode . light)
      (border-color . "#1a1a1a")
      (cursor-color . "#cee0f2")
      (foreground-color . "#e5e9e2")
      (mouse-color . "black")
      )
     (fringe ((t (:background "#1a1a1a"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#22262f"))))
     (region ((t (:background "#4c5b5d"))))
     (font-lock-builtin-face ((t (:foreground "#a9beef"))))
     (font-lock-comment-face ((t (:foreground "#757f66"))))
     (font-lock-function-name-face ((t (:foreground "#edd400"))))
     (font-lock-keyword-face ((t (:foreground "#db68fd"))))
     (font-lock-string-face ((t (:foreground "#8de160"))))
     (font-lock-type-face ((t (:foreground"#68eda9"))))
     (font-lock-variable-name-face ((t (:foreground "#f5f561"))))
     (minibuffer-prompt ((t (:foreground "#b2c6dc" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'dark-theme)

(require 'color-theme)
(color-theme-initialize)
(dark-theme)

;;; all code in this function lifted from the clojure-mode function
;;; from clojure-mode.el
(defun clojure-font-lock-setup ()
  (interactive)
  (set (make-local-variable 'lisp-indent-function)
       'clojure-indent-function)
  (set (make-local-variable 'lisp-doc-string-elt-property)
       'clojure-doc-string-elt)
  (set (make-local-variable 'font-lock-multiline) t)

  (add-to-list 'font-lock-extend-region-functions
               'clojure-font-lock-extend-region-def t)

  (when clojure-mode-font-lock-comment-sexp
    (add-to-list 'font-lock-extend-region-functions
                 'clojure-font-lock-extend-region-comment t)
    (make-local-variable 'clojure-font-lock-keywords)
    (add-to-list 'clojure-font-lock-keywords
                 'clojure-font-lock-mark-comment t)
    (set (make-local-variable 'open-paren-in-column-0-is-defun-start) nil))

  (setq font-lock-defaults
        '(clojure-font-lock-keywords    ; keywords
          nil nil
          (("+-*/.<>=!?$%_&~^:@" . "w")) ; syntax alist
          nil
          (font-lock-mark-block-function . mark-defun)
          (font-lock-syntactic-face-function
           . lisp-font-lock-syntactic-face-function))))

(add-hook 'slime-repl-mode-hook
          (lambda ()
            (font-lock-mode nil)
            (clojure-font-lock-setup)
            (font-lock-mode t)))