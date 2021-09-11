

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
