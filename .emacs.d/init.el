;; no startup message
(setq inhibit-startup-message t)

;; turn of bell sounds
(setq visible-bell t)

;; keep a minimalist window
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

;; specify a frame size
(when window-system (set-frame-size (selected-frame) 80 40))

;; inform emacs of where I am, this will be used by the theme-changer below
(setq calendar-location-name "Cebu, PH")
(setq calendar-latitude 10)
(setq calendar-longitude 125)

;; set Iosevka as the main font
(set-frame-font "Iosevka Term Curly 12")

;; display line/column numbers everywhere
(column-number-mode)
(global-display-line-numbers-mode t)

;; install/enable package and set where to retrieve them
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; install/enable use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; install/enable package: evil
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; install/enable package: which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; install/enable package: gruvbox-theme 
(use-package gruvbox-theme
  :ensure t)

;; install/enable package: theme-changer
(use-package theme-changer
  :ensure t
  :config
  (change-theme 'gruvbox-light-hard 'gruvbox-dark-soft))

;; install/enable package: all the icons, required by doom-modeline
;; reuiqres `M-x all-the-icons-install-fonts` on first run
(use-package all-the-icons)

;; install/enable package: doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; emacs snippet from https://gitlab.com/spudlyo
(use-package org
  :ensure t
  :init
  (defun my-org-confirm-babel-evaluate (lang body)
    "Don't confirm squat."
    (not (member lang '("shell" "python"))))
  :config
  (setq org-startup-indented t
        org-babel-min-lines-for-block-output 1
        org-startup-folded "showeverything"
        org-startup-with-inline-images t
        org-src-preserve-indentation t
        org-use-speed-commands t
        org-hide-emphasis-markers t
        org-export-with-section-numbers nil
        org-export-with-toc t
        org-export-with-date nil
        org-export-time-stamp-file nil
        org-export-with-email t
        org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate
	org-babel-default-header-args
          (cons '(:noweb . "yes")
                (assq-delete-all :noweb org-babel-default-header-args))
        org-babel-default-header-args
          (cons '(:exports . "both")
                (assq-delete-all :exports org-babel-default-header-args))
        org-babel-default-header-args
          (cons '(:results . "output verbatim replace")
                (assq-delete-all :results org-babel-default-header-args)))
  (org-babel-do-load-languages 'org-babel-load-languages
   '((shell . t)
     (python . t))))

;; install/enable package: org-bullets
(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  :config
  (setq org-bullet-list '("◉" "☯" "✜" "☯" "►" "☯" "❖" "☯" "○" "☯" "◇" "☯" "✸")))

;; install/enable package: htmlize
(use-package htmlize
  :ensure t)

;; enable ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; emacs snippet from https://gitlab.com/spudlyo
;; UTF-8 all the things!
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(defalias 'list-buffers 'ibuffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(htmlize org-bullets doom-modeline all-the-icons theme-changer gruvbox-theme which-key evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
