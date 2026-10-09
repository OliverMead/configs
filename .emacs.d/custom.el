;; -*- lexical-binding: t; -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   '("fa49766f2acb82e0097e7512ae4a1d6f4af4d6f4655a48170d0a00bcb7183970"
     "3e374bb5eb46eb59dbd92578cae54b16de138bc2e8a31a2451bf6fdb0f3fd81b"
     "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe"
     "b7a09eb77a1e9b98cafba8ef1bd58871f91958538f6671b22976ea38c2580755" default))
 '(eldoc-echo-area-use-multiline-p 'truncate-sym-name-if-fit)
 '(fill-column 80)
 '(gnus-thread-sort-functions '(gnus-thread-sort-by-number))
 '(org-agenda-start-on-weekday 0)
 '(org-babel-load-languages '((emacs-lisp . t) (latex . t) (shell . t)))
 '(org-columns-default-format "%25ITEM %TODO %3PRIORITY %ALLTAGS %17EFFORT{:} %CLOCKSUM")
 '(org-export-in-background t)
 '(org-latex-classes
   '(("article" "\\documentclass[11pt]{article}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}" ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}") ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}" ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}") ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("memoir" "\\documentclass[11pt]{memoir}" ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}") ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
 '(org-latex-hyperref-template
   "\\hypersetup{\12 pdfauthor={%a},\12 pdftitle={%t},\12 pdfkeywords={%k},\12 pdfsubject={%d},\12 pdfcreator={%c}, \12 pdflang={%L},\12 colorlinks=true,\12 linkcolor=black,}\12")
 '(org-link-search-must-match-exact-headline nil)
 '(org-num-skip-tags '("ignore" "noexport"))
 '(package-selected-packages
   '(debbugs exec-path-from-shell gruvbox-theme magit org-contrib ox-pandoc
             pdf-tools rust-mode rustic toc-org vundo webpaste))
 '(recentf-auto-cleanup 'never)
 '(sentence-end-double-space nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
