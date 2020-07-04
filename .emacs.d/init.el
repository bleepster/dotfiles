(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (theme-changer which-key use-package gruvbox-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; my configuration

(setq inhibit-startup-message t)
(tool-bar-mode -1)

(setq calendar-location-name "Cebu, PH")
(setq calendar-latitude 10)
(setq calendar-longitude 125)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package gruvbox-theme
  :ensure t)

(use-package theme-changer
  :ensure t
  :config
  (change-theme 'gruvbox-light-hard 'gruvbox-dark-soft))

(set-default-font "Iosevka Curly 12")

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer)
