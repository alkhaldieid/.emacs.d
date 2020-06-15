
;; Global appearance configs"
;;disable welcome screen"

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; packages configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Packages Managers ;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
;; (setq package-enable-at-startup nil)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-install 'use-package))

(package-refresh-contents)


;; Enable evil-leader (has to be enabled before evil-mode)

(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))
(require 'evil-leader)

;; evil-leader configs
;; (global-evil-leader-mode 1) Enable evil leader in every buffer where evil is enabled
(global-evil-leader-mode 1)

;; load the evil-leader key-bindings file
(load-file "~/.emacs.d/userConfig/keybindings.el")
;; Enable Evil

(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)

;; yasnippet configs
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

; auto-complete configs
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))
;; Org Mode
;; org-roam

(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/doing/orgRoam")
      )
;; org-roam-bibtex
(use-package org-roam-bibtex
  :hook (org-roam-mode . org-roam-bibtex-mode)
)

(setq inhibit-startup-screen t)
;;disable menu and tool bars"
(menu-bar-mode 0)
(tool-bar-mode 0)

;; show paranthasis
(show-paren-mode 1)
;;set the default font"
(set-default-font "Ubuntu Mono-18")

;; auto-generated theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes
   (quote
    ("57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(org-roam-directory "~/doing/orgRoam")
 '(package-selected-packages
   (quote
    (org-roam-bibtex company-anaconda afternoon-theme cyberpunk-theme spacemacs-theme evil-leader evil company auto-complete yasnippet which-key try use-package)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
