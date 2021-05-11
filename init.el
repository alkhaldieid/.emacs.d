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

(org-babel-load-file "/home/alkhaldieid/.emacs.d/README.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline success warning error])
 '(ansi-color-names-vector
   ["gray35" "#ff8059" "#44bc44" "#eecc00" "#2fafff" "#feacd0" "#00d3d0" "gray65"])
 '(awesome-tray-mode-line-active-color "#2fafff")
 '(awesome-tray-mode-line-inactive-color "#323232")
 '(custom-safe-themes
   '("cc2f32f5ee19cbd7c139fc821ec653804fcab5fcbf140723752156dc23cdb89f" "39a854967792547c704cbff8ad4f97429f77dfcf7b3b4d2a62679ecd34b608da" "24714e2cb4a9d6ec1335de295966906474fdb668429549416ed8636196cb1441" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(describe-char-unidata-list
   '(name old-name general-category canonical-combining-class bidi-class decomposition decimal-digit-value digit-value numeric-value mirrored iso-10646-comment uppercase lowercase))
 '(exwm-floating-border-color "#646464")
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-themes-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-themes-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-themes-fringe-yellow))
 '(highlight-tail-colors '(("#2f4a00" . 0) ("#00415e" . 20)))
 '(hl-todo-keyword-faces
   '(("HOLD" . "#cfdf30")
     ("TODO" . "#feacd0")
     ("NEXT" . "#b6a0ff")
     ("THEM" . "#f78fe7")
     ("PROG" . "#00d3d0")
     ("OKAY" . "#4ae8fc")
     ("DONT" . "#70c900")
     ("FAIL" . "#ff8059")
     ("BUG" . "#ff8059")
     ("DONE" . "#44bc44")
     ("NOTE" . "#f0ce43")
     ("KLUDGE" . "#eecc00")
     ("HACK" . "#eecc00")
     ("TEMP" . "#ffcccc")
     ("FIXME" . "#ff9977")
     ("XXX+" . "#f4923b")
     ("REVIEW" . "#6ae4b9")
     ("DEPRECATED" . "#bfd9ff")))
 '(ibuffer-deletion-face 'modus-themes-mark-del)
 '(ibuffer-filter-group-name-face 'modus-themes-mark-symbol)
 '(ibuffer-marked-face 'modus-themes-mark-sel)
 '(ibuffer-title-face 'modus-themes-pseudo-header)
 '(org-src-block-faces 'nil)
 '(package-selected-packages
   '(synonymous ivy org-roam color-theme-modern faff-theme modus-vivendi-theme modus-operandi-theme poet-theme tao-theme alect-themes ample-zen-theme ample-theme gruvbox-theme monokai-theme zenburn-theme moe-theme cloud-theme parchment-theme ox-reveal org-projectile evil-nerd-commenter org-roam-server company-jedi ein conda better-defaults engine-mode unicode-fonts eyebrowse org-ref helm-company org-noter magit company-quickhelp treemacs-projectile treemacs-evil treemacs helm beacon dracula-theme powerline-evil yasnippet which-key use-package try synosaurus spacemacs-theme org-roam-bibtex evil-leader evil-commentary cyberpunk-theme company-anaconda auto-complete afternoon-theme))
 '(pdf-view-midnight-colors '("#ffffff" . "#100f10"))
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#ff8059")
     (40 . "#feacd0")
     (60 . "#f78fe7")
     (80 . "#f4923b")
     (100 . "#eecc00")
     (120 . "#cfdf30")
     (140 . "#f8dec0")
     (160 . "#bfebe0")
     (180 . "#44bc44")
     (200 . "#70c900")
     (220 . "#6ae4b9")
     (240 . "#4ae8fc")
     (260 . "#00d3d0")
     (280 . "#c6eaff")
     (300 . "#2fafff")
     (320 . "#79a8ff")
     (340 . "#00bcff")
     (360 . "#b6a0ff")))
 '(vc-annotate-very-old-color nil)
 '(xterm-color-names
   ["black" "#ff8059" "#44bc44" "#eecc00" "#2fafff" "#feacd0" "#00d3d0" "gray65"])
 '(xterm-color-names-bright
   ["gray35" "#f4923b" "#70c900" "#cfdf30" "#79a8ff" "#f78fe7" "#4ae8fc" "white"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
