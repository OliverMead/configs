(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile tramp-connection-local-default-shell-profile)
     ((:application eshell)
      eshell-connection-default-profile)))
 '(connection-local-profile-alist
   '((tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state=abcde" "-o" "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . tramp-ps-time)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o" "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "stat=abcde" "-o" "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (user . string)
       (group . string)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (ttname . string)
       (time . tramp-ps-time)
       (nice . number)
       (etime . tramp-ps-time)
       (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (group . string)
       (comm . 52)
       (state . string)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . number)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh")
      (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":")
      (null-device . "/dev/null"))
     (eshell-connection-default-profile
      (eshell-path-env-list))))
 '(custom-safe-themes
   '("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "467dc6fdebcf92f4d3e2a2016145ba15841987c71fbe675dcfe34ac47ffb9195" default))
 '(doom-modeline-mode 1 nil nil "Customized with use-package doom-modeline")
 '(fill-column 80)
 '(helm-minibuffer-history-key "M-p")
 '(mml-secure-key-preferences
   '((OpenPGP
      (sign)
      (encrypt
       ("oliver.j.mead@protonmail.com" "04534C41D4C54E64D0141109FB4CF0AF772226E8")))
     (CMS
      (sign)
      (encrypt))))
 '(mml-secure-openpgp-sign-with-sender t)
 '(org-agenda-files
   '("/home/olivermead/org/notes.org.gpg" "/home/olivermead/org/todo.org.gpg"))
 '(org-link-search-must-match-exact-headline nil)
 '(package-selected-packages
   '(tramp-container tramp-containers emms webpaste docker-tramp zig-mode company-jedi python-mode blender-python blender-python-mode lsp-mode circe-notifications racket-mode magit bnf-mode auctex pdf-tools format-all lsp-jedi ox-extra poetry astyle flycheck company-irony irony pinentry emmet-mode tramp-nspawn toc-org geiser-guile geiser org-plus-contrib org-contrib sly desktop-environment exwm simple-httpd gnus-desktop-notify gnus-notify exec-path-from-shell eglot haskell-mode yasnippet company evil-magit counsel-projectile transmission beacon debbugs emojify multi-vterm vterm multi-term-tmux multi-term general which-key use-package undo-tree treemacs-tab-bar treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil rainbow-delimiters pass parinfer-rust-mode ivy-rich ivy-pass helm evil-surround evil-snipe evil-commentary evil-collection doom-themes doom-modeline counsel command-log-mode circe all-the-icons))
 '(safe-local-variable-values
   '((org-latex-classes
      ("altacv" "\\documentclass[10pt,a4paper,ragged2e,withhyper]{altacv}\12[NO-DEFAULT-PACKAGES]\12[NO-PACKAGES]\12\\geometry{left=1.25cm,right=1.25cm,top=1.5cm,bottom=1.5cm,columnsep=1.2cm}\12\12% Use roboto and lato for fonts\12\\renewcommand{\\familydefault}{\\sfdefault}\12\12% Change the colours if you want to\12\\definecolor{SlateGrey}{HTML}{2E2E2E}\12\\definecolor{LightGrey}{HTML}{666666}\12\\definecolor{DarkPastelRed}{HTML}{450808}\12\\definecolor{PastelRed}{HTML}{8F0D0D}\12\12\\definecolor{PastelBlue}{HTML}{aec6cf}\12\\definecolor{DarkPastelBlue}{HTML}{779ecb}\12\12\\definecolor{GoldenEarth}{HTML}{E7D192}\12\12\\colorlet{name}{black}\12\\colorlet{tagline}{LightGrey}\12\\colorlet{heading}{SlateGrey}\12\\colorlet{headingrule}{LightGrey}\12\\colorlet{subheading}{LightGrey}\12\\colorlet{accent}{LightGrey}\12\\colorlet{emphasis}{SlateGrey}\12\\colorlet{body}{LightGrey}\12\12% Change some fonts, if necessary\12\\renewcommand{\\namefont}{\\Huge\\rmfamily\\bfseries}\12\\renewcommand{\\personalinfofont}{\\footnotesize}\12\\renewcommand{\\cvsectionfont}{\\LARGE\\rmfamily\\bfseries}\12\\renewcommand{\\cvsubsectionfont}{\\large\\bfseries}\12\12% Change the bullets for itemize and rating marker\12% for cvskill if you want to\12\\renewcommand{\\itemmarker}{{\\small\\textbullet}}\12\\renewcommand{\\ratingmarker}{\\faCircle}\12\12\\usepackage[rm]{roboto}\12\\usepackage[defaultsans]{lato}\12\\usepackage{paracol}\12\\columnratio{0.6}\12"
       ("\\cvsection{%s}" . "\\cvsection*{%s}")
       ("\\cvevent{%s}" . "\\cvevent*{%s}")))
     (rustic-cargo-run-use-comint . t)
     (rustic-cargo-build-arguments . "-r")
     (eval org-babel-do-load-languages 'org-babel-load-languages
           '((shell . t)
             (python . t)))
     (org-num-skip-unnumbered . t)
     (eval setenv "HSA_OVERRIDE_GFX_VERSION" "10.3.0")
     (eglot-server-programs
      (python-mode "/home/olivermead/git/scratch/nerf/.env/bin/pyls"))
     (python-shell-interpreter . "/home/olivermead/git/scratch/nerf/.env/bin/python")
     (company-backends . company-capf)
     (eglot-server-programs
      (python-mode "./.env/bin/pyls"))
     (python-shell-interpreter . "./env/bin/python")
     (diff-add-log-use-relative-names . t)
     (vc-git-annotate-switches . "-w"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
