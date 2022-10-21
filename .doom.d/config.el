;; (setq byt-compile-warnings '(not cl-functions))
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Oliver Mead"
      user-mail-address "oliver.j.mead@protonmail.com")

(setq fancy-splash-image (concat doom-private-dir "doom-emacs-gray.svg"))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12))
(setq doom-font (font-spec :family "Fira Code Nerd Font" :size 12 :weight 'medium))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-laserwave)
(setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'tao-yang)
;; (setq doom-theme 'tao-yin)
;; (setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type "relative")

(display-battery-mode 1)
(display-time-mode 1)

(require 'haskell-mode)
(setq haskell-hoogle-command "hoogle")

(define-key haskell-mode-map (kbd "C-c C-h") 'haskell-hoogle)

(after! lsp-haskell
  (setq lsp-haskell-formatting-provider "none")
  (setq +format-with-lsp nil))
;; (setq lsp-haskell-brittany-on t)

(setq parinfer-rust-check-before-enable t)

(set-formatter! 'brittany "brittany" :modes '(haskell-mode))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; (setq jdee-server-dir "~/myJars")
;; ;; (add-to-list jdee-lib-directory-names "~/myJars")
;; (setq jdee-global-classpath '("~/myJars/lib" "."
;;                               ))

;; (custom-set-variables
;;  '(jdee-jdk (quote "11"))
;;  '(jdee-jdk-registry
;;    (quote
;;     (("11" . "/usr/lib/jvm/default-java/bin"))
;;     ))
;;  )

;; (require 'mu4e)

;;                                         smtp
(setq message-send-mail-function 'smtpmail-send-it
      ;; smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-default-smtp-server "localhost"
      smtpmail-smtp-server "localhost"
      smtpmail-stream-type 'plain
      smtpmail-smtp-user "ojm3g19@soton.ac.uk"
      smtpmail-smtp-service 1025
      smtpmail-debug-info t)
      

(setq mu4e-root-maildir (expand-file-name "~/email/mbsyncmail/ojm3g19@soton.ac.uk"))
(setq mail-user-agent 'mu4e-user-agent)

(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-sent-folder   "/Sent")
(setq mu4e-trash-folder  "/Junk")
(setq message-signature-file "~/.emacs.d/.signature") ; put your signature in this file

                                        ; get mail
(setq mu4e-get-mail-command "mbsync -a"
      mu4e-html2text-command "w3m -T text/html"
      mu4e-update-interval 120
      mu4e-headers-auto-update t
      mu4e-compose-signature-auto-include nil)
      

(setq mu4e-maildir-shortcuts
      '( ("/INBOX"               . ?i)
         ("/Sent"   . ?s)
         ("/Junk"       . ?j)
         ("/Drafts"    . ?d)))

;; show images
(setq mu4e-view-show-images t)

;; (require 'mu4e-icalendar)

;; (setq mu4e-view-use-gnus t)
(require 'gnus-icalendar)
(gnus-icalendar-setup)
(require 'org-agenda)
(setq gnus-icalendar-org-capture-file "~/org/notes.org")
(setq gnus-icalendar-org-capture-headline '("Calendar"))
(gnus-icalendar-org-setup)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; general emacs mail settings; used when composing e-mail
;; the non-mu4e-* stuff is inherited from emacs/message-mode
(setq mu4e-compose-reply-to-address "ojm3g19@soton.ac.uk"
      user-mail-address "ojm3g19@soton.ac.uk"
      user-full-name  "Oliver Mead")

;; don't save message to Sent Messages, IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; spell check
(add-hook 'mu4e-compose-mode-hook
          (defun my-do-compose-stuff ()
            "My settings for message composition."
            (set-fill-column 72)
            (flyspell-mode)))
            

(setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t"
      org-msg-startup "hidestars indent inlineimages"
      org-msg-greeting-fmt "\nHi *%s*, \n\n"
      org-msg-greeting-name-limit 3
      org-msg-default-alternatives '(html text)
      org-msg-signature "
Regards,
#+begin_signature
-- *Oliver Mead* \\\\
/UG @ University of Southampton (ECS)/
#+end_signature")

(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2)))

(add-hook 'rust-mode-hook (lambda ())
          (setq rust-indent-offset 2))

;; (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
;; (define-key evil-visual-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
;; (define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)
;; (define-key evil-visual-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)

(map! :leader "i U" #'company-math-symbols-unicode)

(setq company-idle-delay 0.5)

(setq display-line-numbers-type 'relative)

(setq org-plantuml-jar-path "~/plantuml.jar")
;; (setq org-ditaa-jar-path "~/myJars/ditaa0_9.jar")

(set-frame-parameter nil 'undecorated t)

(setq org-highlight-latex-and-related '(latex script entities))
;; (add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
;; (add-hook 'org-mode-hook 'auto-fill-mode)
;; (add-to-list 'org-latex-packages-alist
             ;; '("" "tikz" t))

(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))
(setq org-preview-latex-default-process 'imagemagick)
(setq org-latex-pdf-process (list "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f  %f"))
(exec-path-from-shell-initialize)

(setq idris-interpreter-path "idris2")

(after! tramp
  (setq tramp-inline-compress-start-size 1000)
  (setq tramp-copy-size-limit 10000)
  (setq vc-handled-backends '(Git))
  (setq tramp-verbose 1)
  (setq tramp-default-method "ssh")
  (setq tramp-use-ssh-controlmaster-options nil)
  (setq projectile--mode-line "Projectile")
  (setq tramp-verbose 1))
;; (eval-after-load 'tramp '(setenv "SHELL" "/usr/bin/bash"))

(global-auto-revert-mode t)
(setq auto-revert-use-notify nil)

(after! org
  (use-package! ox-extra
    :config
    (ox-extras-activate '(latex-header-blocks ignore-headlines))))

;; (require 'ox-extra)
;; (ox-extras-activate '(ignore-headlines))

;; (setq tramp-sh-extra-args '(("/bash\\'" . "-i") ("/zsh\\'" . "-f +Z -V")))
;; (add-to-list 'tramp-connection-properties
;;              (list (regexp-quote "ojm3g19")
;;                    "remote-shell" "/usr/bin/bash"
;;                    "sh-extra-args" "-l -i"))

(setq  sly-lisp-implementations '((roswell ("ros" "-Q" "run"))))
