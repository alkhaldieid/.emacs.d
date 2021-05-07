;; Global appearance configs"
;;disable welcome screen"

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; packages configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Packages Managers ;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(setq package-enable-at-startup nil)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-install 'use-package))

;(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Evil Stuff ;;;;;;;;;;;
;; Enable evil-leader (has to be enabled before evil-mode)

(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))
(require 'evil-leader)

;; evil-leader configs
;; (global-evil-leader-mode 1) Enable evil leader in every buffer where evil is enabled
(global-evil-leader-mode 1)


(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)

(use-package org
  :ensure t)

(org-babel-load-file "/home/alkhaldieid/.emacs.d/myinit.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("24714e2cb4a9d6ec1335de295966906474fdb668429549416ed8636196cb1441" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(describe-char-unidata-list
   '(name old-name general-category canonical-combining-class bidi-class decomposition decimal-digit-value digit-value numeric-value mirrored iso-10646-comment uppercase lowercase))
 '(package-selected-packages
   '(color-theme-modern faff-theme modus-vivendi-theme modus-operandi-theme poet-theme tao-theme alect-themes ample-zen-theme ample-theme gruvbox-theme monokai-theme zenburn-theme moe-theme cloud-theme parchment-theme ox-reveal org-projectile evil-nerd-commenter org-roam-server company-jedi ein conda better-defaults engine-mode unicode-fonts eyebrowse org-ref helm-company org-noter magit company-quickhelp treemacs-projectile treemacs-evil treemacs helm beacon dracula-theme powerline-evil yasnippet which-key use-package try synosaurus spacemacs-theme org-roam-bibtex evil-leader evil-commentary cyberpunk-theme company-anaconda auto-complete afternoon-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
