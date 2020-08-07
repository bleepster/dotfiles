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

(require 'use-package)

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


(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  :config
  (setq org-bullet-list '("◉" "◎" "❖" "○" "►" "◇" "✸")))

(use-package htmlize
  :ensure t)

(set-default-font "Iosevka Curly 12")

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
 '(desktop-save t)
 '(desktop-restore-frames nil)
 '(desktop-path (list "~/.emacs.d/"))
 '(desktop-dirname "~/.emacs.d/"))
(desktop-save-mode 1)
