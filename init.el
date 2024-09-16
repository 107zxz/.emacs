(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" default))
 '(package-selected-packages
   '(company zig-mode magit parrot quelpa-use-package quelpa which-key doom-themes exec-path-from-shell orderless vertico xah-fly-keys)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; Global Editor
(use-package emacs
  :init
  (tool-bar-mode 0)
  (menu-bar-mode 0))

(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))

(use-package quelpa
  :ensure t
  :config
  (quelpa '(quelpa-use-package
	    :fetcher git
	    :url "https://github.com/quelpa/quelpa-use-package.git"))
  (require 'quelpa-use-package))

(use-package parrot :quelpa (parrot :fetcher github :repo "107zxz/parrot" :files (:defaults "img"))
  :init
  (setq parrot-num-rotations nil)
  :config
  (parrot-mode)
  (parrot-start-animation))

(use-package magit
  :ensure t)

(use-package xah-fly-keys
  :ensure t
  :config
  (xah-fly-keys t)
  (define-key xah-fly-command-map (kbd "SPC / m") 'magit-status)
  (define-key xah-fly-command-map (kbd "SPC w f") 'project-find-file))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-palenight))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))


;;; Programming Languages
(use-package zig-mode
  :ensure t)
