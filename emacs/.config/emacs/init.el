;;;; ethamck's init.el
;;; Attempts to do as much as possible with vanilla Emacs before installing extensions.
;;; Works in tandem with my `kitty` configuration, since colors defined here are intended for a transparent but prominently black background. (That is, Emacs in the terminal, not its own window.)

;; Editor
(menu-bar-mode -1); disable the menu bar
(setq-default mode-line-format); disable the mode line

(setq-default indent-tabs-mode t); turn on tabs wherever possible
(setq-default tab-width 4); make tabs 4 characters long

(setq-default word-wrap t); break at word not character

(global-display-line-numbers-mode); provide line numbers

(setq backup-directory-alist
      `((".*" . "~/.cache/backups"))); put backups in their own cache folder
(setq auto-save-file-name-transforms
      `((".*" "~/.cache/backups" t))); put autosaves in the same cache folder

;; Theming
(set-face-background 'default "undefined")

(set-face-background 'region "darkslategray")

(set-face-foreground 'default "gray")
(set-face-foreground 'minibuffer-prompt "snow")
(set-face-foreground 'font-lock-builtin-face "cyan")
(set-face-foreground 'font-lock-comment-face "brightblack")
(set-face-foreground 'font-lock-function-name-face "blue")
(set-face-foreground 'font-lock-keyword-face "indianred")
(set-face-foreground 'font-lock-string-face "mediumseagreen")
(set-face-foreground 'font-lock-type-face "yellow")
(set-face-foreground 'font-lock-variable-name-face "salmon")

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(smart-tabs-mode); uses smart-tabs-mode

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(smart-tabs-mode markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
