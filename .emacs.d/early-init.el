;;; Faster startup à la Doom 
(defvar last-file-name-handler-alist file-name-handler-alist)
(setq gc-cons-threshold 400000000 ;; 400MB
      gc-cons-percentage 0.6
      file-name-handler-alist nil)
