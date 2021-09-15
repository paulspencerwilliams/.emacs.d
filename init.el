(setq-default
 inhibit-startup-message t
 custom-file "~/.emacs.d/custom-file.el"
 fille-column 80
 create-lockfiles nil
 indent-tabs-mode nil
 auto-save-default nil
 enable-recursive-minibuffers t)

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(column-number-mode t)
(global-auto-revert-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode t)
(line-number-mode t)

(setq-default
 x-select-enable-clipboard t
 x-select-enable-primary t
 save-interprogram-paste-before-kill t
 apropos-do-all t)

(load-file custom-file)

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))


(setq company-idle-delay 0.0)

(use-package magit
  :ensure t)

(use-package spacemacs-common
  :ensure spacemacs-theme
  :config (load-theme 'spacemacs-dark t))

(use-package company
 :ensure t
 :defer t
 :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
 :init (global-company-mode))

(use-package cider
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
   :config
   (exec-path-from-shell-initialize)
   (exec-path-from-shell-copy-env "AWS_ACCESS_KEY_ID")
   (exec-path-from-shell-copy-env "AWS_SECRET_ACCESS_KEY"))

(use-package flycheck-clj-kondo
  :ensure t)

(use-package clojure-mode
  :ensure t
  :config
  (require 'flycheck-clj-kondo))

(use-package smartparens
  :ensure t
  :init
  (progn
    (use-package smartparens-config)
    (smartparens-global-strict-mode 1)
    (show-smartparens-global-mode 1))
  :config
  (progn
    (setq smartparens-strict-mode t)))

(use-package es-mode
  :ensure t
  :defer t)

(use-package restclient
  :ensure t)

(use-package ob-restclient
  :ensure t)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((elasticsearch . t)
   (sql . t)
   (restclient . t)))

(setq sql-postgres-program "/usr/local/opt/libpq/bin/psql")
