(menu-bar-mode -1)
(global-display-line-numbers-mode)

(setq-default mode-line-format nil
              mode-require-final-newline t

              indent-tabs-mode t
              tab-width 4
              python-indent-offset 4
              js-indent-level 4

              disabled-command-function nil

              scroll-error-top-bottom t
              word-wrap t

              vc-follow-symlinks nil)

(global-whitespace-mode)
(setq whitespace-style '(face tabs tab-mark))
(add-hook 'lisp-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-hook 'after-save-hook 'whitespace-cleanup)

(setq backup-directory-alist `((".*" . "~/.cache/backups"))
      auto-save-file-name-transforms `((".*" "~/.cache/backups" t)))


(set-face-background 'default "undefined")
(set-face-background 'region "darkslategray")
(set-face-background 'whitespace-tab "undefined")

(set-face-foreground 'minibuffer-prompt "snow")
(set-face-foreground 'font-lock-builtin-face "cyan")
(set-face-foreground 'font-lock-comment-face "brightblack")
(set-face-foreground 'font-lock-function-name-face "dodgerblue")
(set-face-foreground 'font-lock-keyword-face "darkgoldenrod")
(set-face-foreground 'font-lock-string-face "mediumseagreen")
(set-face-foreground 'font-lock-type-face "yellow")
(set-face-foreground 'font-lock-variable-name-face "salmon")
(set-face-foreground 'whitespace-tab "dimgray")
