;; -*- lexical-binding: t -*-
;;; Faster startup à la Doom 
(setq gc-cons-threshold 400000000 ;; 400MB
      gc-cons-percentage 0.6
      native-comp-jit-compilation t)
