;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

(show-paren-mode 1)
(tool-bar-mode -1)

;;; for Aquamacs Emacs, they set some keys in
;;; the osx-key-mode-map, and make it a more
;;; default keymap than global-map.
(if (boundp 'osx-key-mode-map)
    (setq hah-key-map osx-key-mode-map)
  (setq hah-key-map global-map))

(define-key hah-key-map [home] 'beginning-of-line)
(define-key hah-key-map [end] 'end-of-line)
(define-key hah-key-map [C-home] 'beginning-of-buffer)
(define-key hah-key-map [C-end] 'end-of-buffer)
