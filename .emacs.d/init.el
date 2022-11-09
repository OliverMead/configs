; -*- lexical-binding: t -*-
;;; Start in scratch
(setq inhibit-startup-message t)

;;; Faster startup à la Doom 
(defvar last-file-name-handler-alist file-name-handler-alist)
(setq gc-cons-threshold 400000000 ;; 400MB
      gc-cons-percentage 0.6
      file-name-handler-alist nil)

;;; Declutter 
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 1)
(menu-bar-mode -1)
(setq frame-resize-pixelwise t)

;;; Disabling heresy
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;;(global-set-key (kbd "TAB") 'self-insert-command)
(setq-default make-backup-files nil)
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
(with-current-buffer "*scratch*"
  (emacs-lock-mode 'kill))
(setenv "GPG_AGENT_INFO" nil)

;;; Appearance
(set-face-attribute 'default nil :font "Source Code Pro" :height 100)
;; (load-theme 'tango-dark) ; see doom-themes
(column-number-mode)
;(setq-default display-line-numbers-type "relative")
;      display-line-numbers-current-absolute t)
(global-display-line-numbers-mode t)
(menu-bar--display-line-numbers-mode-relative)

(dolist
    (mode
     '(org-mode-hook
       term-mode-hook
       vterm-mode-hook
       circe-mode-hook
       eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq user-mail-address "oliver.j.mead@protonmail.com"
      user-full-name "Oliver J. Mead")

;;; Recent
(recentf-mode 1)
(setq recentf-max-menu-items 40)
(setq recentf-max-saved-items 40)

;;; Independant (non-package) keys
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; Package management
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'dired-x)
(require 'project)
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package transmission)

(use-package vterm)
(use-package multi-vterm
  :after vterm
  :config
  (require 'vterm-tmux))

(use-package emojify
  :hook (after-init . global-emojify-mode))

(use-package undo-tree
  :init (setq undo-tree-auto-save-history nil)
  :config
  (global-undo-tree-mode))

(use-package helm)

(use-package debbugs)

;;; EViL MODE
(use-package evil
  :init
  (setq evil-want-C-u-scroll t
        evil-want-keybinding nil
        evil-undo-system 'undo-tree
        evil-insert-state-message nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map
    (kbd "C-h") 'evil-delete-backward-char-and-join))

(use-package evil-commentary
  :after evil
  :config (evil-commentary-mode))

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-snipe
  :after evil
  :config
  (evil-snipe-mode 1))

(use-package magit)

(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package hydra
  :config
  (defhydra hydra-text-scale (:timeout 4)
      "Scale text in current buffer"
      ("j" text-scale-increase "Increase")
      ("k" text-scale-decrease "Decrease")
      ("q" nil "Quit" :exit t))
  (defhydra hydra-window-size (:timeout 4)
    "Resize the current Emacs window"
    ("j" evil-window-increase-height "Incr Height")
    ("k" evil-window-decrease-height "Decr Height")
    ("l" evil-window-increase-width "Incr Width")
    ("h" evil-window-decrease-width "Decr Width")
    ("q" nil "Quit :exit t")))

(use-package general
  :after (which-key evil hydra multi-vterm)
  :config
  (general-create-definer ojm/leader
    :keymaps '(normal insert visual emacs debbugs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (general-create-definer ojm/local-leader
    :prefix "SPC m")

  (general-create-definer ojm/local-leader-which-key
    :prefix "SPC")

  (defmacro ojm/prefix (&optional prompt &rest maps)
    `'(:ignore t :which-key ,(or prompt "prefix") :keymaps ,maps))
  (defmacro ojm/keycmd (cmd &optional name)
    `'(,cmd :which-key ,(or name (symbol-name cmd))))
  (defmacro ojm/simulate (key &optional name)
    `(general-simulate-key ,key :which-key ,name))

  (defun ojm/scratch ()
    (interactive)
    (switch-to-buffer "*scratch*"))

  (defun ojm/transmission (socket)
    (interactive (list (if current-prefix-arg
                           (read-file-name
                            "Transmission Remote Socket: "))))
    (let ((transmission-host (or socket transmission-host)))
      (transmission)))

  (ojm/local-leader-which-key 'normal
    "m" (ojm/prefix "Org Command:" 'org-mode-map)
    "m" (ojm/prefix "ELisp Command:" 'lisp-interaction-mode-map)
    "m" (ojm/prefix "Circe Command:" 'circe-mode-map))
                              
  (ojm/leader
    "s" (ojm/keycmd ojm/scratch)
    "u" (ojm/keycmd universal-argument "Universal Argument")
    "." (ojm/keycmd counsel-find-file "Find File")
    "," (ojm/keycmd counsel-switch-buffer "Switch Buffer")
    "w" (ojm/simulate "C-w" "Window:")
    "h" (ojm/simulate "C-h" "Help:")
    "x" (ojm/simulate "C-x" "C-x:")
    "e" (ojm/simulate "C-x C-e" "C-x C-e")
    "SPC" (ojm/keycmd projectile-find-file)
    "P" (ojm/keycmd projectile-add-known-project)
    "p" '(:keymap projectile-command-map :package projectile
                  :which-key "Projectile Command:"))

  (ojm/leader
    "c" (ojm/prefix "Util:")
    "cw" (ojm/keycmd dictionary-search "Define Word"))

  (ojm/leader
    "j" (ojm/prefix "Jump:")
    "jo" (ojm/keycmd evil-previous-open-paren "Opening Paren")
    "jc" (ojm/keycmd evil-next-close-paren "Closing Paren")
    "jm" (ojm/keycmd evil-jump-item "Matching Delimiter"))
    
  (ojm/leader
    "t" (ojm/prefix "Toggle:")
    "tt" (ojm/keycmd counsel-load-theme "Choose Theme")
    "ts" (ojm/keycmd hydra-text-scale/body "Scale Adjustment")
    "tr" (ojm/keycmd hydra-window-size/body "Window Adjustment")
    "tw" (ojm/keycmd toggle-truncate-lines)
    "tp" (ojm/keycmd electric-pair-mode))

  (ojm/leader
    "g" (ojm/prefix "Git:")
    "gg" (ojm/keycmd magit "Launch Magit")
    "gb" (ojm/keycmd magit-branch)
    "gd" (ojm/keycmd magit-diff-unstaged)
    "gc" (ojm/keycmd magit-branch-or-checkout))

  (ojm/leader
    "f" (ojm/prefix "File Command:")
    "fd" (ojm/keycmd delete-file)
    "fr" (ojm/keycmd counsel-buffer-or-recentf)
    "fb" (ojm/prefix "Bookmark:")
    "fbm" (ojm/keycmd bookmark-set)
    "fbM" (ojm/keycmd bookmark-set-no-overwrite)
    "fbb" (ojm/keycmd bookmark-jump))

  (ojm/leader
    "b" (ojm/prefix "Buffer Command:")
    "bn" (ojm/keycmd switch-to-next-buffer "Next")
    "bp" (ojm/keycmd switch-to-prev-buffer "Prev")
    "bd" (ojm/keycmd kill-current-buffer)
    "bs" (ojm/keycmd save-buffer))

  (ojm/leader
    "q" (ojm/prefix "Quit:")
    "qq" (ojm/keycmd save-buffers-kill-terminal "Quit"))

  (ojm/leader
    "i" (ojm/prefix "Insert: ")
    "ie" (ojm/keycmd emojify-insert-emoji)
    "iu" (ojm/keycmd counsel-unicode-char))

  (ojm/local-leader 'normal 'circe-mode-map
    "q" (ojm/keycmd circe-command-QUERY)
    "j" (ojm/keycmd circe-command-JOIN)
    "p" (ojm/keycmd circe-command-PING)
    "a" (ojm/keycmd circe-command-GAWAY)
    "b" (ojm/keycmd circe-command-BACK)
    "r" (ojm/keycmd circe-reconnect)
    "R" (ojm/keycmd circe-reconnect-all))

  (ojm/leader
    "o" (ojm/prefix "Open: ")
    "oc" (ojm/keycmd circe)
    "ot" (ojm/keycmd vterm-tmux "TMux")
    "oT" '((lambda nil
             (interactive)
             (let
                 ((current-prefix-arg
                   '(4)))
               (call-interactively 'vterm-tmux)))
           :which-key "TMux Remote")))
    
(use-package treemacs
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :config (treemacs-set-scope-type 'Perspectives))

(use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
  :after (treemacs)
  :config (treemacs-set-scope-type 'Tabs))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (setq which-key-idle-delay 0.3)
  :config
  (which-key-mode t))

(setq byte-compile-warnings '(not cl-functions))
(use-package command-log-mode)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-switch-buffer)
         ("C-x C-f" . counsel-find-file)
         ("C-s" . swiper)
         :map minibuffer-local-map
         ("C-r" . counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)
  (ivy-mode 1)) ;; default starts with ^

(use-package ivy-rich
  :config
  (ivy-rich-mode 1))

(use-package pass
  :init
  (autoload 'auth-source-pass-parse-entry "auth-source-pass")
  (defvar +pass-user-fields '("login" "user" "username" "email"))
  (defvar +pass-url-fields '("url" "site" "location"))
  :config
  (defalias '+pass-get-entry #'auth-source-pass-parse-entry)
  (defun +pass-get-field (entry fields &optional noerror)
    (if-let* ((data (if (listp entry) entry (+pass-get-entry entry))))
        (cl-loop for key in (ensure-list fields)
                 when (assoc key data)
                 return (cdr it))
      (unless noerror
        (error "Couldn't find entry: %s" entry))))

  (defun +pass-get-user (entry)
    (+pass-get-field entry +pass-user-fields))

  (defun +pass-get-secret (entry)
    (+pass-get-field entry 'secret))) 

(use-package password-store)
(use-package password-store-otp)
(use-package ivy-pass)

(use-package circe
  :defer t
  :config
  (setq circe-network-options 
        `(("irc.libera.chat"
           :tls t
           :port 6697
           :nick "olivermead"
           :sasl-username ,(+pass-get-user "irc.libera.chat")
           :sasl-password (lambda (&rest _) (+pass-get-secret "irc.libera.chat"))
           :channels ("#emacs"))))
  (setq circe-use-cycle-completion t)
  (require' circe-color-nicks)
  (add-hook 'circe-channel-mode-hook #'enable-circe-color-nicks)
  (defvar +irc-left-padding 13)
  (defsubst +irc--pad (left right)
    (format (format "%%%ds | %%s" +irc-left-padding)
            (concat "*** " left) right))
  (setq circe-color-nicks-min-contrast-ratio 4.5
        circe-color-nicks-everywhere t
        circe-reduce-lurker-spam t

        circe-format-say (format "{nick:+%ss} │ {body}" +irc-left-padding)
        circe-format-self-say circe-format-say
        circe-format-action (format "{nick:+%ss} * {body}" +irc-left-padding)
        circe-format-self-action circe-format-action
        circe-format-notice (format "{nick:%ss} _ {body}" +irc-left-padding)
        circe-format-server-topic
        (+irc--pad "Topic" "{userhost}: {topic-diff}")
        circe-format-server-join-in-channel
        (+irc--pad "Join" "{nick} ({userinfo}) joined {channel}")
        circe-format-server-join
        (+irc--pad "Join" "{nick} ({userinfo})")
        circe-format-server-part
        (+irc--pad "Part" "{nick} ({userhost}) left {channel}: {reason}")
        circe-format-server-quit
        (+irc--pad "Quit" "{nick} ({userhost}) left IRC: {reason}]")
        circe-format-server-quit-channel
        (+irc--pad "Quit" "{nick} ({userhost}) left {channel}: {reason}]")
        circe-format-server-rejoin
        (+irc--pad "Re-join" "{nick} ({userhost}), left {departuredelta} ago")
        circe-format-server-netmerge
        (+irc--pad "Netmerge" "{split}, split {ago} ago (Use /WL to see who's still missing)")
        circe-format-server-nick-change
        (+irc--pad "Nick" "{old-nick} ({userhost}) is now known as {new-nick}")
        circe-format-server-nick-change-self
        (+irc--pad "Nick" "You are now known as {new-nick} ({old-nick})")
        circe-format-server-nick-change-self
        (+irc--pad "Nick" "{old-nick} ({userhost}) is now known as {new-nick}")
        circe-format-server-mode-change
        (+irc--pad "Mode" "{change} on {target} by {setter} ({userhost})")
        circe-format-server-lurker-activity
        (+irc--pad "Lurk" "{nick} joined {joindelta} ago")))

(use-package parinfer-rust-mode
  :when (bound-and-true-p module-file-suffix)
  :hook emacs-lisp-mode)

(use-package all-the-icons
  :if (display-graphic-p))

;;; Doom Packages
(use-package doom-modeline
  :init
  (setq doom-modeline-height 25)
  :custom
  (doom-modeline-mode 1))

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox-light t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;; Undo early-init GC changes
(setq gc-cons-threshold 1600000 ;; 160KB
      gc-cons-percentage 0.1
      file-name-handler-alist last-file-name-handler-alist) 
