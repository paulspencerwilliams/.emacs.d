(setq-default
 inhibit-startup-message t
 custom-file "~/.emacs.d/custom-file.el"
 fille-column 80
 create-lockfiles nil
 indent-tabs-mode nil
 auto-save-default nil
 make-backup-files nil
 enable-recursive-minibuffers t
 initial-frame-alist (quote ((fullscreen . maximized))))

(load "~/.emacs.d/environment.el")

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(column-number-mode t)
(global-auto-revert-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode t)
(line-number-mode t)
(set-face-attribute 'default nil :height 160)

(setq-default
 x-select-enable-clipboard t
 x-select-enable-primary t
 save-interprogram-paste-before-kill t
 apropos-do-all t)

(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

(custom-set-variables
 '(gnutls-algorithm-priority "normal:-vers-tls1.3"))

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(use-package magit
  :ensure t)

(use-package spacemacs-common
  :ensure spacemacs-theme
  :config (load-theme 'spacemacs-light t))


(use-package company
  :ensure t
  :defer t
  :bind (:map company-active-map
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous))
  :init (global-company-mode))

(use-package cider
  :ensure t
  :config
  (setq clojure-toplevel-inside-comment-form t)
  (setq cider-save-file-on-load t)
  (setq cider-repl-pop-to-buffer-on-connect nil))

(add-hook 'cider-repl-mode-hook '(lambda () (setq scroll-conservatively 101)))


(use-package exec-path-from-shell
  :ensure t
   :config
   (exec-path-from-shell-initialize)
   (exec-path-from-shell-copy-env "AWS_ACCESS_KEY_ID")
   (exec-path-from-shell-copy-env "AWS_SECRET_ACCESS_KEY")
   (exec-path-from-shell-copy-env "AM_PROFILE"))

(use-package flycheck-clj-kondo
  :ensure t)

(use-package clojure-mode
  :ensure t
  :config
  (require 'flycheck-clj-kondo))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init
  (smartparens-global-mode)
  :config
  (require 'smartparens-config)
  (sp-use-paredit-bindings)
  :hook
  ((clojure-mode . smartparens-strict-mode)))

(use-package es-mode
  :ensure t
  :defer t)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package disable-mouse
  :ensure t
  :config
  (global-disable-mouse-mode))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package ob-async
  :ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (elasticsearch . t)
   (sql . t)))

(setq sql-postgres-program "/usr/local/opt/libpq/bin/psql")

(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package savehist
  :ensure t
  :init
  (savehist-mode))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package yasnippet
  :ensure t
  :config(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

(setq org-adapt-indentation nil)          ;; Disable indentation of content below headlines
(setq org-edit-src-content-indentation 0) ;; Disable indentation of source blocks
(setq org-src-preserve-indentation nil)   ;; Disable indentation for exported source blocks
(setq org-indent-indentation-per-level 0) ;; Keep everything flush-left
