;; -*-lisp-*-

(in-package :stumpwm)

;;; The following lines added by ql:add-to-init-file:
; #-quicklisp
; (let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
;                                        (user-homedir-pathname))))
;   (when (probe-file quicklisp-init)
;     (load quicklisp-init)))

(set-prefix-key (kbd "C-t"))

;;; Top-level (no prefix) Keys
(define-key *top-map* (kbd "s-p") "exec rofi -show drun")
(define-key *top-map* (kbd "s-P") "exec rofi -show run")
(define-key *top-map* (kbd "s-w") "exec rofi -show window")
(define-key *top-map* (kbd "s-L") "exec loginctl lock-session")
(define-key *top-map* (kbd "s-b") "mode-line")
(define-key *top-map* (kbd "s-k") "fprev")
(define-key *top-map* (kbd "s-j") "fnext")
(define-key *top-map* (kbd "s-F") "fullscreen")
(define-key *top-map* (kbd "XF86ScreenSaver") "exec loginctl lock-session")
(define-key *top-map* (kbd "s-RET") "exec st -e tmux")
;;; Root-level (with prefix) Keys

;;; Modeline by default
(mode-line)

;;; Emacs integration with sly
(ql:quickload :slynk)
(slynk:create-server :dont-close t)
